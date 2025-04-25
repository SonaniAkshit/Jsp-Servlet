<%-- 
    Document   : index
    Created on : Apr 25, 2025, 6:29:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Management</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Book Management</h2>
        <a href="add.jsp" class="btn">Add New Book</a>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>ISBN</th>
                <th>Publisher</th>
                <th>Edition Year</th>
                <th>Catalogue ID</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/jspdb", "root", ""
                    );
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM book");
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("bookId") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getString("isbn") %></td>
                <td><%= rs.getString("publisher") %></td>
                <td><%= rs.getInt("edition_year") %></td>
                <td><%= rs.getInt("catalogueId") %></td>
                <td>
                    <a href="edit.jsp?bookId=<%= rs.getInt("bookId") %>" class="btn btn-edit">Edit</a>
                    <a href="delete.jsp?bookId=<%= rs.getInt("bookId") %>" class="btn btn-delete" 
                       onclick="return confirm('Are you sure you want to delete this book?')">Delete</a>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
            %>
                <tr><td colspan="10" class="error">Error: <%= e.getMessage() %></td></tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
