<%-- 
    Document   : home
    Created on : Apr 25, 2025, 10:23:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <style>
        .success {
            color: green;
            font-size: 16px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Welcome</h2>
        <div class="success">
            <%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %>
        </div>
        <p><a href="index.jsp">Logout</a></p>
    </div>
</body>
</html>
