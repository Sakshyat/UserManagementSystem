<%-- 
    Document   : EditUser
    Created on : May 23, 2020, 5:57:58 PM
    Author     : Sakshyat
--%>

<%@page import="com.herald.usermanagementsystem.dao.History"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.herald.usermanagementsystem.dao.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String username = (String) session.getAttribute("Admin");%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Change Password</title>
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
        <script>
            function validate()
            {
                var password = document.form.password.value;
                var confirm_pass = document.form.confirm_pass.value;

                if (password != confirm_pass)
                {
                    alert("Passwords do not match");
                    return false;
                }
            }
        </script> 
    </head>
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
            <%
                Statement st = null;
                ResultSet rs = null;
                PreparedStatement ps = null;
                Connection conn = DBConnection.createConnection();
            %>
            <div class="col-lg-6 mb-5" style="padding-top: 10px">
                <div class="card">
                    <div class="card-header">
                        <h3 class="h6 text-uppercase mb-0">Edit User</h3>
                    </div>
                    <div class="card-body">
                        <form action="" name="form" method="post" onsubmit="return validate()">
                            <%
                                st = conn.createStatement();
                                String u = request.getParameter("id");
                                int num = Integer.parseInt(u);
                                String data = "Select * from user where id='" + num + "'";
                                rs = st.executeQuery(data);
                                while (rs.next()) {
                            %>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">New Password</label>
                                <input type="password" name="password" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">Re-type New Password</label>
                                <input type="password" name="confirm_pass" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <%
                                    }
                                %>
                                <div class="form-group">       
                                    <a href="Profile.jsp?username=<%=username%>" class="btn btn-primary">Cancel</a> 
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

                </body>
                </html>
                <%
                    String id = request.getParameter("id");
                    String password = request.getParameter("password");
                    String confirm_pass = request.getParameter("confirm_pass");

                    if (id != null && password != null && confirm_pass != null) {
                        String query = "Update user set password=?, confirm_pass=? where id='" + id + "'";
                        ps = conn.prepareStatement(query);
                        ps.setString(1, password);
                        ps.setString(2, confirm_pass);
                        ps.executeUpdate();

                        try {
                            String uname = (String) session.getAttribute("Admin");
                            Date outtime = new Date();
                            String datetime = outtime.toString();
                            History history = new History();
                            history.userHistory(uname, "Changed Password", datetime);
                        } catch (Exception e) {
                            System.out.println(e);
                        }

                        response.sendRedirect("AdminDashboard.jsp");
                    }

                %>
