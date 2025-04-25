<%-- 
    Document   : edit
    Created on : Apr 25, 2025, 6:31:09 AM
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
    <title>Edit Book</title>
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
        <h2>Edit Book</h2>
        <%
            // Ensure bookId is provided
            String bookIdParam = request.getParameter("bookId");
            if (bookIdParam == null || bookIdParam.trim().isEmpty()) {
        %>
                <p class="error">Error: No book ID provided</p>
                <a href="index.jsp" class="btn">Back to List</a>
        <%
                return;
            }

            int bookId;
            try {
                bookId = Integer.parseInt(bookIdParam);
            } catch (NumberFormatException e) {
        %>
                <p class="error">Error: Invalid book ID</p>
                <a href="index.jsp" class="btn">Back to List</a>
        <%
                return;
            }

            // Fetch book details
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jspdb", "root", "" // UPDATE THESE CREDENTIALS
                );
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM book WHERE bookId = ?");
                stmt.setInt(1, bookId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    book.setBookId(rs.getInt("bookId"));
                    book.setTitle(rs.getString("title"));
                    book.setAuthor(rs.getString("author"));
                    book.setPrice(rs.getDouble("price"));
                    book.setQuantity(rs.getInt("quantity"));
                    book.setIsbn(rs.getString("isbn"));
                    book.setPublisher(rs.getString("publisher"));
                    book.setEditionYear(rs.getInt("edition_year"));
                    book.setCatalogueId(rs.getInt("catalogueId"));
                } else {
        %>
                    <p class="error">Error: Book not found</p>
                    <a href="index.jsp" class="btn">Back to List</a>
        <%
                    rs.close();
                    stmt.close();
                    conn.close();
                    return;
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
        %>
                <p class="error">Error: <%= e.getMessage() %></p>
                <a href="index.jsp" class="btn">Back to List</a>
        <%
                return;
            }
        %>
        <form name="bookForm" action="edit.jsp" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
            <label>Title:</label>
            <input type="text" name="title" value="<%= book.getTitle() %>">
            <label>Author:</label>
            <input type="text" name="author" value="<%= book.getAuthor() %>">
            <label>Price:</label>
            <input type="number" name="price" step="0.01" value="<%= book.getPrice() %>">
            <label>Quantity:</label>
            <input type="number" name="quantity" value="<%= book.getQuantity() %>">
            <label>ISBN:</label>
            <input type="text" name="isbn" value="<%= book.getIsbn() %>">
            <label>Publisher:</label>
            <input type="text" name="publisher" value="<%= book.getPublisher() %>">
            <label>Edition Year:</label>
            <input type="number" name="editionYear" value="<%= book.getEditionYear() %>">
            <label>Catalogue ID:</label>
            <input type="number" name="catalogueId" value="<%= book.getCatalogueId() %>">
            <input type="submit" value="Update Book">
        </form>
        <a href="index.jsp" class="btn">Back to List</a>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/jspdb", "root", "" // UPDATE THESE CREDENTIALS
                    );
                    PreparedStatement stmt = conn.prepareStatement(
                        "UPDATE book SET title = ?, author = ?, price = ?, quantity = ?, isbn = ?, publisher = ?, edition_year = ?, catalogueId = ? WHERE bookId = ?"
                    );
                    stmt.setString(1, book.getTitle());
                    stmt.setString(2, book.getAuthor());
                    stmt.setDouble(3, book.getPrice());
                    stmt.setInt(4, book.getQuantity());
                    stmt.setString(5, book.getIsbn());
                    stmt.setString(6, book.getPublisher());
                    stmt.setInt(7, book.getEditionYear());
                    stmt.setInt(8, book.getCatalogueId());
                    stmt.setInt(9, book.getBookId());
                    int rows = stmt.executeUpdate();
                    stmt.close();
                    conn.close();
                    if (rows > 0) {
        %>
                        <jsp:forward page="index.jsp"/>
        <%
                    } else {
        %>
                        <p class="error">Error: Failed to update book</p>
        <%
                    }
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