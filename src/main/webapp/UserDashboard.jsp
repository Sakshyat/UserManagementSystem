<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.herald.usermanagementsystem.dao.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String username = (String) session.getAttribute("Client");%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>User Dashboard</title>
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
        if ((request.getSession(false).getAttribute("Client") == null)) {
    %>
    <jsp:forward page="/Login.jsp"></jsp:forward>
    <%}%>
    <body>
        <!-- navbar-->
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
                <div class="container-fluid px-xl-5" style="margin-top: 50px">
                    <section>
                        <div class="row">
                            <div class="col-lg-6 mb-3">
                                <div class="card px-5 py-4">
                                    <%
                                        Connection conn = DBConnection.createConnection();
                                        Statement st = conn.createStatement();
                                        String query2 = "SELECT COUNT(*) FROM history where username='" + username + "'";
                                        ResultSet rs = st.executeQuery(query2);
                                        while (rs.next()) {
                                    %>
                                    <h2 class="mb-0 d-flex align-items-center"><span><%=rs.getString(1)%>%</span><% }%><span class="dot bg-red d-inline-block ml-3"></span></h2><span class="text-muted">Overall interactions</span>
                                    <div class="chart-holder">
                                        <canvas id="lineChart3" style="max-height: 7rem !important;" class="w-100">      </canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5" style='margin-left: 50px'>
                                <div class="bg-white shadow roundy px-4 py-3 d-flex align-items-center justify-content-between mb-4">
                                    <div class="flex-grow-1 d-flex align-items-center">
                                        <div class="dot mr-3 bg-violet"></div>
                                        <div class="text">
                                            <h6 class="mb-0">Last Login</h6>
                                            <%  conn = DBConnection.createConnection();
                                                st = conn.createStatement();
                                                String query = "SELECT date FROM history where activity='Logged in' and username='" + username + "' order by history_id desc limit 1";
                                                rs = st.executeQuery(query);
                                                while (rs.next()) {
                                            %>
                                            <span class="text-gray"><%=rs.getString(1)%></span>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="icon bg-violet text-white"><i class="fas fa-clipboard-check"></i></div>
                                </div>
                                <div class="bg-white shadow roundy px-4 py-3 d-flex align-items-center justify-content-between mb-4">
                                    <div class="flex-grow-1 d-flex align-items-center">
                                        <div class="dot mr-3 bg-violet"></div>
                                        <div class="text">
                                            <h6 class="mb-0">Joined on</h6>
                                            <%
                                                conn = DBConnection.createConnection();
                                                st = conn.createStatement();
                                                String query1 = "SELECT date FROM history where activity='Created a new Account' or activity='New User " + "" + username + " Added' and username='" + username + "' order by history_id desc limit 1";
                                                rs = st.executeQuery(query1);
                                                while (rs.next()) {
                                            %>
                                            <span class="text-gray"><%=rs.getString(1)%></span>
                                            <% }%>
                                        </div>
                                    </div>
                                    <div class="icon bg-violet text-white"><i class="fas fa-clipboard-check"></i></div>
                                </div>
                            </div>
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
        <script src="js/charts-home.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>