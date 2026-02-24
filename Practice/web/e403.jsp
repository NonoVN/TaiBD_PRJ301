<%-- 
    Document   : e403
    Created on : Feb 5, 2026, 11:19:57 AM
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
