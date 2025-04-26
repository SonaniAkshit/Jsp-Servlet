import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class AddStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/clgdb", "root", ""
            );
            PreparedStatement ps = conn.prepareStatement("INSERT INTO students(name, email, course) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.executeUpdate();
            out.println("Student added successfully.");
            out.println("<a href='index.jsp'>Go TO Home</a>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error in AddStudentServlet: " + e.getMessage());
        }
         response.sendRedirect("index.jsp");
    }
}
