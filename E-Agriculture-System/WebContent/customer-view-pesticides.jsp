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
</head>

<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!--header-->
	<header id="site-header" class="fixed-top">
		<div class="container-fluid">
			<jsp:include page="customer-side-header.jsp"></jsp:include>
		</div>
	</header>
	<!-- //header -->
	<!-- about breadcrumb -->
	<!-- <section class="w3l-about-breadcrumb text-left">
		<div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
			<div class="container">
				<h2 class="title">View Pesticides</h2>
				<ul class="breadcrumbs-custom-path mt-2">
					<li><a href="#url">Home</a></li>
					<li class="active"><span class="fa fa-arrow-right mx-2"
						aria-hidden="true"></span>All Pesticides</li>
				</ul>
			</div>
		</div>
	</section> --><br><br>
	<!-- //about breadcrumb -->
	<!-- /contact-->
	<div class="contact-form py-5" id="contact">
		<div class="container py-lg-5 py-md-4">
			<div class="contacts12-main mb-5">
			<h1>View Pesticides</h1>
				<form action="customer-view-pesticides.jsp" method="post">
					<div class="form-row">
						<div class="form-group col-md-10">
							<input type='text' class="form-control" id="pesticides" name="pesticides"
								placeholder="Pesticide Name">
						</div>
						<div class="form-group col-md-2">
							<input type="submit" class="btn btn-primary" value="Search Pesticide">
						</div>
					</div>
				</form>
				<br>
				<%
					String pesticidesName = request.getParameter("pesticides");
					if (pesticidesName != null) {
						ResultSet resultPesticide = DatabaseConnection.getResultFromSqlQuery("select * from tblpesticide where pesticide_name like '%" + pesticidesName + "%' ");
							if (resultPesticide.next()) {
				%>
				<div class="form-row">
					<div class="form-group col-md-2">
						<image src="uploads/<%=resultPesticide.getString("pesticide_image_name")%>"
							style="width:130px;height:100px;"></image>
					</div>
					<div class="form-group col-md-10">
						<p>
						<h3><%=resultPesticide.getString("pesticide_name")%></h3>
						</p>
						<p>
							<label style='color: #33b5e5;'><%=resultPesticide.getString("pesticide_cost_range")%></label>
						</p>
						<p><%=resultPesticide.getString("description")%></p>
					</div>
				</div>
				<hr>
				<%
					}
				} else {
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpesticide");
					while (resultset.next()) {
				%>
				<div class="form-row">
					<div class="form-group col-md-2">
						<image src="uploads/<%=resultset.getString("pesticide_image_name")%>"
							style="width:130px;height:100px;"></image>
					</div>
					<div class="form-group col-md-10">
						<p>
						<h3><%=resultset.getString("pesticide_name")%></h3>
						</p>
						<p>
							<label style='color: #33b5e5;'><%=resultset.getString("pesticide_cost_range")%></label>
						</p>
						<p><%=resultset.getString("description")%></p>
					</div>
				</div>
				<hr>
				<%
					}
				}
				%>
			</div>
		</div>
	</div>

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
	<%
		} else {
		response.sendRedirect("customer-login.jsp");
	 }
	%>
</body>
</html>