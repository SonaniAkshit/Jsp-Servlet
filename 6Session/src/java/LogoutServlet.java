import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;

public class LogoutServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false); // Don't create a new session

        out.println("<html><body>");

        if (session == null || session.getAttribute("name") == null) {
            out.println("<h2>You are already logged out.</h2>");
        } else {
            String name = (String) session.getAttribute("name");
            Date startTime = (Date) session.getAttribute("startTime");
            Date endTime = new Date();

            long duration = (endTime.getTime() - startTime.getTime()) / 1000;

            session.invalidate();

            out.println("<h2>Thank you, " + name + "!</h2>");
            out.println("<p>Session duration: " + duration + " seconds.</p>");
        }

        out.println("</body></html>");
    }
}
