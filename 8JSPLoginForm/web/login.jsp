<%-- 
    Document   : login
    Created on : Apr 25, 2025
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css">
    <script>
        function validateForm() {
            let username = document.forms["loginForm"]["username"].value;
            let password = document.forms["loginForm"]["password"].value;
            if (username == "") {
                alert("Username must be filled out");
                return false;
            }
            if (password == "") {
                alert("Password must be filled out");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Login to JSP Demo</h2>
        <form name="loginForm" action="validate.jsp" method="post" onsubmit="return validateForm()">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter username">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password">
            <input type="submit" value="Login">
        </form>
        <%-- Display error message if user doesn't exist --%>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <p class="error"><%= error %></p>
        <% } %>
    </div>
</body>
</html>