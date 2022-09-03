<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Agricultural Web Portal</title>
<!-- google fonts -->
<link
	href="//fonts.googleapis.com/css2?family=Poppins:wght@300;600;700&display=swap"
	rel="stylesheet">
<!-- google fonts -->
<!-- Template CSS -->
<link rel="stylesheet" href="assets/css/style-starter.css">
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- Template CSS -->
</head>

<body>
	<!--header-->
	<header id="site-header" class="fixed-top">
		<div class="container">
			<jsp:include page="design-side-header.jsp"></jsp:include>
		</div>
	</header>
	<!-- //header -->
	<!-- about breadcrumb -->
	<section class="w3l-about-breadcrumb text-left">
		<div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
			<div class="container">
				<h2 class="title">Admin Login</h2>
				<ul class="breadcrumbs-custom-path mt-2">
					<li><a href="#url">Admin</a></li>
					<li class="active"><span class="fa fa-arrow-right mx-2"
						aria-hidden="true"></span>Admin Login</li>
				</ul>
			</div>
		</div>
	</section>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="assets/images/admin-login.png"
					style="width: 450px; height: 400px;"></img>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-warning shadow p-3 mb-5">
					<div class="panel-heading">Admin Login</div>
					<div class="panel-body">
						<%
							String credential = (String) session.getAttribute("credential");
							if (credential != null) {
								session.removeAttribute("credential");
						%>
						<div class="alert alert-danger" id="danger">You have enter
							wrong credentials.</div>
						<%
							}
						%>
						<%
							String captchaCode = (String) session.getAttribute("verificationCode");
							if (captchaCode != null) {
								session.removeAttribute("verificationCode");
						%>
						<div class="alert alert-info" id="info">You have enter wrong
							verification code.</div>
						<%
							}
						%>
						<form action="AdminLogin" method="post">
							<div class="form-group">
								<label for="uname">Username:</label> <input type="text"
									class="form-control" id="uname" placeholder="Enter username"
									name="uname" required onkeypress="return lettersValidate(event)">
							</div>
							<div class="form-group">
								<label for="upass">Password:</label> <input type="password"
									class="form-control" id="upass" placeholder="Enter password"
									name="upass" required oninput="limitChar(this)" maxlength="12">
							</div>
							<%
								String captcha = null;
								Connection connection = DatabaseConnection.getConnection();
								Statement statement = connection.createStatement();
								ResultSet resultset = statement.executeQuery("select captcha from tblcaptcha");
								if (resultset.next()) {
									captcha = resultset.getString(1);
								}
							%>
							<div class="form-group">
								<label for="vercode">Verification Code:</label> <input
									type="text" class="form-control" id="vercode"
									placeholder="Enter captcha code here" name="vercode" required>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="" name="captcha"
									value="<%=captcha%>" readonly>
							</div>
							<input type="submit" value="Login" class="btn btn-primary">
							<input type="reset" class="btn btn-danger" value="Cancel">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!--/w3l-footer-29-main-->
	<section class="w3l-footer-29-main">
		<div class="footer-29 py-5">
			<div class="container py-lg-4">
				<div class="row footer-top-29">
					<div class="footer-list-29 col-lg-4">
						<h6 class="footer-title-29">About Us</h6>
						<p class="pr-lg-5">The Agricultural web portal to override the
							problems prevailing in the practicing manual system. This
							software is supported to eliminate and in some cases reduce the
							hardships faced by this existing system.</p>
						<div class="main-social-footer-29 mt-4">
							<a href="#facebook" class="facebook"><span
								class="fa fa-facebook"></span></a> <a href="#twitter"
								class="twitter"><span class="fa fa-twitter"></span></a> <a
								href="#instagram" class="instagram"><span
								class="fa fa-instagram"></span></a> <a href="#linkedin"
								class="linkedin"><span class="fa fa-linkedin"></span></a>
						</div>
					</div>
					<div
						class="col-lg-4 col-md-6 col-sm-4 footer-list-29 footer-2 mt-lg-0 mt-5">
						<ul>
							<h6 class="footer-title-29">Useful Links</h6>
							<li><a href="">Crops</a></li>
							<li><a href="">Insecticides</a></li>
							<li><a href="">Pesticides</a></li>
							<li><a href="">Equipments</a></li>
							<li><a href="">About us</a></li>
						</ul>
					</div>
					<div
						class="col-lg-4 col-md-6 col-sm-8 footer-list-29 footer-1 mt-lg-0 mt-5">
						<h6 class="footer-title-29">Contact Us</h6>
						<ul>
							<li>
								<p>
									<span class="fa fa-map-marker"></span> Maharashtra, India
								</p>
							</li>
							<li><a href=""><span class="fa fa-phone"></span>
									+(91)-0000000000</a></li>
							<li><a href="" class="mail"><span
									class="fa fa-envelope-open-o"></span> agricultureinfo@mail.com</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</section>
	<section class="w3l-footer-29-main w3l-copyright">
		<div class="container">
			<div class="bottom-copies">
				<p class="copy-footer-29 text-center">© 2022 Agricultural
					System. All rights reserved.</p>
			</div>
		</div>

		<!-- move top -->
		<button onclick="topFunction()" id="movetop" title="Go to top">
			<span class="fa fa-angle-up"></span>
		</button>
		<script>
			// When the user scrolls down 20px from the top of the document, show the button
			window.onscroll = function() {
				scrollFunction()
			};

			function scrollFunction() {
				if (document.body.scrollTop > 20
						|| document.documentElement.scrollTop > 20) {
					document.getElementById("movetop").style.display = "block";
				} else {
					document.getElementById("movetop").style.display = "none";
				}
			}

			// When the user clicks on the button, scroll to the top of the document
			function topFunction() {
				document.body.scrollTop = 0;
				document.documentElement.scrollTop = 0;
			}
		</script>
		<!-- /move top -->
	</section>
	<!-- //footer-29 block -->
	<!-- disable body scroll which navbar is in active -->
	<script>
		$(function() {
			$('.navbar-toggler').click(function() {
				$('body').toggleClass('noscroll');
			})
		});
	</script>
	<!-- disable body scroll which navbar is in active -->

	<!-- Template JavaScript -->
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/theme-change.js"></script>
	<!--/MENU-JS-->
	<script>
		$(window).on("scroll", function() {
			var scroll = $(window).scrollTop();

			if (scroll >= 80) {
				$("#site-header").addClass("nav-fixed");
			} else {
				$("#site-header").removeClass("nav-fixed");
			}
		});

		//Main navigation Active Class Add Remove
		$(".navbar-toggler").on("click", function() {
			$("header").toggleClass("active");
		});
		$(document).on("ready", function() {
			if ($(window).width() > 991) {
				$("header").removeClass("active");
			}
			$(window).on("resize", function() {
				if ($(window).width() > 991) {
					$("header").removeClass("active");
				}
			});
		});
	</script>
	<!--//MENU-JS-->
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	          return false;
	    	}
	         
	 }
	</script>
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>