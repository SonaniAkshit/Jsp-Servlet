<%-- 
    Document   : admin
    Created on : Apr 25, 2025
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.demo.User" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        h2 { color: navy; }
    </style>
</head>
<body>
    <h2>Welcome, Admin <jsp:getProperty name="user" property="username"/>!</h2>
    <p>This is the admin dashboard.</p>
    <a href="login.jsp">Logout</a>
</body>
</html>