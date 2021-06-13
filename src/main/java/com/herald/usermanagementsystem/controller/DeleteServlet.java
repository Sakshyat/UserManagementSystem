package com.herald.usermanagementsystem.controller;

import com.herald.usermanagementsystem.dao.History;
import com.herald.usermanagementsystem.dao.UserCrud;
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
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        UserCrud uc = new UserCrud();
        HttpSession session = request.getSession();
        try {
            uc.delete(username);
            try {
                String uname = (String) session.getAttribute("Admin");
                Date outtime = new Date();
                String datetime = outtime.toString();
                History history = new History();
                history.userHistory(uname, "User " +"'"+username+"'"+ " Deleted", datetime);
            } catch (Exception e) {
                System.out.println(e);
            }
            session.setAttribute("Deleted", "The user has been deleted.");
            response.sendRedirect("UserList.jsp");
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }
}
