<%@page import="com.jt.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

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
<link rel="stylesheet" href="resources/css/waves.min.css" type="text/css" media="all">
<link rel="stylesheet" type="text/css" href="resources/css/feather.css">
<link rel="stylesheet" type="text/css" href="resources/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/datatables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/buttons.datatables.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/pages.css">
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome-n.min.css">
<link rel="stylesheet" href="resources/css/chartist.css" type="text/css" media="all">
<link rel="stylesheet" type="text/css" href="resources/css/widget.css">

</head>
<%
	request.setAttribute("curr_user",(User) session.getAttribute("loggedInUser"));
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
										<span>${curr_user.fname } ${curr_user.lname}</span>
										<i class="feather icon-chevron-down"></i>
									</div>
									<ul class="show-notification profile-notification dropdown-menu" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
										<li>
											<a href="#">
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
									<li class="">
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
									<li class="active pcoded-trigger">
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
										<i class="feather icon-upload-cloud bg-c-blue"></i>
										<div class="d-inline">
											<h5>Manage Resume</h5>
											<span>Upload Latest Resume to Keep Your File Up to Date</span>
										</div>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="page-header-breadcrumb">
										<ul class=" breadcrumb breadcrumb-title">
											<li class="breadcrumb-item">
												<a href="homePage.htm"><i class="feather icon-home"></i></a>
											</li>
											<li class="breadcrumb-item">
												<a href="manageResume.htm">Manage Resume</a>
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
										<div class="card">
											<div class="card-header">
												<h5>Applications</h5>
											</div>
											<div class="card-block">
												<div class="table-responsive dt-responsive">
													<table class="table table-striped table-bordered nowrap">
													<thead>
														<tr>
															<th>Resume Name</th>
															<th>File</th>
															<th>Uploaded Date</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${resumes}" var="q">
														<tr>
															<td>${q.res_name }</td>
															<td><a href="${q.res_url}"> ${q.res_path } </a></td>
															<td>${q.res_date }</td>
														</tr>
														</c:forEach>
													</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="card">
										<div class="card-header">
											<h5>Upload New Resume</h5>
										</div>
										<div class="card-block">
											<f:form action="saveResume.htm" modelAttribute="newResume" method="POST" enctype="multipart/form-data">
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Resume Name</label>
													<div class="col-sm-10">
														<f:input path="res_name" class="form-control form-control-round" />
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-2 col-form-label">Upload File</label>
													<div class="col-sm-10">
														<input type="file" name="file" class="form-control form-control-round">
													</div>
												</div>
											<div class="text-center m-t-20">
												<button class="btn btn-primary">Upload Now</button>
											</div>
											</f:form>
										</div>
									</div>
									</div>
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/jquery.min.js"></script>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/jquery-ui.min.js"></script>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/popper.min.js"></script>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/waves.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/jquery.slimscroll.js"></script>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/modernizr.js"></script>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/css-scrollbars.js"></script>
<script src="resources/js/waves.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/jquery.datatables.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/datatables.buttons.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/jszip.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/pdfmake.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/vfs_fonts.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/buttons.print.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/buttons.html5.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/datatables.bootstrap4.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/datatables.responsive.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/responsive.bootstrap4.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/data-table-custom.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/pcoded.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/vertical-layout.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script src="resources/js/jquery.mcustomscrollbar.concat.min.js" type="1dc21dc544476ddffbc54af6-text/javascript"></script>
<script type="1dc21dc544476ddffbc54af6-text/javascript" src="resources/js/script.js"></script>

<script type="1dc21dc544476ddffbc54af6-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
<script src="resources/js/rocket-loader.min.js" data-cf-settings="1dc21dc544476ddffbc54af6-|49" defer=""></script></body>
</html>
