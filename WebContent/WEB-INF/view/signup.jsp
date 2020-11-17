<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
	<h3> Fill out this form to register! </h3>
	
	<f:form modelAttribute="newuser" action="saveUser.htm" method="POST">
		<label> First Name: </label> <f:input path="fname"/>  <br>
		<label> Last Name: </label> <f:input path="lname"/> <br>
		<label> User Name: </label> <f:input path="uname"/> <br>
		<label> Password: </label> <f:input path="pwd"/> <br>
		<label> Email: </label> <f:input path="primary_email"/>  <br>
		<label> Date of Birthday: </label> <f:input path="dob"/> <br>
		
		<br><br><br>
		<input type="submit" value="Register!">
		
	</f:form>
</center>
</body>
</html>