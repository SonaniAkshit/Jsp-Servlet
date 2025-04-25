import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jspdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            conn.setAutoCommit(false);

            String checkSql = "SELECT email FROM users WHERE email = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("errorMessage", "Email already registered!");
                request.getRequestDispatcher("/registration.jsp").forward(request, response);
                return;
            }

            String userSql = "INSERT INTO users (first_name, last_name, password, email, mobile, address) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(userSql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, password); // Hash in production
            pstmt.setString(4, email);
            pstmt.setString(5, mobile);
            pstmt.setString(6, address);
            pstmt.executeUpdate();

            String roleSql = "INSERT INTO user_roles (email, role) VALUES (?, ?)";
            pstmt = conn.prepareStatement(roleSql);
            pstmt.setString(1, email);
            pstmt.setString(2, role);
            pstmt.executeUpdate();

            conn.commit();
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException se) {
                    request.setAttribute("errorMessage", "Rollback error: " + se.getMessage());
                }
            }
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                request.setAttribute("errorMessage", "Database closing error: " + e.getMessage());
                request.getRequestDispatcher("/registration.jsp").forward(request, response);
            }
        }
    }
}