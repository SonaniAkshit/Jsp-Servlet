<%-- 
    Document   : index.jsp
    Created on : Apr 25, 2025, 10:16:55 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script>
        function validateLogin() {
            let email = document.forms["loginForm"]["email"].value;
            let password = document.forms["loginForm"]["password"].value;

            let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address");
                return false;
            }
            if (password.length < 6) {
                alert("Password must be at least 6 characters long");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form name="loginForm" action="LoginServlet" method="post" onsubmit="return validateLogin()">
            <label>Email:</label><input type="text" name="email" value="${param.email}" required><br>
            <label>Password:</label><input type="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <div class="error" id="errorMsg">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
        </div>
        <p>Don't have an account? <a href="registration.jsp">Register</a></p>
    </div>
</body>
</html>
