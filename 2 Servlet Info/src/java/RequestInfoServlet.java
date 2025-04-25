import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RequestInfoServlet")
public class RequestInfoServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Print init parameters
        out.println("<h3>Init Parameters:</h3>");
        Enumeration<String> initParams = getServletConfig().getInitParameterNames();
        if (initParams != null) {
            while (initParams.hasMoreElements()) {
                String name = initParams.nextElement();
                String value = getServletConfig().getInitParameter(name);
                out.println("<p>" + name + ": " + value + "</p>");
            }
        } else {
            out.println("<p>No init parameters found</p>");
        }

        // Print HTTP request headers
        out.println("<h3>HTTP Request Headers:</h3>");
        Enumeration<String> headerNames = request.getHeaderNames();
        if (headerNames != null) {
            while (headerNames.hasMoreElements()) {
                String name = headerNames.nextElement();
                String value = request.getHeader(name);
                out.println("<p>" + name + ": " + value + "</p>");
            }
        } else {
            out.println("<p>No headers found</p>");
        }

        // Print client/browser details
        out.println("<h3>Client/Browser Details:</h3>");
        String userAgent = request.getHeader("User-Agent");
        String remoteAddr = request.getRemoteAddr();
        out.println("<p>User-Agent: " + (userAgent != null ? userAgent : "Not available") + "</p>");
        out.println("<p>Remote Address: " + (remoteAddr != null ? remoteAddr : "Not available") + "</p>");

        // Print server details
        out.println("<h3>Server Details:</h3>");
        out.println("<p>Server Name: " + request.getServerName() + "</p>");
        out.println("<p>Server Port: " + request.getServerPort() + "</p>");
        out.println("<p>Server Protocol: " + request.getProtocol() + "</p>");
    }
}