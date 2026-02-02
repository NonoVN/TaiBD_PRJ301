<%-- 
    Document   : university-form
    Created on : Feb 2, 2026, 9:58:53 AM
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
        <!<!-- private String id,name,shortName,description;
    private int foundedYear;
    private String address,city,region,type;
    private int totalStudents,totalFaculties;
    private boolean isDraft; -->
        <form action="MainController" method="POST"> 
            <input type="hidden" name="action" value="addUniversity"/><br/>
            ID: <input type="text" name="id" value="${u.id} "/><br/>
            Name: <input type="text" name="name" value="${u.name}"/><br/>
            Short Name: <input type="text" name="shortName" value="${u.shortName}"/><br/>
            Description: <input type="text" name="description" value="${u.description}"/><br/>
            Founded Year: <input type="number" step="1" min="0" name="foundedYear" value="${u.foundedYear}"/><br/>
            Address: <input type="text" name="address" value="${u.address}"/><br/>
            City: <input type="text" name="city" value="${u.city}"/><br/>
            Region: <input type="text" name="region" value="${u.region}"/><br/>
            Type: <input type="text" name="type" value="${u.type}"/><br/>
            Total Students: <input type="number" step="1" min="0" name="totalStudents" value="${u.totalStudents}"/><br/>
            Total Faculties: <input type="number" step="1" min="0" name="totalFaculties" value="${u.totalFaculties}"/><br/>
            Draft: <input type="checkbox" checked="${u.isDraft}" name="isDraft"/><br/>
            <input type="submit" value="Submit"/>
        </form>
            <p style="color: green">${msg}</p>
            <p style="color: red">${error}</p>
    </body>
</html>
