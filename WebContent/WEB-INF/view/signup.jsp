<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	
	<form action="" method="POST">
	
		First Name: <input type="text" name="fname" placeholder="Enter Your First Name.."/> <br>
		Last Name: <input type="text" name="lname" placeholder="Enter Your Last Name.."/> <br>
		Email: <input type="text" name="email" placeholder="Enter Your email.."/> <br>
		User Name: <input type="text" name="uname" placeholder="Pick username.."/> <br>
		Password: <input type="text" name="pwd" placeholder="Create Password.."/> <br>
		Another Email?: <input type="text" name="ano_email" placeholder="Enter Your email.."/> <br>
		DoB: <input type="text" name="dob" placeholder="Enter Your Birthdate.."/> <br>
		<br>
		
		<input type="submit" value="Register!">	
	</form>
</center>
</body>
</html>