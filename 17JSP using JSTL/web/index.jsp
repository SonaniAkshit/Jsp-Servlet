<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Student List</title>
</head>
<body>
<h2>Student List</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Enrolled Date</th>
    </tr>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.email}</td>
            <td><fmt:formatDate value="${student.enrolled_date}" pattern="dd-MM-yyyy"/></td>
        </tr>
    </c:forEach>
</table>

<c:if test="${empty students}">
    <p>No students found.</p>
</c:if>

</body>
</html>
