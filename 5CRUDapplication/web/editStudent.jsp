<%-- 
    Document   : student-form
    Created on : Apr 24, 2025, 4:40:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = "", email = "", course = "";

    if (id != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clgdb", "root", "");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
                course = rs.getString("course");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= (id != null) ? "Edit Student" : "Add Student" %></title>
    <style>
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            border: 1px solid black;
            padding: 20px;
            text-align: center;
        }
        input[type="text"], input[type="email"] {
            margin: 10px 0;
            padding: 5px;
            width: 200px;
        }
        input[type="submit"] {
            margin-top: 10px;
            padding: 5px 20px;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="<%= (id != null) ? "UpdateStudentServlet" : "AddStudentServlet" %>" method="post">
            <% if (id != null) { %>
                <input type="hidden" name="id" value="<%= id %>">
            <% } %>
            Name: <input type="text" name="name" value="<%= name %>" required><br>
            Email: <input type="email" name="email" value="<%= email %>" required><br>
            Course: <input type="text" name="course" value="<%= course %>" required><br>
            <input type="submit" value="<%= (id != null) ? "Update" : "Add" %> Student">
        </form>
    </div>
    <a href="index.jsp">Back to Student List</a>
</body>
</html>