<%-- 
    Document   : welcome
    Created on : Feb 5, 2026, 11:19:04 AM
    Author     : HOME
--%>
<%@page import="model.UniversityDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty user}">
                <h1>Welcome,${user.fullName}  </h1>
                <a href="MainController?action=logout&">Logout</a>
                <a href="search.jsp">Search</a><br/>
            </c:when>

            <c:otherwise>
                <c:redirect url="login.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
