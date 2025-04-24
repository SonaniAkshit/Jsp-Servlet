import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        // Simple server-side validation
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            course == null || course.trim().isEmpty()) {

            out.println("<script type='text/javascript'>");
            out.println("alert('All fields are required!');");
            out.println("location='addStudent.jsp';"); // redirect back to form
            out.println("</script>");
            return;
        }

        // Email format check (basic)
        if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid email format!');");
            out.println("location='addStudent.jsp';");
            out.println("</script>");
            return;
        }

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

            out.println("<script type='text/javascript'>");
            out.println("alert('Student added successfully!');");
            out.println("location='index.jsp';");
            out.println("</script>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script type='text/javascript'>");
            out.println("alert('Error adding student!');");
            out.println("location='addStudent.jsp';");
            out.println("</script>");
        }
    }
}
