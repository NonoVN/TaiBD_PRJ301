<%-- 
    Document   : e403
    Created on : Jan 19, 2026, 10:44:38 AM
    Author     : HOME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String message= session.getAttribute("message")+"";
            message = (message.equals("null")?"":message);
        %>
        <h1><span style="color: red"><%=message%></span></h1>
        <a href="MainController?action=logout&">Logout</a>
    </body>
</html>
