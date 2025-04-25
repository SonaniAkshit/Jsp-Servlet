<%-- 
    Document   : delete
    Created on : Apr 25, 2025, 6:31:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Book</title>
</head>
<body>
    <%
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jspdb", "root", ""
            );
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM book WHERE bookId = ?");
            stmt.setInt(1, bookId);
            stmt.executeUpdate();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            return;
        }
    %>
    <jsp:forward page="index.jsp"/>
</body>
</html>
