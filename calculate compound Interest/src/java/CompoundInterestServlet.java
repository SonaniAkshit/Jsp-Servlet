import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CompoundInterestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Parse input values
        double principal = Double.parseDouble(request.getParameter("principal"));
        double rate = Double.parseDouble(request.getParameter("rate"));
        int years = Integer.parseInt(request.getParameter("years"));
        int months = Integer.parseInt(request.getParameter("months"));
        int interval = Integer.parseInt(request.getParameter("interval"));

        // Convert months to years fraction
        double time = years + (months / 12.0);

        // Compound Interest Formula: A = P(1 + r/n)^(nt)
        double compoundFactor = Math.pow(1 + (rate / 100) / interval, interval * time);
        double amount = principal * compoundFactor;
        double interest = amount - principal;

        // Return result
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h5>Calculated Compound Interest:</h5>");
        out.println("<p>Principal: $" + principal + "</p>");
        out.println("<p>Interest: $" + String.format("%.2f", interest) + "</p>");
        out.println("<p>Total Amount: $" + String.format("%.2f", amount) + "</p>");
        out.println("<a href='index.html'>Go Back</a>");
        out.println("</body></html>");
    }
}
