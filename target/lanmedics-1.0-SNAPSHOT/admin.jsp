<%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 24/03/21
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page
        import="com.lanmedics.lanmedics.staff.modal.Staff, com.lanmedics.lanmedics.patient.modal.Patient, com.lanmedics.lanmedics.staff.modal.Doctor, java.util.ArrayList,
com.lanmedics.lanmedics.modal.Appointment"%>
<%
    if(request.getAttribute("admin")==null || request.getAttribute("doctors")==null
            || request.getAttribute("patients")==null || request.getAttribute("appointments") == null
            || request.getAttribute("staffs")==null){
               response.sendRedirect("admin");
    }
    else{
        Staff admin = (Staff)request.getAttribute("admin");
        ArrayList<Doctor> doctors = (ArrayList<Doctor>)request.getAttribute("doctors");
        ArrayList<Patient> patients = (ArrayList<Patient>)request.getAttribute("patients");
        ArrayList<Appointment> appointments = (ArrayList<Appointment>)request.getAttribute("appointments");
        ArrayList<Staff> staffs = (ArrayList<Staff>)request.getAttribute("staffs");
%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css/style.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">

    <title>Admin Dashboard - CarePath</title>
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
            <a class="navbar-brand"><b>CarePath</b></a>
            <!-- Left links -->
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="admin">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="updateAdminProfile">Edit Profile</a>
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
                        <div class="col-md-12">
                            <img height="100" width="100" src="media/admin.png">
                        </div>
                    </div>

                   <div class="row">
                    <div class="col-md-12">
                        <h5 class="text-secondary"><b><%= admin.getFirstName() +" " + admin.getLastName() %></b></h5><br>

                        <img src="media/gender.png"><span class="details">
                            <b><%= admin.getGender() +", " + admin.getAge() %></b></span><br>

                        <img
                                src="media/degree.png"><span class="degree"> Admin</span>
                        <br>
                        <img src="media/Location.png"><span class="location">
									<%= admin.getAddress() %></span>


                    </div>
                </div>
<%--                <li class="active">--%>
<%--                </li>--%>

                <div style="display: block; margin-top: 50px">
                <li class="nav-item" id="openHome"> <a class="nav-link"><b>HOME</b></a></li>
                <li class="nav-item" id="openPatients"><a class="nav-link"><b>PATIENTS</b></a></li>
                <li class="nav-item" id="openDoctors"><a class="nav-link"><b>DOCTORS</b></a></li>
                <li class="nav-item" id="openStaff"><a class="nav-link" ><b>STAFF</b></a></li>
                <li class="nav-item" id="openAppointments"><a class="nav-link" ><b>APPOINTMENTS</b></a></li>
                </div>

            </ul>
        </div>





        <div class="col-sm-9 col-sm-offset-3 main" id="home">
            <h6 class="page-header" style="margin-top: 60px"><b>Dashboard</b></h6>
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-info">
                        <div class="card-header text-center">
                            <img src="media/patient.png" width="50" height="50">
                        </div>
                        <div class="card-text text-center"><%=patients.size() %> Patients</div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-info">
                        <div class="card-header text-center">
                            <img src="media/doctor.png" width="50" height="50">
                        </div>
                        <div class="card-text text-center"><%=doctors.size() %> Doctors</div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-info">
                        <div class="card-header text-center">
                            <img src="media/admin.png" width="50" height="50">
                        </div>
                        <div class="card-text text-center"><%=staffs.size() %> Staff</div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-info">
                        <div class="card-header text-center">
                            <img src="media/appointment.png" width="50" height="50">
                        </div>
                        <div class="card-text text-center"><%=appointments.size() %> Appointments</div>
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
        <div class="col-sm-9 col-sm-offset-3 main" id="patients" style="display: none;">
            <h5 class="text-center text-info"><b>All Patients</b></h5>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th scope="row">ID</th>
                    <th>Email</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Contact Number</th>
                    <th>Height</th>
                    <th>Weight</th>
                    <th>Blood Group</th>
                </tr>
                </thead>
                <tbody>
                <% for(int i=0; i<patients.size(); i++){
                    Patient users = patients.get(i);
                %>
                <tr>
                    <td scope="row"><%= users.getId() %></td>
                    <td><%= users.getEmail() %></td>
                    <td><%= users.getFirstName() %></td>
                    <td><%= users.getLastName() %></td>
                    <td><%= users.getStringDob() %></td>
                    <td><%= users.getGender() %></td>
                    <td><%= users.getAddress() %></td>
                    <td><%= users.getContactNumber() %></td>
                    <td><%= users.getHeight() %></td>
                    <td><%= users.getWeight() %></td>
                    <td><%= users.getBloodGroup() %></td>
                </tr>
                <%} %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-9 col-sm-offset-3 main" id="doctors" style="display: none;">
            <h5 class="text-center text-info"><b>All Doctors</b></h5>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th scope="row">ID</th>
                    <th>Email</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Contact Number</th>
                    <th>Degree</th>
                    <th>Specialization</th>
                </tr>
                </thead>
                <tbody>
                <% for(int i=0; i<doctors.size(); i++){
                    Doctor users = doctors.get(i);
                %>
                <tr>
                    <td scope="row"><%= users.getId() %></td>
                    <td><%= users.getEmail() %></td>
                    <td><%= users.getFirstName() %></td>
                    <td><%= users.getLastName() %></td>
                    <td><%= users.getStringDob() %></td>
                    <td><%= users.getGender() %></td>
                    <td><%= users.getAddress() %></td>
                    <td><%= users.getContactNumber() %></td>
                    <td><%= users.getDegree() %></td>
                    <td><%= users.getSpecialization() %></td>
                </tr>
                <%} %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-9 col-sm-offset-3 main" id="staffs" style="display: none;">
            <h5 class="text-center text-info"><b>All Staff Members</b></h5>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th scope="row">ID</th>
                    <th>Email</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Contact Number</th>
                    <th>Designation</th>
                </tr>
                </thead>
                <tbody>
                <% for(int i=0; i<staffs.size(); i++){
                    Staff users = staffs.get(i);
                %>
                <tr>
                    <td scope="row"><%= users.getId() %></td>
                    <td><%= users.getEmail() %></td>
                    <td><%= users.getFirstName() %></td>
                    <td><%= users.getLastName() %></td>
                    <td><%= users.getStringDob() %></td>
                    <td><%= users.getGender() %></td>
                    <td><%= users.getAddress() %></td>
                    <td><%= users.getContactNumber() %></td>
                    <td>
                        <% if(users.getUserType()==3){ %>
                        Admin
                        <%}else if(users.getUserType()==4){ %>
                        Lab Person
                        <%}else if(users.getUserType()==5){ %>
                        Receptionist
                        <%} %>
                    </td>
                </tr>
                <%} %>
                </tbody>
            </table>
        </div>
        <div class="col-sm-9 col-sm-offset-3 main" id="appointments" style="display: none;">
            <h5 class="text-center text-info"><b>Appointment Requests</b></h5>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Doctor</th>
                    <th>Patient</th>
                    <th>Status</th>
                    <th>Preferred Date</th>
                    <th>Allocated Date</th>
                    <th>Date Created</th>
                    <th>Symptoms</th>
                    <th>Disease</th>
                </tr>
                </thead>
                <tbody>
                <% for(int i=0; i<appointments.size(); i++){
                    Appointment appointment = appointments.get(i);
                %>
                <tr>
                    <td><%= appointment.getId() %></td>
                    <td><%= appointment.getTitle() %></td>
                    <% if( appointment.getDoctor() == null){ %>
                    <td>Not Allocated</td>
                    <%}else { %>
                    <td><%= appointment.getDoctor().getFirstName() %></td>
                    <%
                        }%>

                    <td><%= appointment.getPatient().getFirstName() %></td>
                    <td>
                        <% if(appointment.getIsClosed()==1){ %>
                        Closed
                        <%}else { %>
                        In progress
                        <%} %>
                    </td>
                    <td><%= appointment.getStringPreferredDate() %></td>
                    <td><%= appointment.getStringAllocatedDate() %></td>
                    <td><%= appointment.getStringDateCreated() %></td>
                    <td><%= appointment.getSymptoms() %></td>
                    <td><%= appointment.getDisease() %></td>
                </tr>
                <%} %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>

<script type="text/javascript">
    $('#openPatients').on('click',function(){
        $("#patients").show();
        $("#doctors").hide();
        $("#staffs").hide();
        $("#home").hide();
        $("#appointments").hide();
        $("#openPatients").addClass("activeReports");
        $("#openDoctors").addClass("notActiveReports");
        $("#openStaff").addClass("notActiveReports");
        $("#openAppointments").addClass("notActiveReports");
        $("#openHome").addClass("notActiveReports");
    });
</script>
<script type="text/javascript">
    $('#openDoctors').on('click',function(){
        $("#patients").hide();
        $("#doctors").show();
        $("#staffs").hide();
        $("#appointments").hide();
        $("#home").hide();
        $("#openPatients").addClass("notActiveReports");
        $("#openDoctors").addClass("activeReports");
        $("#openStaff").addClass("notActiveReports");
        $("#openAppointments").addClass("notActiveReports");
        $("#openHome").addClass("notActiveReports");
    });
</script>
<script type="text/javascript">
    $('#openStaff').on('click',function(){
        $("#patients").hide();
        $("#doctors").hide();
        $("#staffs").show();
        $("#appointments").hide();
        $("#home").hide();
        $("#openPatients").addClass("notActiveReports");
        $("#openDoctors").addClass("notActiveReports");
        $("#openStaff").addClass("activeReports");
        $("#openAppointments").addClass("notActiveReports");
        $("#openHome").addClass("notActiveReports");
    });
</script>
<script type="text/javascript">
    $('#openAppointments').on('click',function(){
        $("#patients").hide();
        $("#doctors").hide();
        $("#staffs").hide();
        $("#appointments").show();
        $("#home").hide();
        $("#openPatients").addClass("notActiveReports");
        $("#openDoctors").addClass("notActiveReports");
        $("#openStaff").addClass("notActiveReports");
        $("#openAppointments").addClass("activeReports");
        $("#openHome").addClass("notActiveReports");
    });
</script>
<script type="text/javascript">
    $('#openHome').on('click',function(){
        $("#patients").hide();
        $("#doctors").hide();
        $("#staffs").hide();
        $("#appointments").hide();
        $("#home").show();
        $("#openPatients").addClass("notActiveReports");
        $("#openDoctors").addClass("notActiveReports");
        $("#openStaff").addClass("notActiveReports");
        $("#openAppointments").addClass("notActiveReports");
        $("#openHome").addClass("activeReports");
    });
</script>
</body>
</html>

<%
    }
%>