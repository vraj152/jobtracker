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
		<h3> Update Personal Details </h3>
		
		<f:form action="updateUser.htm" modelAttribute="userInfo" method="POST">
			<label> First Name: </label> <f:input path="fname" type="text"/> <br>
			<label> Last Name: </label> <f:input path="lname" type="text"/> <br>
			<label> Password: </label> <f:input path="pwd" type="password"/> <br>
			<label> Birth Date: </label> <f:input path="dob" type="text"/> <br>
			<label> Primary Email: </label> <f:input path="primary_email" type="text" readonly="True"/> <br>
			
			<br><br>
			
			<input type="submit" value="Update Details"/> <br>
		</f:form>
	
		<br><br><br>
		
		<a href="homePage.htm"> Go back to home page. </a>
	
	</center>
</body>
</html>