
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Staff" %>
<%@ page import="com.lanmedics.lanmedics.modal.Appointment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Doctor" %>
<%  
		if(request.getAttribute("receptionist")==null){
			 response.sendRedirect("receptionist"); 
		}
		else{
			Staff receptionist = (Staff)request.getAttribute("receptionist");
			ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile - Receptionist Dashboard</title>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">


</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="receptionist">Central Medic Center</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="receptionist">Dashboard</a></li>
					<li class="active"><a href="#">Edit Profile</a></li>
					<li><a href="logout">Logout</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active">

						<div class="row intro">
							<div class="col-sm-12 col-md-6 col-lg-4">
								<div class="">
									<img class="profilePic" src="media/receptionist.png">
								</div>
							</div>
							<div class="col-sm-12 col-md-6 col-lg-8 info">
								<br> <span class="name"><%= receptionist.getFirstName() +" " + receptionist.getLastName() %></span><br>
								<img src="media/gender.png"><span class="details">
									<%= receptionist.getGender() +", " + receptionist.getAge() %></span><br> <img
									src="media/degree.png"><span class="degree"> Receptionist</span><br>
								<img src="media/Location.png"><span class="location">
									<%= receptionist.getAddress() %></span>
							</div>
						</div>
						<li class="topic"><span class="upcoming">Unallocated
							Appointment</span> <% ArrayList<Appointment> unallocatedAppointments = arrayList.get(0);
			        	for(int i=0; i<unallocatedAppointments.size(); i++)
			        	{ Appointment appointment = unallocatedAppointments.get(i);
	        			%>
						<form class="form-signin" action="receptionistAppointmentDetails"
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
					<li class="topic">Allocated Appointment <% ArrayList<Appointment> allocatedAppointments = arrayList.get(1);
			        	for(int i=0; i<allocatedAppointments.size(); i++)
			        	{ Appointment appointment = allocatedAppointments.get(i);
	        			%>
						<form class="form-signin" action="receptionistAppointmentDetails"
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
				<h1 class="page-header" style="text-align: center">
					 Edit Profile 
				</h1>
				<h4 class="sub-header">Personal Information</h4>
				<form class="form-horizontal" action="editReceptionistProfile"
					method="post">
					<div class="form-group">
						<label  class="col-sm-2 control-label">First
							Name</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= receptionist.getFirstName() %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Last
							Name</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= receptionist.getLastName() %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Gender</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= receptionist.getGender() %></p>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">Date Of
							Birth</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="dob" id="date"
								placeholder="Date" value="<%= receptionist.getStringDob() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="col-sm-2 control-label">Phone
							Number</label>
						<div class="col-sm-10">
							<input type="tel" class="form-control"
								name="contactNumber" id="phoneNumber"
								placeholder="+91 9521113802"
								value="<%= receptionist.getContactNumber() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Address</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="2" name="address"
								placeholder="BH-3, The LNMIIT"> <%= receptionist.getAddress() %></textarea>
						</div>
					</div>
					<h4 class="sub-header">Account Information</h4>
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label">User
							Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userName"
								placeholder="ternstone@gmail.com" value="<%= receptionist.getEmail() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="password">
						</div>
					</div>
					<!-- 	<div class="form-group">
						<label for="emailAddress" class="col-sm-2 control-label">Email
							Address</label>
						<div class="col-sm-10">
							<input type="string" class="form-control" id="emailAddress"
								placeholder="rakeshsharma.y15@gmail.com" value="">
						</div>
					</div>-->
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-2">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
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