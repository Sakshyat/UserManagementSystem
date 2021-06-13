<%-- 
    Document   : Profile
    Created on : May 24, 2020, 3:37:56 PM
    Author     : asus
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.herald.usermanagementsystem.dao.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.herald.usermanagementsystem.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String username = (String) session.getAttribute("Client");%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Profile</title>
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
        <link rel="stylesheet" href="css/profile.css">
    </head>
    <%
        if ((request.getSession(false).getAttribute("Client") == null)) {
    %>
    <jsp:forward page="LogoutServlet"></jsp:forward>
    <%}%>
    <body>
        <header class="header">
            <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow"><a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a><a href="index.html" class="navbar-brand font-weight-bold text-uppercase text-base"></a>
                <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
                    <li class="nav-item dropdown ml-auto"><a id="userInfo" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="img/user_icon.png" alt="Jason Doe" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
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
                    <li class="sidebar-list-item"><a href="UserDashboard.jsp" class="sidebar-link text-muted"><i class="o-sales-up-1 mr-3 text-gray"></i><span></span>Dashboard</a></li>
                    <br>
                    <li class="sidebar-list-item"><a href="UserHistory.jsp?username=<%=username%>" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>History Log</span></a></li>
                    <br>
                    <li class="sidebar-list-item"><a href="UserProfile.jsp?username=<%=username%>" class="sidebar-link text-muted"><i class="o-imac-screen-1 mr-3 text-gray"></i><span>Profile</span></a></li>                  
                </ul>
            </div>
            <div class="page-holder w-100 d-flex flex-wrap">
                <div class="container-fluid px-xl-5">                   
                    <div class="col-lg-6 mb-4">
                        <div class="side_wrapper">
                            <%
                                try {
                                    Connection conn = DBConnection.createConnection();
                                    String uname = request.getParameter("username");
                                    String sql = "Select * from user where username='" + uname + "'";
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery(sql);
                                    while (rs.next()) {
                            %>
                            <section class="about-dev">
                                <header class="profile-card_header">
                                    <div class="profile-card_header-container">
                                        <div class="profile-card_header-imgbox">
                                            <img src="img/profile.png" alt="Mewy Pawpins" />
                                        </div>
                                        <h1><%=rs.getString("Username")%> <span><%=rs.getString("First_name")%> <%=rs.getString("Last_name")%></span></h1>
                                    </div>
                                </header>
                                <div class="profile-card_about">
                                    <h2><%=rs.getString("email")%></h2>
                                    <p><%=rs.getString("phone")%> 
                                        <br>
                                        <%=rs.getString("role")%></p>
                                    <a href="EditProfile.jsp?id=<%=rs.getString("id")%>" class="btn btn-primary">Edit</a>
                                    <a href="LogoutServlet" class="btn btn-danger">Logout</a>
                                    <a href="ChangeClientPassword.jsp?id=<%=rs.getString("id")%>">Change Password</a>
                                </div>
                            </section>
                        </div>
                    </div>                
                </div>
            </div>                   
        </div>
        <%
                }
            } catch (Exception e) {
                out.println("Exception: " + e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>