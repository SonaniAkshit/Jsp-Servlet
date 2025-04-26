<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Student</title>
</head>
<body>
<center>
    <h1>Search Student</h1>

    <!-- Search Student Form -->
    <form method="post">
        <table border="1" cellpadding="20" cellspacing="0" bgcolor="#f9f9f9"
                   style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px; text-align: left;">
            <tr>
                <td>NAME:</td>
                <td><input type="text" name="name" placeholder="Enter Name"></td>
            </tr>
            <tr>
                <td>EMAIL:</td>
                <td><input type="email" name="email" placeholder="Enter Email"></td>
            </tr>
            <tr>
                <td>COURSE:</td>
                <td>
                    <select name="course">
                        <option value="">Select Course</option>
                        <option value="BCA">BCA</option>
                        <option value="MCA">MCA</option>
                        <option value="MBA">MBA</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Search Student">
                </td>
            </tr>
        </table>
    </form>

    <br><br>

    <!-- Search Result Table -->
    <table border="1" cellpadding="20" cellspacing="0" bgcolor="#f9f9f9"
                   style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px; text-align: left;">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>COURSE</th>
        </tr>

        <%
            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clgdb", "root", "");

                // Prepare SQL based on search inputs
                String sql = "SELECT * FROM students WHERE 1=1";

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String course = request.getParameter("course");

                if (name != null && !name.isEmpty()) {
                    sql += " AND name LIKE '%" + name + "%'";
                }
                if (email != null && !email.isEmpty()) {
                    sql += " AND email LIKE '%" + email + "%'";
                }
                if (course != null && !course.isEmpty()) {
                    sql += " AND course = '" + course + "'";
                }

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                boolean hasResults = false;
                while (rs.next()) {
                    hasResults = true;
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("course") %></td>
        </tr>
        <%
                }
                if (!hasResults) {
        %>
        <tr>
            <td colspan="5" align="center">No students found!</td>
        </tr>
        <%
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</center>
</body>
</html>
