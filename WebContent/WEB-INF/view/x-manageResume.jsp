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
	<h3> Manage Your Resumes</h3>
	
	<table border="1px solid black" cellpadding = "5" cellspacing = "5">
		<thead>
			<tr>
				<th> Resume Name </th>
				<th> Resume </th>
				<th> Uploaded Date </th> 
			</tr>
		</thead>
		
		<tbody>
				<c:forEach items="${resumes}" var="q">
					<tr>
						<td style="color: black"> ${q.res_name }</td>
						<td style="color: black"> <a href="${q.res_url}"> ${q.res_path } </a></td>
						<td style="color: black"> ${q.res_date }</td>
					</tr>	
				</c:forEach>
		</tbody>
	</table>
</center>
<br><br><br>

<center>
	<f:form action="saveResume.htm" modelAttribute="newResume" method="POST" enctype="multipart/form-data">
		<label> Resume Name: </label> <f:input path="res_name"/> <br>
		<label> Select file: </label> <input type="file" name="file" class="btn btn-block btn-lg btn-color-scheme text-uppercase fs-12 fw-600"/>
		<br><br>
		
		<input type="submit" value="Add Resume">
	</f:form>
	<br><br><br>
	<a href="homePage.htm"> Go back to home page. </a>
	
</center>
</body>
</html>