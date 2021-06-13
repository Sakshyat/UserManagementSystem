<%@page import="com.herald.usermanagementsystem.dao.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String username = (String) session.getAttribute("Client");%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>History Log</title>
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
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/favicon.png?3">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <%
        if ((request.getSession(false).getAttribute("Client") == null)) {
    %>
    <jsp:forward page="LogoutServlet"></jsp:forward>
    <%}%>
    <body>
        <header class="header">
            <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow"><img src="assets/img/logo/Inferno.png" alt="">
                <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
                    <li class="nav-item dropdown ml-auto"><a id="userInfo" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="img/user_icon.png" alt="Jason Doe" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
                        <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><strong class="d-block text-uppercase headings-font-family"><%=session.getAttribute("Client")%></strong></a>
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
                    <section class="py-5">
                        <div class="col-lg-6 mb-4">                           
                            <table class="table table-striped table-hover card-text">                               
                                <thead>
                                    <tr>
                                        <th><h6 class="text-uppercase mb-0">History</h6><th>
                                    <tr>
                                    <tr>
                                        <th>Username</th>
                                        <th>Activity</th>
                                        <th>Date/Time</th>
                                    </tr>
                                </thead>
                                <%
                                    try {
                                        Connection conn = DBConnection.createConnection();
                                        String uname = request.getParameter("username");
                                        String sql = "Select * from history where username='" + uname + "' order by history_id desc";
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(sql);
                                        while (rs.next()) {
                                %>
                                <tbody>
                                    <tr>
                                        <td><%=rs.getString("username")%></td>
                                        <td><%=rs.getString("activity")%></td>
                                        <td><%=rs.getString("date")%></td>
                                    </tr>
                                </tbody>
                                <%
                                        }
                                    } catch (Exception e) {
                                        out.println("Exception: " + e.getMessage());
                                        e.printStackTrace();

                                    }
                                %>
                            </table>
                        </div>
                    </section>
                </div>
                <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-left text-primary">
                                <p class="mb-2 mb-md-0"></p>
                            </div>
                            <div class="col-md-6 text-center text-md-right text-primary">
                                <p class="mb-0">Inferno &copy; 2018-2020</p>                               
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/popper.js/umd/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>