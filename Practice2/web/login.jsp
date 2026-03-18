<%-- 
    Document   : login
    Created on : Mar 15, 2026, 10:22:37 PM
    Author     : HOME
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            UserID: <input type="text" name="txtUserID" required/><br/>
            Password: <input type="password" name="txtPassword"required/><br/>
            <input type="submit" value="login">
        </form>
        <c:if test="not empty ${message}">
            <span style="color: red">${message}</span>
        </c:if>
    </body>
</html>
