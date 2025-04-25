<%-- 
    Document   : index
    Created on : Apr 25, 2025, 6:14:33 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Medicine Search</title>
    <link rel="stylesheet" href="search.css">
    <script>
        function validateForm() {
            let searchTerm = document.forms["searchForm"]["searchTerm"].value;
            if (searchTerm.trim() === "") {
                alert("Please enter a medicine name or manufacturer name");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="search-container">
        <h2>Medicine Search</h2>
        <form name="searchForm" action="index.jsp" method="post" onsubmit="return validateForm()">
            <label for="searchTerm">Search by Medicine or Manufacturer:</label>
            <input type="text" id="searchTerm" name="searchTerm" placeholder="Enter name">
            <input type="submit" value="Search">
        </form>

        <%-- Display search results --%>
        <%
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/jspdb", "root", ""
                    );
                    
                    // Search query
                    PreparedStatement stmt = conn.prepareStatement(
                        "SELECT * FROM medicine WHERE medicine_name LIKE ? OR manufacturer_name LIKE ?"
                    );
                    stmt.setString(1, "%" + searchTerm + "%");
                    stmt.setString(2, "%" + searchTerm + "%");
                    ResultSet rs = stmt.executeQuery();
        %>
                    <h3>Search Results</h3>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Medicine Name</th>
                            <th>Details</th>
                            <th>Manufacturer</th>
                            <th>Batch No</th>
                            <th>Mfg Date</th>
                            <th>Exp Date</th>
                        </tr>
        <%
                    boolean hasResults = false;
                    while (rs.next()) {
                        hasResults = true;
        %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("medicine_name") %></td>
                            <td><%= rs.getString("medicine_detail") %></td>
                            <td><%= rs.getString("manufacturer_name") %></td>
                            <td><%= rs.getString("batch_no") %></td>
                            <td><%= rs.getString("mfg_month_year") %></td>
                            <td><%= rs.getString("exp_month_year") %></td>
                        </tr>
        <%
                    }
                    if (!hasResults) {
        %>
                        <tr>
                            <td colspan="7" class="no-results">No medicines found</td>
                        </tr>
        <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
        %>
                    <p class="error">Error: <%= e.getMessage() %></p>
        <%
                }
            }
        %>
        </table>
    </div>
</body>
</html>