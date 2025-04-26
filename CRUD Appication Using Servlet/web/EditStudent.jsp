<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String id = request.getParameter("id"); // getting student id from URL
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Student</title>
</head>
<body>
    <center>
        <h1>Edit Student</h1>
        <form method="post" action="EditStudent">
            <table border="1" cellpadding="20" cellspacing="0" bgcolor="#f9f9f9"
                   style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px; text-align: left;">
                <%
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clgdb", "root", "");
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE id=?");
                    ps.setString(1, id);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                %>
                <!-- Hidden field to keep ID -->
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

                <tr>
                    <td>NAME:</td>
                    <td><input type="text" name="name" value="<%= rs.getString("name") %>" placeholder="Enter Your Name" required></td>
                </tr>
                <tr>
                    <td>EMAIL:</td>
                    <td><input type="email" name="email" value="<%= rs.getString("email") %>" placeholder="Enter Your Email" required></td>
                </tr>
                <tr>
                    <td>COURSE:</td>
                    <td>
                        <select name="course" required>
                            <option value="">Select Course</option>
                            <option value="BCA" <%= rs.getString("course").equals("BCA") ? "selected" : "" %>>BCA</option>
                            <option value="MCA" <%= rs.getString("course").equals("MCA") ? "selected" : "" %>>MCA</option>
                            <option value="MBA" <%= rs.getString("course").equals("MBA") ? "selected" : "" %>>MBA</option>
                        </select>
                    </td>
                </tr>
                <%
                    } else {
                        out.print("<tr><td colspan='2'>Student Not Found!</td></tr>");
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
                <tr>
                    <th colspan="2">
                        <input type="submit" value="Save Change">
                        <a href="index.jsp"><button>No Change</button></a>
                    </th>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
