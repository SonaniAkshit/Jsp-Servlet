import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><head><title>Servlet Information</title></head><body>");
            out.println("<h2>Initialization Parameters</h2>");
            ServletConfig config = getServletConfig();
            Enumeration<String> initParams = config.getInitParameterNames();
            
            if (!initParams.hasMoreElements()) {
                out.println("<p>No initialization parameters found.</p>");
            } else {
                out.println("<ul>");
                while (initParams.hasMoreElements()) {
                    String paramName = initParams.nextElement();
                    String paramValue = config.getInitParameter(paramName);
                    out.println("<li><strong>" + paramName + ":</strong> " + paramValue + "</li>");
                }
                out.println("</ul>");
            }
            
            out.println("<h2>HTTP Request Headers</h2>");
            Enumeration<String> headerNames = request.getHeaderNames();
            if (!headerNames.hasMoreElements()) {
                out.println("<p>No headers found.</p>");
            } else {
                out.println("<ul>");
                while (headerNames.hasMoreElements()) {
                    String headerName = headerNames.nextElement();
                    String headerValue = request.getHeader(headerName);
                    out.println("<li><strong>" + headerName + ":</strong> " + headerValue + "</li>");
                }
                out.println("</ul>");
            }

            out.println("<h2>Client/Browser Information</h2>");
            out.println("<p><strong>Remote Address:</strong> " + request.getRemoteAddr() + "</p>");
            out.println("<p><strong>Remote Host:</strong> " + request.getRemoteHost() + "</p>");
            out.println("<p><strong>Client User-Agent:</strong> " + request.getHeader("User-Agent") + "</p>");
            
            out.println("<h2>Server Information</h2>");
            out.println("<p><strong>Server Name:</strong> " + request.getServerName() + "</p>");
            out.println("<p><strong>Server Port:</strong> " + request.getServerPort() + "</p>");
            out.println("<p><strong>Servlet Context Path:</strong> " + request.getContextPath() + "</p>");
            
            out.println("</body></html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
