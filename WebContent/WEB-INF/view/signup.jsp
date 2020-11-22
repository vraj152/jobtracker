<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<title>Admindek | Admin Template</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="icon" href="https://colorlib.com/polygon/admindek/files/assets/images/favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet"><link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/waves.min.css" type="text/css" media="all"> 
<link rel="stylesheet" type="text/css" href="resources/css/feather.css">
<link rel="stylesheet" type="text/css" href="resources/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="resources/css/icofont.css">
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/pages.css">

</head>

<body themebg-pattern="theme6">

<section class="login-block">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<f:form class="md-float-material form-material" modelAttribute="newuser" action="saveUser.htm" method="POST">
					<div class="text-center">
						<img src="resources/png/logo.png" alt="logo.png">
					</div>
					<div class="auth-box card">
						<div class="card-block">
							<div class="row m-b-20">
								<div class="col-md-12">
									<h3 class="text-center txt-primary">Sign up</h3>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<f:input type="text" path="fname" class="form-control" required=""  />
										<span class="form-bar"></span>
										<label class="float-label">First Name</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<f:input type="text" path="lname" class="form-control" required="" />
										<span class="form-bar"></span>
										<label class="float-label">Last Name</label>
									</div>
								</div>
							</div>
							<div class="form-group form-primary">
								<f:input type="text" path="primary_email" class="form-control" required="" />
									<span class="form-bar"></span>
								<label class="float-label">Your Email Address</label>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<f:input type="text" path="uname" class="form-control" required="" />
										<span class="form-bar"></span>
										<label class="float-label">User Name</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group form-primary">
										<f:input type="password" path="pwd" class="form-control" required="" />
										<span class="form-bar"></span>
										<label class="float-label">Password</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group form-primary">
										<span class="form-bar"></span>
										<label class="float-label">Birth Date</label>
									</div>
								</div>
								<div class="col-sm-9">
									<div class="form-group form-primary">
										<f:input class="form-control" type="date" path="dob"/>
										<span class="form-bar"></span>
									</div>
								</div>
							</div>
							<div class="row m-t-30">
								<div class="col-md-12">
									<button class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Sign up now</button>
								</div>
							</div>					
						</div>
					</div>
				</f:form>
			</div>
		</div>
	</div>
</section>


<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/jquery.min.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/jquery-ui.min.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/popper.min.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/waves.min.js" type="a371f3c3996957007cacd73a-text/javascript"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/jquery.slimscroll.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/modernizr.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/css-scrollbars.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/i18next.min.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/i18nextxhrbackend.min.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/i18nextbrowserlanguagedetector.min.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/jquery-i18next.min.js"></script>
<script type="a371f3c3996957007cacd73a-text/javascript" src="resources/js/common-pages.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="a371f3c3996957007cacd73a-text/javascript"></script>
<script type="a371f3c3996957007cacd73a-text/javascript">
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
<script src="resources/js/rocket-loader.min.js" data-cf-settings="a371f3c3996957007cacd73a-|49" defer=""></script></body>
</html>