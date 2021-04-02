<%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 24/03/21
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Doctor" %>
<%@ page import="com.lanmedics.lanmedics.modal.Appointment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lanmedics.lanmedics.patient.modal.Patient" %>
<%  
		if(request.getAttribute("doctor")==null || request.getAttribute("appointments")==null){
			 response.sendRedirect("doctor"); 
		}
		else{
			Doctor doctor = (Doctor)request.getAttribute("doctor");
			ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile - Doctor Dashboard</title>
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
			<a class="navbar-brand" href="doctor"><b>CarePath</b></a>
			<!-- Left links -->
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="doctor">Dashboard</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="updateDoctorProfile">Edit Profile</a>
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
									<img height="100" width="100" src="media/doctor.png">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12">
								<br> <h5 class="text-primary"><b><%= doctor.getFirstName() + " " + doctor.getLastName() %></b></h5><br>
								<img src="media/gender.png"><span class="details">
									<%= doctor.getGender() +", " + doctor.getAge() %></span><br> <img
									src="media/degree.png"><span class="blood"> <%= doctor.getDegree() %></span><br>
								<img src="media/specialization.png"><span class="location">
									<%= doctor.getSpecialization() %></span>
							</div>
						</div>
					</div>
					<%--<li class="active">--%>
					<%--					--%>

					<%--</li>--%>
					<li style="margin-top: 20px"><span class="upcoming"><b>Upcoming
						Appointment</b></span>
							<% 
								ArrayList<Appointment> upcomingAppointments = arrayList.get(0);
					        	for(int i=0; i<upcomingAppointments.size(); i++)
					        	{ Appointment appointment = upcomingAppointments.get(i);
		        			%>
							<form class="form" action="doctorAppointmentDetails"
								method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" />
							<ul>
								<li class="subtopic">
									<button class="btn btn-default" type="submit">
										<div class="row">
											<div class="col-sm-12 text-left">
												<b><%= appointment.getTitle() %> </b><br>
												<% Patient patient = appointment.getPatient();
												if(patient==null){
											%>Waiting for doctor approval
												<% }else{ %>
												<%= patient.getFirstName() %>
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
					<li class="topic"><b>Recent Appointment</b>
						<%
							ArrayList<Appointment> appointments2 = arrayList.get(1);
				        	for(int i=0; i<appointments2.size(); i++)
				        	{ Appointment appointment = appointments2.get(i);
	        			%>
						<form  action="doctorAppointmentDetails"
							method="post">
							<input type="hidden" class="form-control" name="appointmentId"
								value="<%= appointment.getId() %>" />
							<ul>
								<li class="subtopic">
									<button class="btn btn-default" type="submit">
										<div class="row">
											<div class="col-sm-12 text-left">
												<b><%= appointment.getTitle() %> </b><br>
												<% Patient patient = appointment.getPatient();
												if(patient==null){
											%>Waiting for doctor approval
												<% }else{ %>
												<%= patient.getFirstName() %>
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
				<div class="row">
					<div class="col-md">
						<h4 class="page-header" style="text-align: center">
							Edit Profile
						</h4>
					</div>
					<div class="col-md-4">
				<form class="form-horizontal" action="editDoctorProfile"
					method="post">

					<h4 class="sub-header">Personal Information</h4>
					<div class="row mb-4">
						<div class="col">
							<div class="form-group">
								<label class="form-label text-primary">Full
									Name</label>
								<div class="form-outline mb-4 ">
									<p class="form-control-static"><%= doctor.getFirstName() + " " + doctor.getLastName() %></p>
								</div>
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="form-label text-primary">Gender</label>
								<div class="form-outline mb-4">
									<p class="form-control-static"><%= doctor.getGender() %></p>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="form-label text-primary">Date Of
							Birth</label>
						<div class="form-group">
							<input type="date" class="form-control" name="dob" id="date"
								placeholder="Date" value="<%= doctor.getStringDob() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="form-label text-primary">Phone
							Number</label>
						<div class="form-group">
							<input type="tel" class="form-control"
								name="contactNumber" id="phoneNumber"
								placeholder="+91 9521113802"
								value="<%= doctor.getContactNumber() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="form-label text-primary">Address</label>
						<div class="form-group">
							<textarea class="form-control" rows="2" name="address"> <%= doctor.getAddress() %></textarea>
						</div>
					</div>
					<h4 class="sub-header">Medical Information</h4>
					<div class="form-group">
						<label class="form-label text-primary">Degree</label>
						<div class="form-group">
							<input type="text" class="form-control" name="degree" id="degree"
								placeholder="MBBS etc." value="<%= doctor.getDegree() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="specialization" class="form-label text-primary">Specialization</label>
						<div class="form-group">
							<textarea class="form-control" id="specialization" rows="2" name="specialization"> <%= doctor.getSpecialization() %></textarea>
						</div>
					</div>
					<h4 class="sub-header">Account Information</h4>
					<div class="form-group">
						<label for="userName" class="form-label text-primary">Email Address</label>
						<div class="form-group">
							<input type="email" class="form-control" id="userName"
								placeholder="" value="<%= doctor.getEmail() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="form-label text-primary">Password</label>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="password">
						</div>
					</div>

					<!-- Submit button -->
					<button type="submit" class="btn btn-primary btn-block mb-4">Submit</button>

				</form>
			</div>
			<div class="col-md">
			</div>
		</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQuery -->
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