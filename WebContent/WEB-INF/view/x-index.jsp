<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function showAlert(msg){
		alert(msg);
	}
</script>
</head>
<body>
<center>
	<c:if test="${not empty sessionMessage}">
		<script> showAlert("${sessionMessage}") </script>
	</c:if>
	<f:form action="verifyuser.htm" modelAttribute="credentials" method="POST">
		<label> Username </label>: <f:input path="uname" type="text" name="uname"/> <br>
		<label> Password </label>: <f:input path="pwd" type="password" name="pwd"/> <br><br>
		<input type="submit" value="Let me in!"/> <br>
	</f:form>
</center>
<br>
<br>

<center>
	<h2> New User? Click here to Sign up! </h2>
	<br> <a href="signup.htm"> Sign Up!</a> <br>
</center>

</body>
</html>