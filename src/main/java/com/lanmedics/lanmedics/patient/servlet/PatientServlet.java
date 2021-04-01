package com.lanmedics.lanmedics.patient.servlet;

import com.lanmedics.lanmedics.database.DatabaseHelper;
import com.lanmedics.lanmedics.modal.Appointment;
import com.lanmedics.lanmedics.patient.modal.DashBoard;
import com.lanmedics.lanmedics.patient.modal.Patient;
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
 * Servlet implementation class Patient
 */
@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientServlet() {
		super();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			session = request.getSession();
			if (session.isNew()){
				redirectToLogin(request, response);
				 }
			else{
			
			int userId = (int) session.getAttribute("UserID");
			// get patient details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Patient patient = databaseHelper.getPatient(userId);
			DashBoard dashBoard = new DashBoard(databaseHelper.getAppointmentCount(userId,"patientId"),
					DashUtils.getBMI(patient.getHeight(), patient.getWeight()),DashUtils.getMedicineCount(userId),DashUtils.getProfileRating(userId, 1));
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(userId, "patientId");
			if (patient == null || appointments == null || dashBoard == null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to person dashboard
			RequestDispatcher rs = request.getRequestDispatcher("patient.jsp");
			request.setAttribute("patient", patient);
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
	
 
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
 

	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		rs.forward(request, response);
	}

}
