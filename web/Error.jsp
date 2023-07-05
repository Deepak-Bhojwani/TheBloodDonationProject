<%-- 
    Document   : Error
    Created on : Apr 3, 2022, 7:49:53 PM
    Author     : lenovo
--%>
<%@ page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        your error is <%= exception.getMessage() %>
    </body>
</html>
