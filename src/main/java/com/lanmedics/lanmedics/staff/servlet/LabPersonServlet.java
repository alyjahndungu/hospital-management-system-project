package com.lanmedics.lanmedics.staff.servlet;

import com.lanmedics.lanmedics.database.DatabaseHelper;
import com.lanmedics.lanmedics.prescription.Lab;
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
 * Servlet implementation class DoctorServlet
 */
@WebServlet("/labPerson")
public class LabPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LabPersonServlet() {
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
			// get labPerson details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Staff labPerson = databaseHelper.getStaff(userId);
			ArrayList<ArrayList<Lab>> labs = databaseHelper.getAllLabForLabPerson();
			if (labPerson == null || labs ==null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to labPerson dashboard
			RequestDispatcher rs = request.getRequestDispatcher("labPerson.jsp");
			request.setAttribute("labPerson", labPerson);
			request.setAttribute("labs", labs);
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
