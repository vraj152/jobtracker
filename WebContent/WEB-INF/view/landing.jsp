<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jt.entity.Application"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="a" uri="http://java.sun.com/jstl/core_rt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<head>
<title>Admindek | Admin Template</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link rel="icon" href="https://colorlib.com/polygon/admindek/files/assets/images/favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/waves.min.css" media="all">
<link rel="stylesheet" type="text/css" href="resources/css/feather.css">
<link rel="stylesheet" type="text/css" href="resources/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="resources/css/icofont.css">
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/datatables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/buttons.datatables.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/responsive.datatables.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/pages.css">
<link rel="stylesheet" type="text/css" href="resources/css/widget.css">
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome-n.min.css">

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
	
	Calendar now = Calendar.getInstance();
	
	request.setAttribute("day", now.get(Calendar.DAY_OF_MONTH));
	request.setAttribute("month", new SimpleDateFormat("MMMMM").format(now.getTime()));
	request.setAttribute("year", now.get(Calendar.YEAR));
%>

<body>
<div class="loader-bg">
	<div class="loader-bar"></div>
</div>

<div id="pcoded" class="pcoded">
	<div class="pcoded-overlay-box"></div>
	<div class="pcoded-container navbar-wrapper">
		<nav class="navbar header-navbar pcoded-header">
			<div class="navbar-wrapper">
				<div class="navbar-logo">
					<a href="index.html">
						<img class="img-fluid" src="resources/png/logo.png" alt="Theme-Logo" />
					</a>
					<a class="mobile-menu" id="mobile-collapse" href="#!">
						<i class="feather icon-menu icon-toggle-right"></i>
					</a>
					<a class="mobile-options waves-effect waves-light">
						<i class="feather icon-more-horizontal"></i>
					</a>
				</div>
				<div class="navbar-container container-fluid">
					<ul class="nav-right">
						<li class="user-profile header-notification">
							<div class="dropdown-primary dropdown">
								<div class="dropdown-toggle" data-toggle="dropdown">
									<img src="resources/jpg/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
									<span>${userDetails.fname } ${userDetails.lname }</span>
									<i class="feather icon-chevron-down"></i>
								</div>
								<ul class="show-notification profile-notification dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
									<li>
										<a href="personalDetail.htm">
											<i class="feather icon-user"></i> Profile
										</a>
									</li>
									<li>
										<a href="logout.htm">
											<i class="feather icon-log-out"></i> Logout
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="pcoded-main-container">
			<div class="pcoded-wrapper">
				<nav class="pcoded-navbar">
					<div class="nav-list">
						<div class="pcoded-inner-navbar main-menu">
							<div class="pcoded-navigation-label">Navigation</div>
							<ul class="pcoded-item pcoded-left-item">
								<li class="active pcoded-trigger">
									<a href="homePage.htm" class="waves-effect waves-dark">
										<span class="pcoded-micon"><i class="feather icon-home"></i></span>
										<span class="pcoded-mtext">Dashboard</span>
									</a>
								</li>
							</ul>
							<ul class="pcoded-item pcoded-left-item">
								<li class="">
									<a href="add_pos.htm" class="waves-effect waves-dark">
										<span class="pcoded-micon">
											<i class="feather icon-edit"></i>
										</span>
										<span class="pcoded-mtext">Add New Position</span>
									</a>
								</li>
							</ul>
							<ul class="pcoded-item pcoded-left-item">
								<li class="">
									<a href="manageResume.htm" class="waves-effect waves-dark">
										<span class="pcoded-micon">
											<i class="feather icon-upload-cloud"></i>
										</span>
										<span class="pcoded-mtext">Manage Resume</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
				<div class="pcoded-content">
					<div class="page-header card">
						<div class="row align-items-end">
							<div class="col-lg-8">
								<div class="page-header-title">
									<i class="feather icon-inbox bg-c-blue"></i>
									<div class="d-inline">
										<h5>Dashboard</h5>
										<span>Access All Information At One Place!</span>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="page-header-breadcrumb">
									<ul class=" breadcrumb breadcrumb-title">
										<li class="breadcrumb-item">
											<a href="homePage.htm"><i class="feather icon-home"></i></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="pcoded-inner-content">
						<div class="main-body">
							<div class="page-wrapper">
								<div class="page-body">
									<div class="row">
										<div class="col-md-12 col-xl-4">
											<div class="card comp-card">
												<div class="card-body">
													<div class="row align-items-center">
														<div class="col">
															<h6 class="m-b-25">Number of Applications</h6>
															<h3 class="f-w-700 text-c-green">${appres.size()}</h3>
															<p class="m-b-0">${month } ${day } (${year })</p>
														</div>
														<div class="col-auto">
															<i class="fas fa-bullseye bg-c-green"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-header">
											<h5>Configuration Option</h5>
										</div>
										<div class="card-block">
											<table id="res-config" class="table display">
												<thead>
													<tr>
														<th>Company name</th>
														<th>Status</th>
														<th>Date Applied</th>
														<th>Requisition ID</th>
														<th>Action</th>
														<th>Position</th>
														<th>Location</th>
														<th>Resume</th>
													</tr>
												</thead>
												<tbody>
													<a:forEach items="${appres}" var="q">
													<tr>
														<td> <a href="${q.job.url}">${q.job.company } </a> </td>
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
														<td> ${q.date }</td>
														<td> ${q.job.requisition_id }</td>
														<td><a href="deleteApp.htm?var=${q.appid}"> Delete </a></td>
														<td> ${q.job.position }</td>
														<td> ${q.job.location }</td>
														<td> <a href="${q.resume.res_url }"> ${q.resume.res_name } </a></td>
													</tr>
													</a:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="styleSelector"></div>
			</div>
		</div>
	</div>
</div>


<script data-cfasync="false" src="resources/js/email-decode.min.js"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/jquery.min.js"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/jquery-ui.min.js"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/popper.min.js"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/waves.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/jquery.slimscroll.js"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/modernizr.js"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/css-scrollbars.js"></script>
<script src="resources/js/jquery.datatables.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/datatables.buttons.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/jszip.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/pdfmake.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/vfs_fonts.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/datatables.responsive.min-2.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/buttons.print.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/buttons.html5.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/datatables.bootstrap4.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/datatables.responsive.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/responsive.bootstrap4.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/responsive-custom.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/pcoded.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/vertical-layout.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script src="resources/js/jquery.mcustomscrollbar.concat.min.js" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript" src="resources/js/script.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="dd968ecfaf2317dc95cd417c-text/javascript"></script>
<script type="dd968ecfaf2317dc95cd417c-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
<script src="resources/js/rocket-loader.min.js" data-cf-settings="dd968ecfaf2317dc95cd417c-|49" defer=""></script></body>
</html>
