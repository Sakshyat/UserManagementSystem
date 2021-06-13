package com.herald.usermanagementsystem.controller;

import com.herald.usermanagementsystem.dao.History;
import com.herald.usermanagementsystem.dao.Report;
import com.herald.usermanagementsystem.dao.UserLoginDao;
import com.herald.usermanagementsystem.dao.UserRegisterDao;
import com.herald.usermanagementsystem.model.User;
import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sakshyat
 */
public class UserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UserServlet() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/RegisterServlet": {
                registerUser(request, response);

            }
            break;

            case "/LoginServlet": {
                loginUser(request, response);

            }
            break;

            case "/LogoutServlet": {

                logout(request, response);
            }
            break;

        }
    }

    protected void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       //return http request parameters and assigning to temporary variables
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_pass = request.getParameter("confirm_pass");
        String phone = request.getParameter("phone");

        User user = new User(first_name, last_name, username, email, password, confirm_pass, phone);

        UserRegisterDao rdao = new UserRegisterDao();

        String userRegistered = rdao.registerUser(user);

        if (userRegistered.equals("SUCCESS")) //if user is registered
        {
            try {
                    Date outtime = new Date();
                    String datetime = outtime.toString();
                    History history = new History();
                    Report report = new Report();
                    report.userReport(username,datetime);
                    history.userHistory(username, "Created a new Account", datetime);
                    
                } catch (Exception e) {
                    System.out.println(e);
                }
            request.getRequestDispatcher("/Login.jsp").forward(request, response);

        } else  //incase of failure
        {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
        }
    }

    protected void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //return http request parameters and assigning to temporary variables
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password); 

        UserLoginDao logdao = new UserLoginDao(); 

        String userValidate = logdao.loginUser(user); 

        switch (userValidate) {
            //if user is a client
            case "is_client": {
                HttpSession session = request.getSession();
                session.setAttribute("Client", username);
                session.setAttribute("username", username);
                
                try {
                    String uname = (String) session.getAttribute("Client");
                    Date outtime = new Date();
                    String datetime = outtime.toString();
                    History history = new History();
                    history.userHistory(uname, "Logged in", datetime);
                } catch (Exception e) {
                    System.out.println(e);
                }

                request.getRequestDispatcher("/UserDashboard.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
                break;
            }
            
            //if user is an admin
            case "is_admin": {
                HttpSession session = request.getSession();
                session.setAttribute("Admin", username);
                session.setAttribute("username", username);
                
                try {
                    String uname = (String) session.getAttribute("Admin");
                    Date outtime = new Date();
                    String datetime = outtime.toString();
                    History history = new History();
                    history.userHistory(uname, "Logged in", datetime);
                } catch (Exception e) {
                    System.out.println(e);
                }
                
                request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
                break;
            }
            //incase of login failure
            default:
                request.setAttribute("errMessage", userValidate); 
                request.getRequestDispatcher("/Login.jsp").forward(request, response);
                break;
        }

    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); //Fetch session object

        if (session != null) //If session is not null
        {   
            try {
                    String uname = (String) session.getAttribute("username");
                    Date outtime = new Date();
                    String datetime = outtime.toString();
                    History history = new History();
                    history.userHistory(uname, "Logged out", datetime);
                } catch (Exception e) {
                    System.out.println(e);
                }
            session.invalidate();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Login.jsp");
            requestDispatcher.forward(request, response);
            System.out.println("Logged out");
        }
    }

}
