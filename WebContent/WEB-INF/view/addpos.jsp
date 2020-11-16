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
	<h3> Let us know the position where you've applied! </h3>
	
	<form action="" method="POST">
	
		Company: <input type="text" name="cname" placeholder="Enter Company Name.."/> <br>
		Date: <input type="text" name="app_date" placeholder="Date.."/> <br>
		URL: <input type="text" name="app_url" placeholder="Enter URL.."/> <br>
		Used Email: <input type="text" name="app_email" placeholder="Which email did you use?.."/> <br>
		Resume: <input type="text" name="app_resume" placeholder="Which resume did you use?.."/> <br>
		Referral: <input type="text" name="referral" placeholder="Did you have referral?.."/> <br>
		 
		<br>
		
		<input type="submit" value="Register!">	
	</form>
</center>
</body>
</html>