
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Staff" %>
<%@ page import="com.lanmedics.lanmedics.modal.Appointment" %>
<%@ page import="com.lanmedics.lanmedics.patient.modal.DashBoard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Doctor" %>
<%  
		if(request.getAttribute("receptionist")==null || request.getAttribute("appointments")==null ){
			 response.sendRedirect("receptionist"); 
		}
		else{
			Staff receptionist = (Staff)request.getAttribute("receptionist");
			ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
			DashBoard dashBoard = (DashBoard)request.getAttribute("dashBoard");
			
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Receptionist Dashboard</title>
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
				<a class="navbar-brand" href="receptionist"><b>CarePath</b></a>
				<!-- Left links -->
				<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">Dashboard</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="updateReceptionistProfile">Edit Profile</a>
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
									<img height="100" width="100" src="media/receptionist.png">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12">
								<br> <h5 class="text-primary"><b><%= receptionist.getFirstName() +" " + receptionist.getLastName() %></b></h5><br>
								<img src="media/gender.png"><span class="details">
									<%= receptionist.getGender() +", " + receptionist.getAge() %></span><br> <img
									src="media/degree.png"><span class="degree"> Receptionist</span><br>
								<img src="media/Location.png"><span class="location">
									<%= receptionist.getAddress() %></span>
							</div>
						</div>
					</div>
<%--					<li class="active">--%>
<%--					--%>

<%--					</li>--%>
					<li style="margin-top: 20px"><span class="upcoming"><b>Unallocated
						Appointment</b></span> <% ArrayList<Appointment> unallocatedAppointments = arrayList.get(0);
			        	for(int i=0; i<unallocatedAppointments.size(); i++)
			        	{ Appointment appointment = unallocatedAppointments.get(i);
	        			%>
						<form class="form" action="receptionistAppointmentDetails"
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
													<% if(appointment.getDisease()!=null) { %>
													<%= appointment.getDisease() + " | " %>
													<%  } %>
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
					<li class="topic"><b>Allocated Appointment</b> <% ArrayList<Appointment> allocatedAppointments = arrayList.get(1);
			        	for(int i=0; i<allocatedAppointments.size(); i++)
			        	{ Appointment appointment = allocatedAppointments.get(i);
	        			%>
						<form  action="receptionistAppointmentDetails"
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
				<h5 class="page-header" style="margin-top: 50px"><b>Dashboard</b></h5>
				<div class="row">
					<div class="col-sm-4">
						<div class="card bg-info">
							<div class="card-header text-center">
								<img height="50" width="50" src="media/appointment.png">
							</div>
							<div class="card-text text-center"><%= dashBoard.getNoOfAppointment() %> Appointment Request</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card bg-info">
							<div class="card-header text-center">
								<img height="50"  width="50" src="media/bmi.png">
							</div>
						<div class="card-text text-center"><%= dashBoard.getPatientCount() %> Total Appointments</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card bg-info">
							<div class="card-header text-center">
								<img width="50" height="50" src="media/edit.png">
							</div>
							<div class="card-text text-center"><%= dashBoard.getPercentProfile() %>% Profile</div>
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