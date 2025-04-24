/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;

/**
 *
 * @author Admin
 */
public class HelloServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");

        if (session.getAttribute("name") == null) {
            session.setAttribute("name", name);
            session.setAttribute("startTime", new Date());
            session.setAttribute("visitCount", 1);
        } else {
            int count = (Integer) session.getAttribute("visitCount");
            session.setAttribute("visitCount", count + 1);
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><body>");
        out.println("<div style='text-align:right;'>Start Time: " + session.getAttribute("startTime") + "</div>");
        out.println("<h2>Hello " + session.getAttribute("name") + "</h2>");
        out.println("<p>Visit Count: " + session.getAttribute("visitCount") + "</p>");
        out.println("<h3>Session Information:</h3><ul>");

        Enumeration<String> names = session.getAttributeNames();
        while (names.hasMoreElements()) {
            String attr = names.nextElement();
            out.println("<li>" + attr + ": " + session.getAttribute(attr) + "</li>");
        }

        out.println("</ul>");
        out.println("<form action='LogoutServlet' method='post'><button type='submit'>Logout</button></form>");
        out.println("</body></html>");
    }
}