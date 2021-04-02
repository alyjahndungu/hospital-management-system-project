<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Staff" %>

<%  
		if(request.getAttribute("labPerson")==null){
			 response.sendRedirect("labPerson"); 
		}
		else{
			Staff labPerson = (Staff)request.getAttribute("labPerson");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Profile - Lab Person Dashboard</title>
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
			<a class="navbar-brand" href="labPerson"><b>CarePath</b></a>
			<!-- Left links -->
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">

				<li  class="nav-item">
					<a class="nav-link text-primary" id="openLabReports"><b>Open
						Lab Reports</b></a>
				</li>
				<li  class="nav-item">
					<a class="nav-link text-secondary" id="closedLabReports"><b>Closed
						Lab Reports</b></a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="labPerson">Dashboard</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="updateLabPersonProfile">Edit Profile</a>
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
					<div style="display:block;">
						<div class="row">
							<div class="col-sm-12">
								<div style="margin-top: 20px">
									<img height="100" width="100" src="media/labPerson.png">
								</div>
							</div>

						</div>

						<div class="row">
							<div class="col-sm-12">
								<br> <h5 class="text-primary"><%= labPerson.getFirstName() +" " + labPerson.getLastName() %></h5><br>
								<img src="media/gender.png"><span class="details">
									<%= labPerson.getGender() +", " + labPerson.getAge() %></span><br>
								<img src="media/degree.png"><span class="degree">
									Lab Person</span><br> <img src="media/Location.png"><span
									class="location"> <%= labPerson.getAddress() %></span>
							</div>
						</div>
					</div>
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
				<form class="form-horizontal" action="editLabPersonProfile"
					method="post">
					<h4 class="sub-header" style="margin-top: 20px">Personal Information</h4>
					<div class="row mb-4">
						<div class="col">
							<div class="form-group">
								<label class="form-label text-primary">Full
									Name</label>
								<div class="form-outline mb-4 ">
									<p class="form-control-static"><%= labPerson.getFirstName() + " " + labPerson.getLastName() %></p>
								</div>
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="form-label text-primary">Gender</label>
								<div class="form-outline mb-4">
									<p class="form-control-static"><%= labPerson.getGender() %></p>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="form-label text-primary">Date Of
							Birth</label>
						<div class="form-group">
							<input type="date" class="form-control" name="dob" id="date"
								placeholder="Date" value="<%= labPerson.getStringDob() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="form-label text-primary">Phone
							Number</label>
						<div class="form-group">
							<input type="tel" class="form-control"
								name="contactNumber" id="phoneNumber"
								placeholder="+91 9521113802"
								value="<%= labPerson.getContactNumber() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="form-label text-primary">Address</label>
						<div class="form-group">
							<textarea class="form-control" rows="2" name="address"
								> <%= labPerson.getAddress() %></textarea>
						</div>
					</div>
					<h4 class="sub-header">Account Information</h4>
					<div class="form-group">
						<label for="userName" class="form-label text-primary">Email Address</label>
						<div class="form-group">
							<input type="email" class="form-control" id="userName"
								placeholder="ternstone@gmail.com" value="<%= labPerson.getEmail() %>">
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