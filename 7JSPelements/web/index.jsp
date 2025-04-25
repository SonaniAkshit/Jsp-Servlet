<%-- 
    Document   : index
    Created on : Apr 25, 2025, 5:43:56 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>

<body>
    <h2>1. JSP Scripting Elements</h2>
    
    <%-- Declaration: Declares a variable --%>
    <%! int visitCount = 0; %>
    
    <%-- Scriptlet: Java code to increment counter --%>
    <%
        visitCount++;
        String currentTime = new Date().toString();
    %>
    
    <%-- Expression: Outputs data --%>
    <p>This page has been visited <b><%= visitCount %></b> time(s).</p>
    <p>Current Time: <b><%= currentTime %></b></p>

    <h2>2. JSP Implicit Objects</h2>
    <p>Your IP Address: <b><%= request.getRemoteAddr() %></b></p>
    <p>Server Name: <b><%= application.getServerInfo() %></b></p>
    <p>Session ID: <b><%= session.getId() %></b></p>

    <h2>3. JSP Action Tags</h2>
    <jsp:useBean id="user" class="com.demo.User" scope="session" />
    <jsp:setProperty name="user" property="name" value="Guest User" />
    <p>Welcome, <b><jsp:getProperty name="user" property="name" /></b>!</p>

    <h2>4. JSP Directives</h2>
    <p>The page directive at the top sets content type and imports the Date class.</p>
    <p>The include directive brings in the header.jsp file.</p>

</body>
</html>