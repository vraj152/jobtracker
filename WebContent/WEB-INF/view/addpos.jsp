<%@page import="com.jt.entity.User"%>
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
<%
	request.setAttribute("curr_user",(User) request.getAttribute("userinfo"));
%>
<center>
	<h3> Let us know the position where you've applied! </h3>
	
	<f:form action="save_job.htm" modelAttribute="positionDetails" method="POST">
	
		<label> Company: </label> <f:input path="job.company" type="text" name="cname"/> <br>
		<label> Date:</label> <f:input path="date" type="text" name="app_date"/> <br>
		<label> URL: </label> <f:input path="job.url" type="text" name="app_url"/> <br>
		<label> Used Email: </label> <f:input path="email_used" type="text" name="app_email" value="${curr_user.primary_email}"/> <br>
		
		<label> Resume: </label> <f:select path="resume.res_id">
									<c:forEach items="${resumes}" var="q">
										<f:option value="${q.res_id }"> ${q.res_name }</f:option>
									</c:forEach>
								 </f:select>
		<br>
		
		<label> Referral: </label> <f:radiobutton path="referral"  value="0" label="No Referral"/> 
								   <f:radiobutton path="referral" value="1" label="Referral"/> 
								   
		<br><br><br>
		
		<input type="submit" value="Register!">
	</f:form>
	
	<br><br><br>
	
	<a href="homePage.htm"> Go back to home page. </a>
	
</center>
</body>
</html>