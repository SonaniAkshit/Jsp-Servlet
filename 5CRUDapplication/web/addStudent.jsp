<%-- 
    Document   : student-form
    Created on : Apr 24, 2025, 4:40:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            border: 1px solid black;
            padding: 20px;
            text-align: center;
        }
        input[type="text"], input[type="email"] {
            margin: 10px 0;
            padding: 5px;
            width: 200px;
        }
        input[type="submit"] {
            margin-top: 10px;
            padding: 5px 20px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="AddStudentServlet" method="post">
            Name: <input type="text" name="name"><br>
            Email: <input type="email" name="email"><br>
            Course: <input type="text" name="course"><br>
            <input type="submit" value="Add">
        </form>
    </div>
</body>
</html>