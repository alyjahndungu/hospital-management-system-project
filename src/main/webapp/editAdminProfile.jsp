<%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 25/03/21
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lanmedics.lanmedics.staff.modal.Staff" %>
<%
    if(request.getAttribute("admin")==null){
        response.sendRedirect("admin");
    }
    else{
        Staff admin = (Staff)request.getAttribute("admin");
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

    <title>Edit Profile - Admin</title>
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
            <a class="navbar-brand" href="admin">Central Medic Center</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="admin">Dashboard</a></li>
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
                                <img class="profilePic" src="media/admin.png">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-lg-8 info">
                            <br> <span class="name"><%= admin.getFirstName() +" " + admin.getLastName() %></span><br>
                            <img src="media/gender.png"><span class="details">
									<%= admin.getGender() +", " + admin.getAge() %></span><br> <img
                                src="media/degree.png"><span class="degree"> Admin</span><br>
                            <img src="media/Location.png"><span class="location">
									<%= admin.getAddress() %></span>
                        </div>
                    </div>

                </li>
                <a href="admin"><li class="labReports">Home</li></a>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 main">
            <h1 class="page-header" style="text-align: center">
                Edit Profile
            </h1>
            <h4 class="sub-header">Personal Information</h4>
            <form class="form-horizontal" action="editAdminProfile"
                  method="post">
                <div class="form-group">
                    <label class="form-label">Full
                        Name</label>
                    <div class="col-sm-10">
                        <p class="form-control-static"><%= admin.getFirstName() + " " + admin.getLastName() %></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Gender</label>
                    <div class="col-sm-10">
                        <p class="form-control-static"><%= admin.getGender() %></p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="date" class="form-label">Date Of
                        Birth</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" name="dob" id="date"
                               placeholder="Date" value="<%= admin.getStringDob() %>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="form-label">Phone
                        Number</label>
                    <div class="col-sm-10">
                        <input type="tel" class="form-control"
                               name="contactNumber" id="phoneNumber"
                               placeholder="+254 7521113802"
                               value="<%= admin.getContactNumber() %>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-10">
							<textarea class="form-control" rows="2" name="address"> <%= admin.getAddress() %></textarea>
                    </div>
                </div>
                <h4 class="sub-header">Account Information</h4>
                <div class="form-group">
                    <label for="userName" class="form-label">User
                        Name</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="userName"
                               placeholder="ternstone@gmail.com" value="<%= admin.getEmail() %>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password"
                               id="password" placeholder="password">
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

<%
    }
%>
