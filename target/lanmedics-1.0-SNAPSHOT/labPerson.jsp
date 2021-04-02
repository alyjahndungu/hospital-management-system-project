
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Staff" %>
<%@ page import="com.lanmedics.lanmedics.prescription.Lab" %>
<%@ page import="java.util.ArrayList" %>
<%  
		if(request.getAttribute("labPerson")==null || request.getAttribute("labs")==null){
			 response.sendRedirect("labPerson"); 
		}
		else{
			Staff labPerson = (Staff)request.getAttribute("labPerson");
			ArrayList<ArrayList<Lab>> labs = (ArrayList<ArrayList<Lab>>)request.getAttribute("labs");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lab Person Dashboard</title>
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
					<div class="col-sm-12">
						<div id="openLabs">
							<h6 class="text-primary" style="margin-top: 20px"><b>Open Laboratory Reports</b></h6>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Report ID</th>
										<th>Doctor Name</th>
										<th>Lab Name</th>
										<th>Test For</th>
										<th>Lab Result</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<% ArrayList<Lab> openLabs = labs.get(0);
											for(int i=0; i<openLabs.size(); i++) { 
												Lab lab = openLabs.get(i);
											%>
									<tr>
										<td class="padding-up"><%=lab.getLabId() %></td>
										<td class="padding-up"><%=lab.getDoctor().getFirstName() + " " + lab.getDoctor().getLastName() %></td>
										<td class="padding-up"><%=lab.getLabName() %></td>
										<td class="padding-up"><%=lab.getTestFor() %></td>
										<form action="submitLabReport" method="post">
											<input type="hidden" name="labId"
												value="<%= lab.getLabId() %>">
												<input type="hidden" name="itemId"
												value="<%= lab.getItemId() %>">
											<td><input type="text" class="form-control"
												placeholder="Result" name="result" required></td>
											<td><button type="submit" class="btn btn-default">Submit</button></td>
										</form>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
						<div id="closedLabs" style="display: none;">
							<h6 class="text-secondary" style="margin-top: 20px"><b>Closed Laboratory Reports</b></h6>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Report ID</th>
										<th>Doctor Name</th>
										<th>Lab Name</th>
										<th>Test For</th>
										<th>Lab Result</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<% ArrayList<Lab> closedLabs = labs.get(1);
											for(int i=0; i<closedLabs.size(); i++) { 
												Lab lab = closedLabs.get(i);
											%>
									<tr>
										<td><%=lab.getLabId() %></td>
										<td><%=lab.getDoctor().getFirstName() + " " + lab.getDoctor().getLastName() %></td>
										<td><%=lab.getLabName() %></td>
										<td><%=lab.getTestFor() %></td>
										<td><%=lab.getLabResult() %></td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
						</tbody>
						</table>
					</div>
				</div>
				<br>
				<div class="row text-center">
					<div class="col-sm-12">
						<div class="panel panel-primary">
							<div class="panel-heading">Last Login</div>
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

	<script type="text/javascript">
                $('#closedLabReports').on('click',function(){
                	$("#closedLabs").show();
                	$("#openLabs").hide();
                	$("#closedLabReports").toggleClass("activeReports");
                	$("#openLabReports").toggleClass("notActiveReports");
            });
    </script>
	<script type="text/javascript">
                $('#openLabReports').on('click',function(){
                	$("#closedLabs").hide();
                	$("#openLabs").show();
                	$("#closedLabReports").toggleClass("notActiveReports");
                	$("#openLabReports").toggleClass("activeReports");
            });
    </script>
</body>
</html>
<%
		}
%>