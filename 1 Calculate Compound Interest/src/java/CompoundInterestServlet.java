import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CompoundInterestServlet")
public class CompoundInterestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get and validate inputs
        double principal, rate, years, months, n, t;
        try {
            principal = Double.parseDouble(request.getParameter("principal"));
            rate = Double.parseDouble(request.getParameter("rate"));
            years = Double.parseDouble(request.getParameter("years1"));
            months = Double.parseDouble(request.getParameter("years2"));
            n = Double.parseDouble(request.getParameter("compound"));

            if (principal <= 0 || rate <= 0 || (years + months/12) <= 0 || n <= 0) {
                out.println("<h3>Error: All values must be positive!</h3>");
                return;
            }
        } catch (NumberFormatException e) {
            out.println("<h3>Error: Please enter valid numbers!</h3>");
            return;
        }

        // Calculate time in years
        t = years + (months / 12);

        // Calculate compound interest
        double amount = principal * Math.pow(1 + (rate / (n * 100)), n * t);
        double interest = amount - principal;

        // Output result in Rs
        out.println("<h3>Results:</h3>");
        out.println("<p>Principal Amount: Rs " + principal + "</p>");
        out.println("<p>Interest Rate: " + rate + "%</p>");
        out.println("<p>Time: " + years + " years and " + months + " months</p>");
        out.println("<p>Compound Frequency: " + n + " times per year</p>");
        out.println("<p>Compound Interest: Rs " + String.format("%.2f", interest) + "</p>");
        out.println("<p>Total Amount: Rs " + String.format("%.2f", amount) + "</p>");
    }
}