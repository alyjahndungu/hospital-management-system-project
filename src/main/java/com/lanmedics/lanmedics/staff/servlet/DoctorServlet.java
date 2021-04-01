	package com.lanmedics.lanmedics.staff.servlet;

import com.lanmedics.lanmedics.database.DatabaseHelper;
import com.lanmedics.lanmedics.modal.Appointment;
import com.lanmedics.lanmedics.patient.modal.DashBoard;
import com.lanmedics.lanmedics.staff.modal.Doctor;
import com.lanmedics.lanmedics.utils.DashUtils;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

    /**
     * Servlet implementation class DoctorServlet
     */
    @WebServlet("/doctor")
    public class DoctorServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
        HttpSession session;   
        /**
         * @see HttpServlet#HttpServlet()
         */
        public DoctorServlet() {
            super();
           
        }
    
        /**
         * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
         */
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            try {
                session = request.getSession();
                if (session.isNew()){
                    redirectToLogin(request, response);
                     }
                else{
                
                int userId = (int) session.getAttribute("UserID");
                // get doctor details
                DatabaseHelper databaseHelper = new DatabaseHelper();
                DashBoard dashBoard = new DashBoard(databaseHelper.getAppointmentCount(userId,"doctorId"),
                        databaseHelper.getPatientCount(userId), DashUtils.getProfileRating(userId, 2));
                Doctor doctor = databaseHelper.getDoctor(userId);
                ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(userId, "doctorId");
                if (doctor == null || appointments == null) {
                    // redirect to login
                    redirectToLogin(request, response);
                    return;
                }
                // redirect to doctor dashboard
                RequestDispatcher rs = request.getRequestDispatcher("doctor.jsp");
                request.setAttribute("doctor", doctor);
                request.setAttribute("appointments", appointments);
                request.setAttribute("dashBoard", dashBoard);
                rs.forward(request, response);
                return;
                }
            } catch (Exception e) {
                // redirect to login
                redirectToLogin(request, response);
            }
        }
    
        /**
         * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
         */
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            doGet(request, response);
        }
        
        private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
            request.setAttribute("error", "Please login again");
            rs.forward(request, response);
        }
    }
