import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        String tableName = "";
        if ("admin".equalsIgnoreCase(userType)) {
            tableName = "Admin";
        } else if ("user".equalsIgnoreCase(userType)) {
            tableName = "User";
        } else if ("author".equalsIgnoreCase(userType)) {
            tableName = "Author";
        }

        String jdbcURL = "jdbc:mysql://localhost:3306/bookstoredb";
        String dbUser = "root"; // Replace with your DB username
        String dbPassword = ""; // Replace with your DB password

        String sql = "INSERT INTO " + tableName + " (firstName, lastName, email, mobile, password) VALUES (?, ?, ?, ?, ?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, email);
            statement.setString(4, mobile);
            statement.setString(5, password);

            int rows = statement.executeUpdate();

            if (rows > 0) {
                response.getWriter().println("Registration successful for " + userType);
            } else {
                response.getWriter().println("Registration failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
