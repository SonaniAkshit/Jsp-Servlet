<%-- 
    Document   : add
    Created on : Apr 25, 2025, 6:30:29 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="book" class="com.demo.Book" scope="request"/>
<jsp:setProperty name="book" property="*"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Book</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function validateForm() {
            let title = document.forms["bookForm"]["title"].value;
            let author = document.forms["bookForm"]["author"].value;
            let price = document.forms["bookForm"]["price"].value;
            let quantity = document.forms["bookForm"]["quantity"].value;
            let isbn = document.forms["bookForm"]["isbn"].value;
            let publisher = document.forms["bookForm"]["publisher"].value;
            let editionYear = document.forms["bookForm"]["editionYear"].value;
            let catalogueId = document.forms["bookForm"]["catalogueId"].value;
            if (!title || !author || !price || !quantity || !isbn || !publisher || !editionYear || !catalogueId) {
                alert("All fields must be filled out");
                return false;
            }
            if (isNaN(price) || price <= 0) {
                alert("Price must be a positive number");
                return false;
            }
            if (isNaN(quantity) || quantity < 0) {
                alert("Quantity must be a non-negative number");
                return false;
            }
            if (isNaN(editionYear) || editionYear < 1000 || editionYear > 9999) {
                alert("Edition Year must be a valid 4-digit year");
                return false;
            }
            if (isNaN(catalogueId) || catalogueId <= 0) {
                alert("Catalogue ID must be a positive number");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Add New Book</h2>
        <form name="bookForm" action="add.jsp" method="post" onsubmit="return validateForm()">
            <label>Title:</label>
            <input type="text" name="title">
            <label>Author:</label>
            <input type="text" name="author">
            <label>Price:</label>
            <input type="number" name="price" step="0.01">
            <label>Quantity:</label>
            <input type="number" name="quantity">
            <label>ISBN:</label>
            <input type="text" name="isbn">
            <label>Publisher:</label>
            <input type="text" name="publisher">
            <label>Edition Year:</label>
            <input type="number" name="editionYear">
            <label>Catalogue ID:</label>
            <input type="number" name="catalogueId">
            <input type="submit" value="Add Book">
        </form>
        <a href="index.jsp" class="btn">Back to List</a>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jspdb", "root", ""
                );
                    PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO book (title, author, price, quantity, isbn, publisher, edition_year, catalogueId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
                    );
                    stmt.setString(1, book.getTitle());
                    stmt.setString(2, book.getAuthor());
                    stmt.setDouble(3, book.getPrice());
                    stmt.setInt(4, book.getQuantity());
                    stmt.setString(5, book.getIsbn());
                    stmt.setString(6, book.getPublisher());
                    stmt.setInt(7, book.getEditionYear());
                    stmt.setInt(8, book.getCatalogueId());
                    stmt.executeUpdate();
                    stmt.close();
                    conn.close();
        %>
                    <jsp:forward page="index.jsp"/>
        <%
                } catch (Exception e) {
        %>
                    <p class="error">Error: <%= e.getMessage() %></p>
        <%
                }
            }
        %>
    </div>
</body>
</html>
