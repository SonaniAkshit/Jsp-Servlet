<%-- 
    Document   : index
    Created on : Apr 26, 2025, 11:01:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <center>
        <h1>Student CRUD</h1>
        <!-- Add Student -->
        <form method="post" action="AddStudent">
            <table border="1" cellpadding="20" cellspacing="0" bgcolor="#f9f9f9"
                   style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px; text-align: left;">
                <tr>
                    <td>NAME:</td>
                    <td><input type="text" name="name" placeholder="Enter Your Name" required></td>
                </tr>
                <tr>
                    <td>EMAIL:</td>
                    <td><input type="email" name="email" placeholder="Enter Your Email" required></td>
                </tr>
                <tr>
                    <td>COURSE:</td>
                    <td>
                        <select name="course" required>
                            <option value="">Select Course</option>
                            <option value="BCA">BCA</option>
                            <option value="MCA">MCA</option>
                            <option value="MBA">MBA</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th colspan="2"><input type="submit" value="ADD Student">
                        <input type="reset" value="Reset">
                        <a href="search.jsp"><button type="button">Search Student</button></a></th>
                </tr>
            </table>
        </form>

        <br><br>
        <!-- Display Student List -->
        <table border="1" cellpadding="20" cellspacing="0" bgcolor="#f9f9f9"
               style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px; text-align: left;">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>COURSE</th>
                <th>ACTION</th>
            </tr>
            <%
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clgdb", "root", "");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM students");

                    while (rs.next()) {
            %>
            <tr>
                 
                <th><%= rs.getInt("id") %></th>
                <th><%= rs.getString("name") %></th>
                <th><%= rs.getString("email") %></th>
                <th><%= rs.getString("course") %></th>
                <th>
                    <a href="EditStudent.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
                    <a href="DeleteStudent?&id=<%= rs.getInt("id") %>">Delete</a>
            </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
    </center>
</body>
</html>
