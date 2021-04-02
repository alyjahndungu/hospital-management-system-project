
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lanmedics.lanmedics.patient.modal.Patient" import="com.lanmedics.lanmedics.modal.Appointment"
		 import="java.util.ArrayList" import="com.lanmedics.lanmedics.patient.modal.DashBoard"
		 import="com.lanmedics.lanmedics.staff.modal.Doctor"
%>
<%  
		if(request.getAttribute("patient")==null || request.getAttribute("appointments")==null || request.getAttribute("dashBoard") == null){
			 response.sendRedirect("patient"); 
		}
		else{
			Patient patient = (Patient)request.getAttribute("patient");
			ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
			DashBoard dashBoard = (DashBoard)request.getAttribute("dashBoard");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient Dashboard</title>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button
					class="navbar-toggler"
					type="button"
					data-mdb-toggle="collapse"
					data-mdb-target="#navbarLeftAlignExample"
					aria-controls="navbarLeftAlignExample"
					aria-expanded="false"
					aria-label="Toggle navigation"
			>
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarLeftAlignExample">
				<a class="navbar-brand" href="patient"><b>CarePath</b></a>
				<!-- Left links -->
				<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
					<li class="nav-item ">
						<a class="nav-link text-secondary" href="openBookAppointment"><b>Book
							Appointment</b></a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="patient">Dashboard</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="updatePatientProfile">Edit Profile</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="logout"
						>Logout</a
						>
					</li>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->
		</div>
		<!-- Container wrapper -->
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 sidebar">
				<ul class="nav nav-sidebar">
					<div style="display: block">
						<div class="row">
							<div class="col-sm-12">
								<div style="margin-top: 20px">
									<img height="100" width="100" src="media/user.png">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12">
								<br> <h5 class="text-primary"><b><%= patient.getFirstName() + " " + patient.getLastName() %></b></h5><br>
								<img src="media/gender.png"><span class="details">
									<%= patient.getGender() +", " + patient.getAge() %></span><br> <img
									src="media/bloodGroup.png"><span class="blood"> <%= patient.getBloodGroup() %></span><br>
								<img src="media/Location.png"><span class="location">
									<%= patient.getAddress() %></span>
							</div>
						</div>
					</div>

					<li class="topic"><span class="upcoming">Upcoming
							Appointment</span> <% ArrayList<Appointment> appointments = arrayList.get(0);
			        	for(int i=0; i<appointments.size(); i++)
			        	{ Appointment appointment = appointments.get(i);
	        			%>
						<form  action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" />
							<ul>
								<li class="subtopic">
									<button class="btn btn-default" type="submit">
										<div class="row">
											<div class="col-sm-12 text-left">
												<div>
													<b><%= appointment.getTitle() %> </b><br>
													<% Doctor doctor = appointment.getDoctor();
												if(doctor==null){
											%>Waiting for doctor approval
													<% }else{ %>
													<%= doctor.getFirstName() %>
													<% } %>
													|
													<%= appointment.getStringDateCreated() %>
												</div>
											</div>
										</div>
									</button>
								</li>
							</ul>
						</form>

								<%  }
						        	
				        %>
				    </li>
					<li class="topic">Recent Appointment <% ArrayList<Appointment> appointments2 = arrayList.get(1);
			        	for(int i=0; i<appointments2.size(); i++)
			        	{ Appointment appointment = appointments2.get(i);
	        			%>
						<form class="form-signin" action="patientAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" /> 
								<ul>
									<li class="subtopic">
										<button class="btn btn-default" type="submit">
											<div class="row">
												<div class="col-sm-12 text-left">
													<b><%= appointment.getTitle() %> </b><br>
													<% Doctor doctor = appointment.getDoctor();
													if(doctor==null){
												%>Waiting for doctor approval
													<% }else{ %>
													<%= doctor.getFirstName() %>
													<% } %>
													|
													<%= appointment.getStringDateCreated() %>
												</div>
											</div>
										</button>
									</li>
								</ul>
							</form>
									<%  }
					        %>
					</li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 main">
				<h5 class="page-header" style="margin-top: 50px">Dashboard</h5>
				<div class="row">
					<div class="col-sm-3">
						<div class="card bg-secondary">
							<div class="card-header text-center">
								<img width="50" height="50" src="media/appointment.png">
							</div>
							<div class="card-text text-center"> <span class="text-white"><b><%= dashBoard.getNoOfAppointment() %></b></span> Appointments</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card bg-secondary">
							<div class="card-header text-center">
								<img width="50" height="50" src="media/bmi.png">
							</div>
							<div class="card-text text-center">BMI : <span class="text-white"><b><%= dashBoard.getBmi() %></b></span></div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card bg-secondary">
							<div class="card-header text-center">
								<img width="50" height="50" src="media/prescription.png">
							</div>
							<div class="card-text text-center"><span class="text-white"><b><%= dashBoard.getNoOfMedicines() %></b></span> Medicines</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="card bg-secondary">
							<div class="card-header text-center">
								<img width="50" height="50" src="media/edit.png">
							</div>
							<div class="card-text text-center"><span class="text-white"><b><%= dashBoard.getPercentProfile() %>%</b></span> Profile</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row text-center">
					<div class="col-sm-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								Last Login
							</div>
							<div class="panel-body">
								<%= session.getAttribute("LastAccess") %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>

</body>
</html>
<%
		}
%>