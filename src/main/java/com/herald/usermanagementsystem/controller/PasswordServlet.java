package com.herald.usermanagementsystem.controller;

import java.io.IOException;

import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.herald.usermanagementsystem.dao.Password;
import java.sql.SQLException;
import javax.mail.internet.AddressException;

import javax.servlet.RequestDispatcher;

/**
 *
 * @author asus
 */
@WebServlet(name = "resetPassword", urlPatterns = {"/PasswordServlet"})
public class PasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String email = request.getParameter("email");

            //generate random number 
            Random ran = new Random();
            int upperbound = 10000000;

            int random = ran.nextInt(upperbound);
            String randompassword = Integer.toString(random);

            Password es = new Password();

            es.passwordEmailSender(email, randompassword);  //calling the method to send email
            es.ChangePassword(email, randompassword);       //calling method to update password after sending email

            String message = "Code sent successfully!";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ForgotPassword.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException | SQLException | AddressException ex) {
            System.out.println(ex);
        }

    }
}
