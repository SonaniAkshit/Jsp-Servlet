import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;

public class CompoundInterestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        double principal = Double.parseDouble(request.getParameter("principal"));
        double rate = Double.parseDouble(request.getParameter("rate"));
        int years = Integer.parseInt(request.getParameter("years"));
        int months = Integer.parseInt(request.getParameter("months"));
        int interval = Integer.parseInt(request.getParameter("interval"));

        double time = years + (months / 12.0);

        // Formula: A = P(1 + r/n)^(nt)
        double compoundFactor = Math.pow(1 + (rate / 100) / interval, interval * time);
        double amount = principal * compoundFactor;
        double interest = amount - principal;

        // Set attributes to forward to the JSP or HTML page
        request.setAttribute("principal", principal);
        request.setAttribute("interest", String.format("%.2f", interest));
        request.setAttribute("amount", String.format("%.2f", amount));

        // Forward the request back to index.html
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
