import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class CompoundInterestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        double principal = Double.parseDouble(request.getParameter("principal"));
        double rate = Double.parseDouble(request.getParameter("rate"));
        int years = Integer.parseInt(request.getParameter("years"));
        int months = Integer.parseInt(request.getParameter("months"));
        int interval = Integer.parseInt(request.getParameter("interval"));

        double time = years + (months / 12.0);

        double compoundFactor = Math.pow(1 + (rate / 100) / interval, interval * time);
        double amount = principal * compoundFactor;
        double interest = amount - principal;

        // Set the response content type to HTML
        response.setContentType("text/html");

        // Write the output directly to the response
        response.getWriter().println("<html>");
        response.getWriter().println("<head><title>Compound Interest Calculation</title></head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h1>Compound Interest Calculation</h1>");
        response.getWriter().println("<p>Principal: " + principal + "</p>");
        response.getWriter().println("<p>Rate: " + rate + "%</p>");
        response.getWriter().println("<p>Time: " + years + " years and " + months + " months</p>");
        response.getWriter().println("<p>Compounding Interval: " + interval + " times per year</p>");
        response.getWriter().println("<p>Interest: " + String.format("%.2f", interest) + "</p>");
        response.getWriter().println("<p>Total Amount: " + String.format("%.2f", amount) + "</p>");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }
}
