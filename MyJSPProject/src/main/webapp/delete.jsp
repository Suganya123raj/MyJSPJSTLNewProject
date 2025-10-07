<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Page</title>
</head>
<style>
#output
{
height:200px;
width:80%;
border:2px black;
text-align:center;
background-color:pink;
margin:auto;
}
</style>
<body>

<%
    
    String emp_id = request.getParameter("emp_id");
%>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/mavanproject"
    user="root" password="Crem$54321" />
<sql:update dataSource="${myDB}">
    DELETE FROM employees WHERE emp_id = ?
    <sql:param value="<%= emp_id %>" />
</sql:update>
<div id="output">
    <h1>Record Deleted Successfully</h1>
    <button onclick="history.back()">Go Back</button>
</div>
</body>
</html>