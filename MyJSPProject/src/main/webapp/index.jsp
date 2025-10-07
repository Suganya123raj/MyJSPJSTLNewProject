<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color:pink;
        padding: 20px;
        
    }

    h1 {
        color:green;
    }
    h2
    {
    color:red;
    }

    form {
        background-color:yellow;
        padding: 20px;
        border-radius: 10px;
        width: 300px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        
    }

    label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
        
    }

    input[type="text"],
    input[type="number"],
    input[type="datetime-local"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        box-sizing: border-box;
        border: 1px solid red;
        border-radius: 4px;
        
    }

    input[type="submit"] {
        margin-top: 20px;
        padding: 10px;
        width: 100%;
        background-color:blue;
        color: white;
        border:black;
        border-radius: 5px;
        cursor: pointer;
        
    }

    input[type="submit"]:hover {
        background-color: blue;
       
    }
</style>
</head>
<body>
<h1> INSERT RECORD</h1>
<form action="welcome.jsp" method="GET">

    <label>First Name:</label>
    <input type="text" name="first_name"><br><br>
    <label>Last Name:</label>
    <input type="text" name="last_name"><br><br>
    <label>age:</label>
    <input type="number" name="age"><br><br>
    <label>Phone_no:</label>
    <input type="text" name="phone_no"><br><br>
    <label>Join Date:</label>
    <input type="datetime-local" name="join_date"><br><br>
    <input type="submit" value="submit">
</form>
<h2>Update Record</h2>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mavanproject" user="root" password="Crem$54321" />
<sql:query dataSource="${myDB}" var="myIds">
    SELECT emp_id FROM employees
</sql:query>
<form action="UpdateEmployees.jsp" method="POST">
<select name="emp_id" >
<c:forEach var="myId" items="${myIds.rows}">
<option value="${myId.emp_id}">${myId.emp_id}</option>
</c:forEach>
</select>
<fieldset>
<label>Field:</label><input type="checkbox" name="myField" value="first_name">first_name<label>Value :</label><input type="text" name="first_nameInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="last_name">last_name<label>Value :</label><input type="text" name="last_nameInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="age">age<label>Value :</label><input type="text" name="ageInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="phone_no">Phone_no<label>Value :</label><input type="text" name="phone_noInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="join_date">join_date<label>Value :</label><input type="datetime-local" name="join_dateInput"><br>
<input type="submit" value="Update Record">
</fieldset>
</form>
<h2>DELETE RECORD</h2>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mavanproject" user="root" password="Crem$54321" />
<sql:query dataSource="${myDB}" var="myIds">
    SELECT emp_id FROM employees
</sql:query>
<form action="delete.jsp" method="POST">
<select name="emp_id" >
<c:forEach var="myId" items="${myIds.rows}">
<option value="${myId.emp_id}">${myId.emp_id}</option>
</c:forEach>
</select>
<input type="submit" value="Delete Record" />
</form>
<h2> SELECT RECORD</h2>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mavanproject" user="root" password="Crem$54321" />
<sql:query dataSource="${myDB}" var="myIds">
    SELECT emp_id FROM employees
</sql:query>
<form action="select.jsp" method="POST">
<input type="submit" value="select Record" />
</form>
</body>
</html>

