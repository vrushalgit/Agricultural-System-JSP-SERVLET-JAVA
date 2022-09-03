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
<!-- Template CSS -->
</head>

<body>
	<!--header-->
	<header id="site-header" class="fixed-top">
		<div class="container">
			<jsp:include page="design-side-header.jsp"></jsp:include>
		</div>
		<!-- //toggle switch for light and dark theme -->
	</header>
	<!-- //header -->
	<!-- about breadcrumb -->
	<section class="w3l-about-breadcrumb text-left">
		<div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
			<div class="container">
				<h2 class="title">View Crops</h2>
				<ul class="breadcrumbs-custom-path mt-2">
					<li><a href="./index.jsp">Home</a></li>
					<li class="active"><span class="fa fa-arrow-right mx-2"
						aria-hidden="true"></span>All Crops</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- //about breadcrumb -->
	<!-- /contact-->
	<div class="contact-form py-5" id="contact">
		<div class="container py-lg-5 py-md-4">
			<div class="contacts12-main mb-5">
				<form action="view-crops.jsp" method="post">
					<div class="form-row">
						<div class="form-group col-md-10">
							<input type='text' class="form-control" id="crop" name="crop"
								placeholder="Crop Name">
						</div>
						<div class="form-group col-md-2">
							<input type="submit" class="btn btn-primary" value="Search Crops">
						</div>
					</div>
				</form>
				<br>
				<%
				String cropName = request.getParameter("crop");
				if (cropName != null) {
					ResultSet resultCrop = DatabaseConnection
					.getResultFromSqlQuery("select * from tblcrops where crop_name like '%" + cropName + "%' ");
					if (resultCrop.next()) {
				%>
				<div class="form-row">
					<div class="form-group col-md-2">
						<image src="uploads/<%=resultCrop.getString("crop_image_name")%>"
							style="width:130px;height:100px;"></image>
					</div>
					<div class="form-group col-md-10">
						<p>
						<h3><%=resultCrop.getString("crop_name")%></h3>
						</p>
						<p>
							<label style='color: #33b5e5;'><%=resultCrop.getString("month")%></label>
						</p>
						<p><%=resultCrop.getString("description")%></p>
					</div>
				</div>
				<hr>
				<%
				}
				} else {
				ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcrops");
				while (resultset.next()) {
				%>
				<div class="form-row">
					<div class="form-group col-md-2">
						<image src="uploads/<%=resultset.getString("crop_image_name")%>"
							style="width:130px;height:100px;"></image>
					</div>
					<div class="form-group col-md-10">
						<p>
						<h3><%=resultset.getString("crop_name")%></h3>
						</p>
						<p>
							<label style='color: #33b5e5;'><%=resultset.getString("month")%></label>
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
	<jsp:include page="./footer.jsp"></jsp:include>
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

</body>

</html>