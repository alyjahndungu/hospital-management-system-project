<%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 24/03/21
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%
if (!session.isNew() && session.getAttribute("UserID")!=null){
Date lastAccessTime = new Date(session.getLastAccessedTime());
session.setAttribute("LastAccess", lastAccessTime);
String type = (String) session.getAttribute("UserType");

if(type.equals("patient")){
response.sendRedirect("patient");
}
else if(type.equals("doctor")){
response.sendRedirect("doctor");
}

}
else{
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


    <title>Sign Up</title>
</head>
<body>
<div class="container-fluid">
    <h4 style="text-align: center; margin-top: 20px" >
        <b>CarePath</b> - Sign Up
    </h4>
    <hr>
    <div class="row">
        <div class="col-md">

        </div>
        <div class="col-md">
    <form id="mainForm" action="signup" method="post" autocomplete="off">
        <!-- 2 column grid layout with text inputs for the first and last names -->
        <div class="row mb-4">
            <div class="col">
                <div class="form-outline">
                    <input type="text" name="firstName" id="firstName" class="form-control" required />
                    <label class="form-label" for="firstName">First name</label>
                </div>
            </div>
            <div class="col">
                <div class="form-outline">
                    <input type="text" id="lastName" name="lastName" class="form-control" required/>
                    <label class="form-label" for="lastName">Last name</label>
                </div>
            </div>
        </div>

        <!-- Email input -->
        <div class="form-outline mb-4">
            <input type="email" id="email" name="email" class="form-control" required />
            <label class="form-label" for="email">Email address</label>
        </div>



        <div class="row mb-4">
            <div class="col">
                <div class="form-outline">
                    <input type="date" id="dob" name="dob" class="form-control" required>
                    <label class="form-label" for="dob">Date of Birth</label>
                </div>
            </div>

            <!-- Password input -->
            <div class="col">
                <div class="form-outline">
                    <input type="password" id="password" name="password" class="form-control" required />
                    <label class="form-label" for="password">Password</label>
                </div>
            </div>
        </div>






        <div class="form-group">
            <label class="control-label col-sm-4">Gender</label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="radio col-sm-4">
                        <label class="radio-inline"> <input name="gender"
                                                            type="radio" id="femaleRadio" value="F">Female
                        </label>
                    </div>
                    <div class="radio col-sm-4">
                        <label class="radio-inline"> <input name="gender"
                                                            type="radio" id="maleRadio" value="M">Male
                        </label>
                    </div>
                    <div class="radio col-sm-4">
                        <label class="radio-inline"> <input name="gender"
                                                            type="radio" id="unknownRadio" value="U">Unknown
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-4">

            <div class="col">
                <div class="form-outline">
                    <input type="text" id="address" name="address" placeholder="South C, Nairobi County" class="form-control" required />
                    <label class="form-label" for="address">Physical Address</label>
                </div>
            </div>

            <div class="col">
                <div class="form-outline">
                    <input type="text" id="contactNumber" maxlength="13" name="contactNumber" class="form-control" required />
                    <label class="form-label" for="contactNumber">Phone Number</label>
                </div>
            </div>
        </div>



        <div class="form-group">
            <label for="userType" class="form-label">User Role</label>
            <div>
                <select id="userType" name="userType" class="form-control" required>
                    <option selected disabled>Choose One</option>
                    <option value="1">Patient</option>
                    <option value="2">Doctor</option>
                    <option value="4">Lab Personnel</option>
                    <option value="5">Receptionist</option>

                </select>
            </div>
        </div>

        <div id="Patient" style="display: none;">

            <div class="row mb-4">
                <div class="col">
                    <div class="form-outline">
                        <input type="number" name="height" placeholder="in cms" class="form-control" required>
                        <label class="form-label">Height(cm)</label>
                    </div>
                </div>

                <div class="col">
                    <div class="form-outline">
                        <input type="number" name="weight" placeholder="in kgs" class="form-control" required>
                        <label class="form-label">Weight(Kgs)</label>
                    </div>
                </div>
            </div>

            <div class="form-outline mb-4">
                <input type="text" name="bloodGroup" placeholder="A+" class="form-control" maxlength="3"/>
                <label class="form-label">Blood Group</label>
            </div>

        </div>
        <div id="Doctor" style="display: none;">
            <div class="row mb-4">
                <div class="col">
                    <div class="form-outline">
                        <input type="text" id="degree" name="degree" placeholder="MBBS" class="form-control">
                        <label class="form-label">Degree</label>
                    </div>
                </div>

                <div class="col">
                    <div class="form-outline">
                        <input type="text" id="specialization" name="specialization" placeholder="Cardiologist" class="form-control">
                        <label class="form-label">Specialization</label>
                    </div>
                </div>
            </div>
        </div>


        <!-- Submit button -->
        <div class="form-group">
            <div>
                <%
                    String message = (String)request.getAttribute("error");
                    if (message!=null) {
                %>
                <h4><%= message %></h4>
                <%
                    }
                %>
                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </div>
        </div>

        <!-- Register buttons -->
        <div class="text-center">
            <p>Already a member? <a href="login">Sign In</a></p>
            <p>or sign up with:</p>
            <button type="button" class="btn btn-primary btn-floating mx-1">
                <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
                <i class="fab fa-google"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
                <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
                <i class="fab fa-github"></i>
            </button>
        </div>
    </form>
        </div>
        <div class="col-md">
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
    $('#userType').on('click',function(){
        var selection = $(this).val();
        switch(selection){
            case "1":
                $("#Patient").show();
                $("#Doctor").hide();
                break;
            case "2":
                $("#Patient").hide();
                $("#Doctor").show();
                break;
            default:
                $("#Patient").hide();
                $("#Doctor").hide();
        }
    });
</script>
</body>
</html>
<%
    }
%>