package com.herald.usermanagementsystem.controller;

import com.herald.usermanagementsystem.dao.Report;
import java.io.IOException;
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
@WebServlet("/clear")
public class ClearReport extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        Report rep = new Report();
        HttpSession session = request.getSession();  
        try {
            rep.deleteReport();
            session.setAttribute("Cleared", "Report cleared");
            response.sendRedirect("Report.jsp");
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }
}