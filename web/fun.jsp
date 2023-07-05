<%-- 
    Document   : fun
    Created on : Feb 10, 2022, 3:40:31 PM
    Author     : lenovo
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head> 
        <%
        String status =  request.getParameter("name");
        int id = (int)request.getSession(false).getAttribute("id");
 Class.forName("com.mysql.jdbc.Driver");
 String query = "UPDATE `donor_master` SET d_status = "+ status + " WHERE u_id = "+id ;
        String url = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
        Connection con = DriverManager.getConnection(url,"root","");
        Statement stmt = con.createStatement();
        stmt.execute(query);
        
        %>
      
        
    
</html>
<% response.sendRedirect("Donor/Donor.jsp");


%>