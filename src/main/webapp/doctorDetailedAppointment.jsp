<%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 25/03/21
  Time: 09:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Doctor" %>
<%@ page import="com.lanmedics.lanmedics.modal.Appointment" %>
<%@ page import="com.lanmedics.lanmedics.prescription.Prescription" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lanmedics.lanmedics.prescription.Lab" %>
<%@ page import="com.lanmedics.lanmedics.modal.AppointmentItems" %>
<%@ page import="com.lanmedics.lanmedics.patient.modal.Patient" %>
<%
    if(request.getAttribute("doctor")==null || request.getAttribute("appointments")==null || request.getAttribute("appointment") == null){
        response.sendRedirect("doctor");
    }
    else{
        Doctor doctor = (Doctor)request.getAttribute("doctor");
        ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments");
        Appointment detailedAppointment = ((Appointment)request.getAttribute("appointment"));
        ArrayList<Prescription> prescriptions = (ArrayList<Prescription>)request.getAttribute("prescriptions");
        ArrayList<Lab> labs = (ArrayList<Lab>)request.getAttribute("labs");
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


    <title>Doctor Appointments</title>
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
            <a class="navbar-brand" href="patient">Central Medic Center</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="patient">Dashboard</a></li>
                <li><a href="updateDoctorProfile">Edit Profile</a>
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
                                <img class="profilePic" src="media/doctor.png">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-lg-8 info">
                            <br> <span class="name"><%= doctor.getFirstName() +" " + doctor.getLastName() %></span><br>
                            <img src="media/gender.png"><span class="details">
									<%= doctor.getGender() +", " + doctor.getAge() %></span><br> <img
                                src="media/degree.png"><span class="blood"> <%= doctor.getDegree() %></span><br>
                            <img src="media/specialization.png"><span class="location">
									<%= doctor.getSpecialization() %></span>
                        </div>
                    </div>

                </li>

                <li class="topic"><span class="upcoming">Upcoming
							Appointment</span> <% ArrayList<Appointment> upcomingAppointments = arrayList.get(0);
                    for(int i=0; i<upcomingAppointments.size(); i++)
                    { Appointment appointment = upcomingAppointments.get(i);
                %>
                    <form class="form-signin" action="doctorAppointmentDetails"
                          method="post">
                        <input type="hidden" class="form-control" name="appointmentId"
                               value="<%= appointment.getId() %>" />
                        <ul>
                            <li class="subtopic">
                                <%if(detailedAppointment.getId()==appointment.getId()){ %>
                                <button class="btn btn-default activeAppointment" type="submit">
                                    <%}else{ %>
                                    <button class="btn btn-default" type="submit">
                                        <% } %>
                                        <div class="row">
                                            <div class="col-sm-12 text-left">
                                                <b><%= appointment.getTitle() %> </b><br>
                                                <% Patient patient = appointment.getPatient();
                                                    if(patient==null){
                                                %>Wating for doctor approval
                                                <% }else{ %>
                                                <%= patient.getFirstName() %>
                                                <% } %>
                                                |
                                                <%= appointment.getStringDateCreated() %>
                                            </div>
                                        </div>
                                    </button>
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
                    <form class="form-signin" action="doctorAppointmentDetails"
                          method="post">
                        <input type="hidden" class="form-control" name="appointmentId"
                               value="<%= appointment.getId() %>" />
                        <ul>
                            <li class="subtopic">
                                <%if(detailedAppointment.getId()==appointment.getId()){ %>
                                <button class="btn btn-default activeAppointment" type="submit">
                                    <%}else{ %>
                                    <button class="btn btn-default " type="submit">
                                        <%} %>
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
            <h1 class="page-header"><%= detailedAppointment.getTitle() %></h1>
            <div class="content">
                <div class="row ">
                    <div class="col-sm-3">
                        <b>Appointment ID: <%= detailedAppointment.getId() %></b>
                    </div>
                    <div class="col-sm-5">
                        <b>Patient Name: </b>
                        <% if(detailedAppointment.getPatient()!=null) { %>
                        <%= detailedAppointment.getPatient().getFirstName() + " " + detailedAppointment.getPatient().getLastName() %>
                        <% }else{ %>
                        Wating for doctor approval
                        <% } %>
                    </div>
                    <div class="col-sm-4">
                        <b>Date Created:</b>
                        <%= detailedAppointment.getStringDateCreated() %>
                    </div>
                </div>
                <br>
                <div class="row ">
                    <div class="col-sm-8">
                        <b>Symptons: </b>
                        <%= detailedAppointment.getSymptoms() %>
                    </div>
                    <div class="col-sm-4">
                        <b>Suspected Disease </b><%= detailedAppointment.getDisease() %>
                    </div>
                </div>
                <br>
                <% if(detailedAppointment.getIsClosed()==0){ %>
                <div class="row">
                    <form method="post" action="closeAppointment">
                        <input type="hidden" name="appointmentId" value="<%=detailedAppointment.getId() %>" >
                        <input
                                type="hidden" name="by"
                                value="<%="By Doctor: - " + doctor.getFirstName() %>" />
                        <input
                                type="hidden" name="requestDispatcher"
                                value="doctorAppointmentDetails" />
                        <button type="submit" class="send btn btn-success">Close</button>
                    </form>
                </div>
                <%}else { %>
                <h3 style="text-align:center">Closed</h3>
                <% } %>
            </div>
            <% if(detailedAppointment.getItems()!=null) {%>
            <% for(int i=0; i<detailedAppointment.getItems().size(); i++) {
                AppointmentItems item = detailedAppointment.getItems().get(i);
            %>
            <div class="content" style="">
                <div class="row ">
                    <div class="col-sm-2">
                        <div class="messageFrom">
                            <% if(item.getType()==1){ 	%>
                            You
                            <%}else if(item.getType()==2) {%>
                            <%= detailedAppointment.getPatient().getFirstName() %>
                            <% }else if(item.getType()==3) { %>
                            You -> Prescription
                            <%}else if(item.getType()==4) {%>
                            Lab Report -><% for(int k = 0; k< labs.size(); k++){
                            if(labs.get(k).getItemId() == item.getItemId()){ %>
                            <%= labs.get(k).getLabName() %>
                            <%	} } %>
                            <% }else if(item.getType()==5) { %>
                            You
                            <%}else if(item.getType()==6) {%>
                            System
                            <% } %>
                        </div>
                    </div>
                    <div class="col-sm-10">
                        <div class="message">
                            <%if(item.getType()==1 || item.getType()==2 || item.getType()==5 || item.getType()==6){ %>
                            <%= item.getDescription() %>
                            <%}else if(item.getType()==3) {%>
                            <% for(int k = 0; k< prescriptions.size(); k++){
                                if(prescriptions.get(k).getItemId() == item.getItemId()){ %>
                            <div>Take <%= prescriptions.get(k).getQuantity() %> <b><%= prescriptions.get(k).getMedicineName() %></b> <%= prescriptions.get(k).getTimes() %> times a day.</div>
                            <%	} } %>
                            <%}else if(item.getType()==4) {%>
                            <% for(int k = 0; k< labs.size(); k++){
                                if(labs.get(k).getItemId() == item.getItemId()){ %>
                            <div>Lab result for <b><%= labs.get(k).getTestFor() %></b> is <b><%= labs.get(k).getLabResult() %></b>.</div>
                            <%	} } %>
                            <%} %>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-10"></div>
                    <div class="col-sm-2">
                        <div class="" style="font-size: 11px;">
                            <%= item.getStringDate() %>
                        </div>
                    </div>
                </div>
            </div>
            <% } }%>
            <% if(detailedAppointment.getIsClosed()==0){ %>
            <div class="">
                <form class="form-inline" action="newAppointmentItem" method="post">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="radio">
                                <label> <input type="radio" name="sendType"
                                              value="1" checked> Message
                                </label>
                                <label> <input type="radio" name="sendType"
                                              value="5"> Lab Report
                                </label>
                                <label> <input type="radio" name="sendType"
                                                value="3"> Prescription
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <input type="hidden" name="requestDispatcher" value="doctorAppointmentDetails" />
                        <input type="hidden" name="appointmentId" value="<%= detailedAppointment.getId()%>" />
                        <input type="hidden" name="doctorId" value="<%= doctor.getId()%>" />
                        <div class="col-sm-9 form-group" id="Message" >
								<textarea class="form-control textman" name="description"
                                          rows="3" placeholder="Type your message here"></textarea>
                        </div>
                        <div class="col-sm-9 form-group" id="LabReport" style="display: none;" >
                            <div class="row LabReportOptions">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <!--<label for="LabName">Lab Name</label>-->
                                        <input type="text" class="form-control" name="labName" id="LabName" placeholder="Lab Name">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <!--<label for="TestFor">Test For</label>-->
                                        <input type="text" class="form-control" name="testFor" id="TestFor" placeholder="Test For">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-9 form-group" id="Prescription" style="display: none;" >
                            <div class="row prescriptionOptions">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <!--<label for="MedicineName">Medicine Name</label>-->
                                        <input type="text" class="form-control" name="medicineName" id="MedicineName" placeholder="Medicine Name">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <select name="quantity" class="form-control">
                                        <option value="" selected disabled>Choose Quantity</option>
                                        <option value="0.5">0.5</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <select name="times" class="form-control">
                                        <option value="" selected disabled>Times A Day</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <button type="submit" class="send btn btn-success">Send</button>
                        </div>
                    </div>
                </form>
            </div>
            <% } %>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('input[type="radio"]').on('click',function(){
        var selection = $(this).val();
        switch(selection){
            case "1":
                $("#Message").show();
                $("#LabReport").hide();
                $("#Prescription").hide();
                break;
            case "5":
                $("#Message").hide();
                $("#LabReport").show();
                $("#Prescription").hide();
                break;
            case "3":
                $("#Message").hide();
                $("#LabReport").hide();
                $("#Prescription").show();
                break;
            default:
                $("#Message").show();
                $("#LabReport").hide();
                $("#Prescription").hide();
        }
    });
</script>
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