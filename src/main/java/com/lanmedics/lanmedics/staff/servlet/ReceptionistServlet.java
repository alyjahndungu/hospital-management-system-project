package com.lanmedics.lanmedics.staff.servlet;

import com.lanmedics.lanmedics.database.DatabaseHelper;
import com.lanmedics.lanmedics.modal.Appointment;
import com.lanmedics.lanmedics.patient.modal.DashBoard;
import com.lanmedics.lanmedics.staff.modal.Staff;
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
@WebServlet("/receptionist")
public class ReceptionistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceptionistServlet() {
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
			// get receptionist details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			DashBoard dashBoard = new DashBoard(DashUtils.getUnapprovedAppointment(),
					DashUtils.getTotalAppointment(),DashUtils.getProfileRating(userId, 5));
			Staff receptionist = databaseHelper.getStaff(userId);
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(userId, null);
			if (receptionist == null || appointments == null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to receptionist dashboard
			RequestDispatcher rs = request.getRequestDispatcher("receptionist.jsp");
			request.setAttribute("receptionist", receptionist);
			request.setAttribute("dashBoard", dashBoard);
			request.setAttribute("appointments", appointments);
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
