<%-- 
    Document   : login
    Created on : Feb 5, 2026, 10:49:36 AM
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
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            Username: <input type="text" name="txtUsername" required/><br/>
            Password: <input type="password" name="txtPassword" required/><br/>
            <input type="submit" value="submit"/>
        </form>
        <c:if test="not empty ${message}">
            <span style="color: red">${message}</span>
        </c:if>
    </body>
</html>
