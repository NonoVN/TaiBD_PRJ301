<%-- 
    Document   : e403
    Created on : Jan 19, 2026, 10:44:38 AM
    Author     : HOME
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.message}">
            <h1><span style="color: red">${sessionScope.message}</span></h1>
            <c:remove scope="session" var="message"/>
        </c:if>
            <a href="MainController?action=logout&">Logout</a>
    </body>
</html>
