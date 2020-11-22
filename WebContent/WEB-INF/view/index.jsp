<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Admindek | Admin Template</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="icon" href="https://colorlib.com/polygon/admindek/files/assets/images/favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/waves.min.css" media="all"> 
<link rel="stylesheet" type="text/css" href="resources/css/feather.css">
<link rel="stylesheet" type="text/css" href="resources/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="resources/css/icofont.css">
<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/css/pages.css">

<script type="text/javascript">
	function showAlert(msg){
		alert(msg);
	}
</script>
</head>

<body themebg-pattern="theme6">
	
	<c:if test="${not empty sessionMessage}">
		<script> showAlert("${sessionMessage}") </script>
	</c:if>
	
	<section class="login-block">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<f:form class="md-float-material form-material" action="verifyuser.htm" modelAttribute="credentials" method="POST">
						<div class="text-center">
							<img src="resources/png/logo.png" alt="logo.png">
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center txt-primary">Sign In</h3>
									</div>
								</div>
								<div class="form-group form-primary">
									<f:input path="uname" type="text" name="uname" class="form-control" required="" />
									<span class="form-bar"></span>
									<label class="float-label">Username</label>
								</div>
								<div class="form-group form-primary">
									<f:input path="pwd" type="password" name="pwd" class="form-control" required="" />
									<span class="form-bar"></span>
									<label class="float-label">Password</label>
								</div>
								<div class="row m-t-25 text-left">
									<div class="col-12">
										<div class="forgot-phone text-right float-right">
											<a href="auth-reset-password.html" class="text-right f-w-600"> Forgot Password?</a>
										</div>
									</div>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<input type="submit" value="LOGIN" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20"/>
									</div>
								</div>
								<p class="text-inverse text-left">Don't have an account?<a href="signup.htm"><b>Register here</b></a>for free!</p>
							</div>
						</div>
					</f:form>
				</div>
			</div>
		</div>
	</section>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/jquery-ui.min.js"></script>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/popper.min.js"></script>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/waves.min.js" type="4878d7dfa7bc22a8dfa99416-text/javascript"></script>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/jquery.slimscroll.js"></script>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/modernizr.js"></script>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/css-scrollbars.js"></script>
	<script type="4878d7dfa7bc22a8dfa99416-text/javascript" src="resources/js/common-pages.js"></script>

	<script type="4878d7dfa7bc22a8dfa99416-text/javascript">
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	  gtag('config', 'UA-23581568-13');
	</script>
	<script src="resources/js/rocket-loader.min.js" data-cf-settings="4878d7dfa7bc22a8dfa99416-|49" defer=""></script>
</body>
</html>