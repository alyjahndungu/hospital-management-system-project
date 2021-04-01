package com.lanmedics.lanmedics.patient.servlet;

import com.lanmedics.lanmedics.database.DatabaseHelper;
import com.lanmedics.lanmedics.modal.Appointment;
import com.lanmedics.lanmedics.patient.modal.Patient;
import com.lanmedics.lanmedics.prescription.Lab;
import com.lanmedics.lanmedics.prescription.Prescription;

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
 * Servlet implementation class PatientAppointmentDetails
 */
@WebServlet("/patientAppointmentDetails")
public class PatientAppointmentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientAppointmentDetails() {
		super();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		// redirect to login
		redirectToLogin(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get appointmentDetails from DB
		try {
			HttpSession session = request.getSession();
			int patientId = (int) session.getAttribute("UserID");
			int appointmentId = Integer.parseInt((String) request.getParameter("appointmentId"));
			// get appointment details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Appointment appointment = databaseHelper.getDetailedAppointment(appointmentId);
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(patientId, "patientId");
			ArrayList<Prescription> prescriptions = databaseHelper.getPrescription();
			ArrayList<Lab> labs = databaseHelper.getLab();
			Patient patient = databaseHelper.getPatient(patientId);
			if (appointment == null || patient == null || appointments == null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to person detailed appointment
			RequestDispatcher rs = request.getRequestDispatcher("patientDetailedAppointment.jsp");
			request.setAttribute("appointment", appointment);
			request.setAttribute("patient", patient);
			request.setAttribute("appointments", appointments);
			request.setAttribute("prescriptions", prescriptions);
			request.setAttribute("labs", labs);
			rs.forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			// redirect to login
			redirectToLogin(request, response);
		}
	}

	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		rs.forward(request, response);
	}

}
