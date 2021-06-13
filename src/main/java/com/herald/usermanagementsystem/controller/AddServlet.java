package com.herald.usermanagementsystem.controller;

import com.herald.usermanagementsystem.dao.History;
import com.herald.usermanagementsystem.dao.Report;
import com.herald.usermanagementsystem.dao.UserCrud;
import com.herald.usermanagementsystem.model.User;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sakshyat
 */
@WebServlet("/addUser")
public class AddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            //return http request parameters and assigning to temporary variables
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm_pass = request.getParameter("confirm_pass");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");

            User user = new User();

            //setiing the fetched values into user model
            user.setFirst_name(first_name);
            user.setLast_name(last_name);
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setConfirm_pass(confirm_pass);
            user.setPhone(phone);
            user.setRole(role);

            UserCrud.addUser(user);
            try {
                String uname = (String) session.getAttribute("Admin");
                Date outtime = new Date();
                String datetime = outtime.toString();
                History history = new History();
                Report report = new Report();
                history.userHistory(uname, "New User " + "" + username + " Added", datetime);
                report.userReport(username, datetime);
            } catch (Exception e) {
                System.out.println(e);
            }

            response.sendRedirect("UserList.jsp");

        } catch (Exception e) {
            session.setAttribute("errMessage", "The user with the given username or email already exists");
            response.sendRedirect("AddUser.jsp");
        }
    }
}
