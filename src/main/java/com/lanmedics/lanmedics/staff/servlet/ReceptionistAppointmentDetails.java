package com.lanmedics.lanmedics.staff.servlet;

import com.lanmedics.lanmedics.database.DatabaseHelper;
import com.lanmedics.lanmedics.modal.Appointment;
import com.lanmedics.lanmedics.prescription.Lab;
import com.lanmedics.lanmedics.prescription.Prescription;
import com.lanmedics.lanmedics.staff.modal.Doctor;
import com.lanmedics.lanmedics.staff.modal.Staff;

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
 * Servlet implementation class ReceptionistAppointmentDetails
 */
@WebServlet("/receptionistAppointmentDetails")
public class ReceptionistAppointmentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceptionistAppointmentDetails() {
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
		return;
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
			int userId = (int) session.getAttribute("UserID");
			int appointmentId = Integer.parseInt((String) request.getParameter("appointmentId"));
			// get appointment details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Appointment appointment = databaseHelper.getDetailedAppointment(appointmentId);
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(userId, null);
			ArrayList<Prescription> prescriptions = databaseHelper.getPrescription();
			ArrayList<Lab> labs = databaseHelper.getLab();
			Staff receptionist = databaseHelper.getStaff(userId);
			
			if (appointment != null && receptionist != null && appointments != null) {
				if (appointment.getAllocatedDate() == 0) {
					
					ArrayList<Doctor> doctors = databaseHelper.getDoctors();
					if (doctors == null) {
						// redirect to login
						redirectToLogin(request, response);
						return;
					} else {
						// redirect to receptionist detailed appointment
						RequestDispatcher rs = request.getRequestDispatcher("receptionistDetailedAppointment.jsp");
						request.setAttribute("appointment", appointment);
						request.setAttribute("receptionist", receptionist);
						request.setAttribute("appointments", appointments);
						request.setAttribute("doctors", doctors);
						request.setAttribute("prescriptions", prescriptions);
						request.setAttribute("labs", labs);
						rs.forward(request, response);
						return;
					}
				}else
				{
					// redirect to receptionist detailed appointment
					RequestDispatcher rs = request.getRequestDispatcher("receptionistDetailedAppointment.jsp");
					request.setAttribute("appointment", appointment);
					request.setAttribute("receptionist", receptionist);
					request.setAttribute("appointments", appointments);
					request.setAttribute("prescriptions", prescriptions);
					request.setAttribute("labs", labs);
					rs.forward(request, response);
					return;
				}

			}

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
