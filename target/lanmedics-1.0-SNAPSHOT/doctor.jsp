<%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 25/03/21
  Time: 09:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lanmedics.lanmedics.patient.modal.Patient" import="com.lanmedics.lanmedics.modal.Appointment" import="java.util.ArrayList"
%>
<%@ page import="com.lanmedics.lanmedics.patient.modal.DashBoard" %>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Doctor" %>
<%
    if(request.getAttribute("doctor")==null || request.getAttribute("appointments")==null){
        response.sendRedirect("doctor");
    }
    else{
        Doctor doctor = (Doctor)request.getAttribute("doctor");
        ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
        DashBoard dashBoard = (DashBoard)request.getAttribute("dashBoard");
%>
<!DOCTYPE html>
<html>
<head>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">


    <title>Doctor Dashboard</title>
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
                            <br> <h5 class="text-primary"><b><%= doctor.getFirstName() +" " + doctor.getLastName() %></b></h5><br>
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
                <li style="margin-top: 50px"><span class="upcoming">Upcoming
							Appointment</span>
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
                <li class="topic">Recent Appointment
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
            <h5 class="page-header" style="margin-top: 50px">Dashboard</h5>
            <div class="row">
                <div class="col-sm-4">
                    <div class="card bg-info">
                        <div class="card-header text-center">
                            <img width="50" height="50" src="media/appointment.png">
                        </div>
                        <div class="card-text text-center"><b><%= dashBoard.getNoOfAppointment() %></b> Appointments</div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card bg-info">
                        <div class="card-header text-center">
                            <img width="50" height="50" src="media/patient.png">
                        </div>
                        <div class="card-text text-center"><b><%= dashBoard.getPatientCount() %></b> Patients Treated</div>
                    </div>
                </div>
                <!-- 				<div class="col-sm-4">
                                        <div class="card">
                                            <div class="cardImage">
                                                <img src="media/prescription.png">
                                            </div>
                                            <div class="cardText">4 Medicines</div>
                                        </div>
                                    </div>-->
                <div class="col-sm-4">
                    <div class="card bg-info">
                        <div class="card-header text-center">
                            <img width="50" height="50" src="media/edit.png">
                        </div>
                        <div class="card-text text-center"><b><%= dashBoard.getPercentProfile() %>%</b> Profile</div>
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