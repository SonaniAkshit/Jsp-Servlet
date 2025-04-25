<%-- 
    Document   : validate
    Created on : Apr 25, 2025
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="user" class="com.demo.User" scope="session"/>
<jsp:setProperty name="user" property="username" param="username"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Validate User</title>
</head>
<body>
    <%-- Scriptlet to verify user --%>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean userExists = false;
        String userRole = null;
        
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jspdb", "root", ""
            );
            
            // Check if user exists
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM user WHERE username = ? AND password = ?"
            );
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                userExists = true;
                // Get user role
                PreparedStatement roleStmt = conn.prepareStatement(
                    "SELECT role FROM user_role WHERE username = ?"
                );
                roleStmt.setString(1, username);
                ResultSet roleRs = roleStmt.executeQuery();
                if (roleRs.next()) {
                    userRole = roleRs.getString("role");
                }
                roleStmt.close();
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        
        if (!userExists) {
            // Set error message and forward back to login
            request.setAttribute("error", "Invalid username or password");
    %>
            <jsp:forward page="login.jsp"/>
    <%
        } else if ("admin".equals(userRole)) {
            // Forward to admin page
    %>
            <jsp:forward page="admin.jsp"/>
    <%
        } else {
            // Forward to welcome page
    %>
            <jsp:forward page="welcome.jsp"/>
    <%
        }
    %>
</body>
</html>