<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#output
{
height:200px;
width:80%;
border:2px black;
text-align:center;
background-color:red;
margin:auto;
}
</style>
<body>
<h1>INSERT RECORD</h1>
<%
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
int age=Integer.parseInt(request.getParameter("age"));
String phone_no=request.getParameter("phone_no");
String jDate=request.getParameter("join_date");
java.util.Date join_date=null;
SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
try
{
	join_date=sd.parse(jDate);
}
catch(ParseException pe)
{
	pe.printStackTrace();
}
%>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mavanproject" user="root" password="Crem$54321"/>
<sql:update dataSource="${myDB}" var="count">
insert into employees(first_name,last_name,phone_no,age,join_date) values(?,?,?,?,?)

<sql:param value="<%=first_name%>"></sql:param>
<sql:param value="<%=last_name%>"></sql:param>
<sql:param value="<%=phone_no%>"></sql:param>
<sql:param value="<%=age%>"></sql:param>
<sql:param value="<%=join_date%>"></sql:param>

</sql:update>

<div id="output">
<H1>Record inserted Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>
</body>
</html>
