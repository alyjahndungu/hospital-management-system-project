<%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 25/03/21
  Time: 09:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lanmedics.lanmedics.patient.modal.Patient" import="com.lanmedics.lanmedics.modal.Appointment" import="com.lanmedics.lanmedics.staff.modal.Doctor"
         import="com.lanmedics.lanmedics.utils.DateUtils" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">

    <title>Book Appointment</title>
</head>
<body>
<% Patient patient = (Patient)request.getAttribute("patient"); %>

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
                <li><a href="updatePatientProfile">Edit Profile</a></li>
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
                        <div class="col-md-12">
                            <div class="">
                                <img height="100" width="100" src="media/user.png">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">

                            <br> <span class="text-secondary"><b><%= patient.getFirstName() +" " + patient.getLastName() %></b></span><br>
                            <img src="media/gender.png"><span class="details">
									<%= patient.getGender() +", " + patient.getAge() %></span><br> <img
                                src="media/bloodGroup.png"><span class="blood"> <%= patient.getBloodGroup() %></span><br>
                            <img src="media/Location.png"><span class="location">
									<%= patient.getAddress() %></span>
                        </div>
                    </div>

                </li>
                <% ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>)request.getAttribute("appointments"); %>
                <li class=""><a href="openBookAppointment">Book
                    Appointment</a></li>
                <li class="topic"><span class="upcoming">Upcoming
							Appointment</span> <% ArrayList<Appointment> appointments = arrayList.get(0);
                    for(int i=0; i<appointments.size(); i++)
                    { Appointment appointment = appointments.get(i);
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
                    <form action="patientAppointmentDetails"
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
            <h4 class="page-header">Book Appointment</h4>
            <form class="form-horizontal" method="post" action="bookAppointment">
                <div class="form-group">
                    <label class="form-label">Patient
                        Name</label>
                    <div class="col-sm-6">
                        <h6 class="form-control-static"><b><%= patient.getFirstName() +" " + patient.getLastName() %></b></h6>
                        <input type="hidden" name="patientId" value="1">
                    </div>
                </div>


                <div class="form-group">
                    <label  class="form-label">Appointment
                        Title</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control"
                               placeholder="Acute Stomach Ache" name="title" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Preferred
                        Date of Appointment</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control"
                               placeholder="Date" name="preferredDate"
                               value="<%= DateUtils.getStringFromDate(System.currentTimeMillis()) %>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Symptoms</label>
                    <div class="col-sm-6">
							<textarea class="form-control" rows="2"
                                      placeholder="chest pain, fatigue, hallucination, swelling"
                                      name="symptoms"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="disease" class="form-label">Suspected
                        Disease</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="disease"
                               placeholder="Tuberculosis, Malaria, Acne, Diarrhea"
                               name="disease">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-6 col-sm-2">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
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

</body>
</html>
