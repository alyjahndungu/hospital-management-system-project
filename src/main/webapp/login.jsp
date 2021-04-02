<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: turnstone
  Date: 24/03/21
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
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
        else if(type.equals("admin")){
            response.sendRedirect("admin");
        }
        else if(type.equals("labPerson")){
            response.sendRedirect("labPerson");
        }
        else if(type.equals("receptionist")){
            response.sendRedirect("receptionist");
        }

    }
    else{


%>
<html>
<head>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>

    <title>CarePath-Sign In</title>
</head>
<body>

<div class="container-fluid">
    <h4  class="text-primary" style="text-align: center; margin-top: 20px" >
       <b>CarePath</b> - Sign In
    </h4>
    <hr>
    <div class="row">
        <div class="col-md">

        </div>
        <div class="col-md-4">
            <form action="login" method="post" id="loginForm">
                <!-- Email input -->
                <div class="form-outline mb-4">
                    <input type="email" name="email" id="email" class="form-control " />
                    <label class="form-label" for="email">Email address</label>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <input type="password" id="password" name="password" class="form-control" />
                    <label class="form-label" for="password">Enter Password</label>
                </div>

                <!-- 2 column grid layout for inline styling -->
                <div class="row mb-4">
                    <div class="col d-flex justify-content-center">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input
                                    class="form-check-input"
                                    type="checkbox"
                                    value=""
                                    id="form2Example3"
                                    checked
                            />
                            <label class="form-check-label" for="form2Example3"> Remember me </label>
                        </div>
                    </div>

                    <div class="col">
                        <!-- Simple link -->
                        <a href="#!">Forgot password?</a>
                    </div>
                </div>

                <%
                    String message = (String)request.getAttribute("error");
                    if (message!=null) {
                %>
                <h6 class="text-error"><%= message %></h6>
                <%
                    }
                %>
                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

                <!-- Register buttons -->
                <div class="text-center">
                    <p>Not a member? <a href="signup">Register</a></p>
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
</body>
</html>

<%
    }
%>