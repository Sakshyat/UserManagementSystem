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
        <title>Edit User</title>
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

                        <form action="" method="post">
                            <%
                                st = conn.createStatement();
                                String u = request.getParameter("id");
                                int num = Integer.parseInt(u);
                                String data = "Select * from user where id='" + num + "'";
                                rs = st.executeQuery(data);
                                while (rs.next()) {
                            %>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">Username</label>
                                <input type="text" name="username" class="form-control" value="<%=rs.getString("username")%>" readonly />
                            </div>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">First Name</label>
                                <input type="text" name="first_name" class="form-control" value="<%=rs.getString("first_name")%>" />
                            </div>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">Last Name</label>
                                <input type="text" name="last_name" class="form-control" value="<%=rs.getString("last_name")%>" />
                            </div>
                            <div class="form-group">
                                <label class="form-control-label text-uppercase">Email</label>
                                <input type="email" name="email" class="form-control" value="<%=rs.getString("email")%>" />
                            </div>
                            <div class="form-group">       
                                <label class="form-control-label text-uppercase">Phone</label>
                                <input type="number" name="phone" class="form-control" value="<%=rs.getString("phone")%>" />
                            </div>
                            <div class="form-group">       
                                <label class="form-control-label text-uppercase">Role</label>
                                <select name="role" class="form-control">
                                    <option>Admin</option>
                                    <option>Client</option>
                                </select>
                            </div>

                            <%
                                }
                            %>
                            <div class="form-group">       
                                <a href="UserList.jsp" class="btn btn-primary">Cancel</a> 
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

    </body>
</html>
<%
    String id = request.getParameter("id");
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String userName = request.getParameter("username");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String role = request.getParameter("role");

    if (id != null && first_name != null && last_name != null && username != null && email != null && phone != null) {
        String query = "Update user set first_name=?, last_name=?, email=?, phone=?, role=? where id='" + id + "'";
        ps = conn.prepareStatement(query);
        ps.setString(1, first_name);
        ps.setString(2, last_name);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, role);
        ps.executeUpdate();

        try {
            String uname = (String) session.getAttribute("Admin");
            Date outtime = new Date();
            String datetime = outtime.toString();
            History history = new History();
            history.userHistory(uname, "Updated details of " + "'" + userName + "'", datetime);
        } catch (Exception e) {
            System.out.println(e);
        }

        response.sendRedirect("UserList.jsp");
    }

%>
