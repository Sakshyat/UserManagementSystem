<%-- 
    Document   : AddUser
    Created on : May 24, 2020, 1:49:47 PM
    Author     : Sakshyat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String username = (String) session.getAttribute("Admin");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Add User</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!-- Google fonts - Popppins for copy-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
        <!-- orion icons-->
        <link rel="stylesheet" href="css/orionicons.css">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <title>Add user</title>

        <script>
            function validate()
            {
                var first_name = document.form.first_name.value;
                var last_name = document.form.last_name.value;
                var username = document.form.username.value;
                var email = document.form.email.value;
                var password = document.form.password.value;
                var confirm_pass = document.form.confirm_pass.value;
                var phone = document.form.phone.value;

                if (first_name == null || first_name == "")
                {
                    alert("First Name can't be blank");
                    return false;
                } else if (last_name == null || last_name == "")
                {
                    alert("Last Name can't be blank");
                    return false;
                } else if (username == null || username == "")
                {
                    alert("Username can't be blank");
                    return false;
                } else if (email == null || email == "")
                {
                    alert("Email can't be blank");
                    return false;
                } else if (password.length < 8)
                {
                    alert("Password must be at least 8 characters long.");
                    return false;
                } else if (password != confirm_pass)
                {
                    alert("Passwords do not match");
                    return false;
                } else if (phone == null || phone == "")
                {
                    alert("Phone number can't be blank");
                    return false;
                } else if (phone.length != 10)
                {
                    alert("Please enter a valid phone number");
                    return false;
                }
            }
        </script> 
    </head>
    <body>
        <%
            if ((request.getSession(false).getAttribute("Admin") == null)) {
        %>
        <jsp:forward page="LogoutServlet"></jsp:forward>
        <%}%>
    <body>
        <header class="header">
            <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow"><img src="assets/img/logo/Inferno.png" alt="">
                <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
                    <li class="nav-item dropdown ml-auto"><a id="userInfo" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="img/user_icon.png" alt="Jason Doe" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
                        <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><strong class="d-block text-uppercase headings-font-family"><%=session.getAttribute("Admin")%></strong></a>
                            <div class="dropdown-divider"></div><a href="LogoutServlet" class="dropdown-item">Logout</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
        <div class="d-flex align-items-stretch">
            <div id="sidebar" class="sidebar py-3">
                <ul class="sidebar-menu list-unstyled">
                    <br>
                    <li class="sidebar-list-item"><a href="AdminDashboard.jsp" class="sidebar-link text-muted"><i class="o-sales-up-1 mr-3 text-gray"></i><span></span>Dashboard</a></li>
                    <br>
                    <li class="sidebar-list-item"><a href="UserList.jsp" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>User List</span></a></li>
                    <br>
                    <li class="sidebar-list-item"><a href="AdminHistory.jsp" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>History Log</span></a></li>
                    <br>
                    <li class="sidebar-list-item"><a href="Report.jsp" class="sidebar-link text-muted"><i class="o-paperwork-1 mr-3 text-gray"></i><span>Report</span></a></li>
                    <br>
                    <li class="sidebar-list-item"><a href="Profile.jsp?username=<%=username%>" class="sidebar-link text-muted"><i class="o-imac-screen-1 mr-3 text-gray"></i><span>Profile</span></a></li> 
                </ul>
            </div>
            <div class="col-lg-6 mb-5" style="padding-top: 10px">
                <div class="card">
                    <div class="card-header">
                        <h3 class="h6 text-uppercase mb-0">Add User</h3>
                    </div>
                    <div class="card-body">
                            <span style="color:red"><%=(session.getAttribute("errMessage") == null) ? ""
                                  : session.getAttribute("errMessage")%></span>
                        <form name="form" action="addUser" onsubmit="return validate()">

                            <div class="form-group">
                                <label class="form-control-label text-uppercase">First Name</label>
                                <input type="text" name="first_name" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">Last Name</label>
                                <input type="text" name="last_name" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">Username</label>
                                <input type="text" name="username" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">Email</label>
                                <input type="email" name="email" class="form-control"/>
                            </div>
                            <div class="form-group">       
                                <label class="form-control-label text-uppercase">Password</label>
                                <input type="password" name="password" class="form-control"/>
                            </div>
                            <div class="form-group">       
                                <label class="form-control-label text-uppercase">Confirm Password</label>
                                <input type="password" name="confirm_pass" class="form-control"/>
                            </div>
                            <div class="form-group">       
                                <label class="form-control-label text-uppercase">Phone</label>
                                <input type="number" name="phone" class="form-control"/>
                            </div>
                            <div class="form-group">       
                                <label class="form-control-label text-uppercase">Role</label>
                                <select name="role" class="form-control">
                                    <option>Admin</option>
                                    <option>Client</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <a href="UserList.jsp" class="btn btn-primary">Cancel</a>
                                <button type="submit" class="btn btn-primary">Add user</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
