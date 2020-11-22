<%@page import="java.util.ArrayList"%>
<%@page import="com.jt.entity.Application"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="a" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	List<String> appStages = new ArrayList<String>();
	appStages.add("Applied");
	appStages.add("Phone Screen");
	appStages.add("Technical Interview");
	appStages.add("Behavioral Interview");
	appStages.add("Offer");
	appStages.add("Reject");

	request.setAttribute("appStages", appStages);
%>
<body>
	<input type="button" value="Logout" style="float:right" onclick="location.href='logout.htm'">
	<center>
		<h3> Your Applications! </h3>
		<table border="1px solid black" cellpadding = "5" cellspacing = "5">
			<thead>
				<tr>
					<th>Company</th>
					<th>Position</th>
					<th>Requisition ID</th>
					<th>Date Applied</th>
					<th>Resume </th>
					<th>Location </th>
					<th>Status</th>
					<th>Action </th>
				</tr>
			</thead>
			
			<tbody>
				<a:forEach items="${appres}" var="q">
					<tr>
						<td style="color: black"> <a href="${q.job.url}">${q.job.company } </a> </td>
						<td style="color: black"> ${q.job.position }</td>
						<td style="color: black"> ${q.job.requisition_id }</td>
						<td style="color: black"> ${q.date }</td>
						<td style="color: black"> <a href="${q.resume.res_url }"> ${q.resume.res_name } </a></td>
						<td style="color: black"> ${q.job.location }</td>
						<td>
							 <form action="changestatus.htm" method="POST">
							 	 <select name="job_stage" onchange="this.form.submit()">
								 	 <a:forEach items="${appStages}" var="stage">
						 	 			<option value="${stage}" ${stage == q.status? 'selected' : ''} > ${stage} </option>
								 	 </a:forEach>
								 </select>
								 <input type="hidden" value="${q.appid}" name="app_id">
							 </form> 
						</td>
						<td>
							<a href="deleteApp.htm?var=${q.appid}"> Delete </a>
						</td>
					</tr>
				</a:forEach>
			</tbody>
		</table>
	</center>
	<br><br>
	<center>
		<a href="add_pos.htm"> Applied anywhere? Let us know! </a><br><br>
		<a href="personalDetail.htm"> Update Personal Details. </a> <br>
		<a href="manageResume.htm"> Manage Resumes </a>
	</center>
	
</body>
</html>