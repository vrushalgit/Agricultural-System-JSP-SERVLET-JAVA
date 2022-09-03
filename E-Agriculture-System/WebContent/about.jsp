<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	</header>
	<!-- //header -->
	<!-- about breadcrumb -->
	<section class="w3l-about-breadcrumb text-left">
		<div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
			<div class="container py-2">
				<h2 class="title">About Us</h2>
				<ul class="breadcrumbs-custom-path mt-2">
					<li><a href="./index.html">Home</a></li>
					<li class="active"><span class="fa fa-arrow-right mx-2"
						aria-hidden="true"></span> About</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- //about breadcrumb -->
	<!-- /about-6-->
	<section class="w3l-cta4 py-5">
		<div class="container py-lg-5">
			<div class="ab-section">
				<h6 class="sub-title">About Us</h6>
				<h3 class="hny-title">Agricultural System</h3>
				<p class="py-3">The Agricultural web portal to override the
					problems prevailing in the practicing manual system. This software
					is supported to eliminate and in some cases reduce the hardships
					faced by this existing system. Moreover this system is designed for
					the particular need of the company to carry out operations in a
					smooth and effective manner.</p>
				<p class="py-3">The application is reduced as much as possible
					to avoid errors while entering the data. It also provides error
					message while entering invalid data. No formal knowledge is needed
					for the user to use this system. Thus by this all it proves it is
					user-friendly. Agricultural web portal, as described above, can
					lead to error free, secure, reliable and fast management system. It
					can assist the user to concentrate on their other activities rather
					to concentrate on the record keeping. Thus it will help
					organization in better utilization of resources.</p>
			</div>
			<div class="row mt-5">
				<div class="col-md-12 mt-md-0 mt-4">
					<img src="assets/images/banner1.jpg" class="img-fluid" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- //about-6-->
	<!-- /content-6-->
	<!-- //content-6-->
	<!-- stats -->
	<section class="w3l-statshny py-5" id="stats">
		<div class="container py-lg-5 py-md-4">
			<div class="w3-stats-inner-info">
				<div class="row">
					<div class="col-lg-4 col-6 stats_info counter_grid text-left">
						<span class="fa fa-smile-o"></span>
						<p class="counter">1730</p>
						<h4>Happy Customers</h4>
					</div>
					<div class="col-lg-4 col-6 stats_info counter_grid1 text-left">
						<span class="fa fa-users"></span>
						<p class="counter">730</p>
						<h4>Custom Products</h4>
					</div>
					<div
						class="col-lg-4 col-6 stats_info counter_grid mt-lg-0 mt-5 text-left">
						<span class="fa fa-database"></span>
						<p class="counter">30</p>
						<h4>Branches</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //stats -->
	<!-- team -->

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
					<div class="col-lg-4 col-md-6 col-sm-4 footer-list-29 footer-2 mt-lg-0 mt-5">
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
	<!-- stats number counter-->
	<script src="assets/js/jquery.waypoints.min.js"></script>
	<script src="assets/js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats number counter -->
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