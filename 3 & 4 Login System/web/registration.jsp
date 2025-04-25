<%-- 
    Document   : registration
    Created on : Apr 25, 2025, 10:17:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script>
        function validateForm() {
            let firstName = document.forms["regForm"]["firstName"].value;
            let lastName = document.forms["regForm"]["lastName"].value;
            let password = document.forms["regForm"]["password"].value;
            let confirmPassword = document.forms["regForm"]["confirmPassword"].value;
            let email = document.forms["regForm"]["email"].value;
            let mobile = document.forms["regForm"]["mobile"].value;
            let address = document.forms["regForm"]["address"].value;
            let role = document.forms["regForm"]["role"].value;

            if (!/^[a-zA-Z]{6,}$/.test(firstName)) {
                alert("First Name must contain only alphabets and be at least 6 characters long");
                return false;
            }
            if (!/^[a-zA-Z]{6,}$/.test(lastName)) {
                alert("Last Name must contain only alphabets and be at least 6 characters long");
                return false;
            }
            if (password.length < 6) {
                alert("Password must be at least 6 characters long");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Passwords do not match");
                return false;
            }
            let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address");
                return false;
            }
            if (!/^\d{10}$/.test(mobile)) {
                alert("Mobile number must be exactly 10 digits");
                return false;
            }
            if (address.trim() === "") {
                alert("Address cannot be empty");
                return false;
            }
            if (role === "") {
                alert("Please select a user role");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h2>Register</h2>
        <form name="regForm" action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <label>First Name:</label><input type="text" name="firstName" value="${param.firstName}" required><br>
            <label>Last Name:</label><input type="text" name="lastName" value="${param.lastName}" required><br>
            <label>Password:</label><input type="password" name="password" required><br>
            <label>Confirm Password:</label><input type="password" name="confirmPassword" required><br>
            <label>Email:</label><input type="email" name="email" value="${param.email}" required><br>
            <label>Mobile Number:</label><input type="text" name="mobile" value="${param.mobile}" required><br>
            <label>Address:</label><input type="text" name="address" value="${param.address}" required><br>
            <label>User Role:</label>
            <select name="role" value="${param.role}" required>
                <option value="">Select Role</option>
                <option value="admin" ${param.role == 'admin' ? 'selected' : ''}>Admin</option>
                <option value="user" ${param.role == 'user' ? 'selected' : ''}>User</option>
            </select><br>
            <input type="submit" value="Register">
        </form>
        <div class="error" id="errorMsg">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
        </div>
    </div>
</body>
</html>
