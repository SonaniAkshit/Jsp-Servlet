<%-- 
    Document   : index.jsp
    Created on : Apr 24, 2025, 4:40:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clgdb", "root", "");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM students");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <style>
        .table-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0;
        }
        table {
            border: 1px solid black;
            border-collapse: collapse;
            margin-top: 20px;
            width: 50%;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid black;
        }
        a {
            display: block;
            text-align: center;
            margin: 20px 0;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h2>Student List</h2>
        <a href="addStudent.jsp">Add New Student</a>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
            <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("course") %></td>
                <td>
                    <a href="editStudent.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                    <a href="DeleteStudentServlet?id=<%= rs.getInt("id") %>">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    <% conn.close(); %>
</body>
</html>