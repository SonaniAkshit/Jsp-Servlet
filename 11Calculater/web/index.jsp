<%-- 
    Document   : index
    Created on : Apr 25, 2025, 6:49:37 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="calc" class="com.demo.Calculator" scope="request"/>
<jsp:setProperty name="calc" property="*"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Calculator</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function validateForm() {
            let operand1 = document.forms["calcForm"]["operand1"].value;
            let operand2 = document.forms["calcForm"]["operand2"].value;
            let operation = document.querySelector('input[name="operation"]:checked');
            if (operand1 === "" || isNaN(operand1)) {
                alert("Please enter a valid number for Operand 1");
                return false;
            }
            if (operand2 === "" || isNaN(operand2)) {
                alert("Please enter a valid number for Operand 2");
                return false;
            }
            if (!operation) {
                alert("Please select an operation");
                return false;
            }
            return true;
        }

        function resetForm() {
            document.getElementById("calcForm").reset();
            document.getElementById("result").innerText = "";
        }
    </script>
</head>
<body>
    <div class="calculator-container">
        <h2>Calculator</h2>
        <form name="calcForm" action="index.jsp" method="post" onsubmit="return validateForm()">
            <label>Operand 1:</label>
            <input type="number" step="0.1" name="operand1" value="<%= calc.getOperand1() %>">
            <div class="operation">
                <label>Operation:</label>
                <input type="radio" name="operation" value="Add" <%= "Add".equals(calc.getOperation()) ? "checked" : "" %>> Add
                <input type="radio" name="operation" value="Sub" <%= "Sub".equals(calc.getOperation()) ? "checked" : "" %>> Sub
                <input type="radio" name="operation" value="Mul" <%= "Mul".equals(calc.getOperation()) ? "checked" : "" %>> Mul
                <input type="radio" name="operation" value="Div" <%= "Div".equals(calc.getOperation()) ? "checked" : "" %>> Div
            </div>
            <label>Operand 2:</label>
            <input type="number" step="0.1" name="operand2" value="<%= calc.getOperand2() %>">
            <input type="submit" value="Calculate">
            <input type="button" value="Reset" onclick="resetForm()">
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                calc.calculate();
                double result = calc.getResult();
                if (Double.isNaN(result)) {
        %>
                    <p id="result" class="error">Error: Division by zero</p>
        <%
                } else {
        %>
                    <p id="result">Result: <%= result %></p>
        <%
                }
            }
        %>
    </div>
</body>
</html>