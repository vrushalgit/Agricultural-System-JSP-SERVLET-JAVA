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
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!--header-->
	<header id="site-header" class="fixed-top">
		<div class="container-fluid">
			<jsp:include page="admin-side-header.jsp"></jsp:include>
		</div>
	</header>
	<!-- //header -->
	<!-- about breadcrumb -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line"><strong>DASHBOARD</strong></h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-tree fa-5x"></i>
					<%
						int cropCount= 0;
						ResultSet resultCropCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcrops");
						resultCropCount.next();
						cropCount=resultCropCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=cropCount %></span></font>
					</h3>
					<strong style="font-size: 22px;"><a href="admin-manage-crops.jsp" class="text-dark">Total Crops</a></strong>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-bug fa-5x"></i>
					<%
						int pestisidesCount=0;
						ResultSet resultPesticidesCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblpesticide");
						resultPesticidesCount.next();
						pestisidesCount=resultPesticidesCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=pestisidesCount %></span></font>
					</h3>
					<strong style="font-size: 22px;"><a href="admin-manage-pesticides.jsp" class="text-dark">Total Pestisides</a></strong>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-bug fa-5x"></i>
					<%
						int insectisidesCount=0;
						ResultSet resultInsectisidesCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblinsecticide");
						resultInsectisidesCount.next();
						insectisidesCount=resultInsectisidesCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=insectisidesCount%></span></font>
					</h3>
					<strong style="font-size: 22px;"><a href="admin-manage-insecticides.jsp" class="text-dark">Total Insectisides</a></strong>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-wrench fa-5x"></i>
					<%
						int equipementCount=0;
						ResultSet resultEquipmentsCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblequipements");
						resultEquipmentsCount.next();
						equipementCount=resultEquipmentsCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=equipementCount %></span></font>
					</h3>
					<strong style="font-size: 22px;"><a href="admin-manage-equipments.jsp" class="text-dark">Total Equipments</a></strong>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-users fa-5x"></i>
					<%
						int customerCount=0;
						ResultSet resultCustomerCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcustomer");
						resultCustomerCount.next();
						customerCount=resultCustomerCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=customerCount%></span></font>
					</h3>
					<strong style="font-size: 22px;"><a href="admin-view-customers.jsp" class="text-dark">Total Customers</a></strong>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-address-book fa-5x"></i>
					<%
						int contactCount=0;
						ResultSet resultContactCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcontact");
						resultContactCount.next();
						contactCount=resultContactCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=contactCount %></span></font>
					</h3>
					<strong style="font-size: 22px;"><a href="admin-view-contacts.jsp" class="text-dark">Total Contacts</a></strong>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-users fa-5x"></i>
					<%
						int adminCount=0;
						ResultSet resultAdminCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tbladmin");
						resultAdminCount.next();
						adminCount=resultAdminCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=adminCount%></span></font>
					</h3>
					<strong style="font-size: 22px;"><a
						href="" class="text-dark">Total Admin</a></strong>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 shadow p-3 mb-5">
				<div class="alert alert-default back-widget-set text-center">
					<i class="fa fa-bar-chart fa-5x"></i>
					<%
						int farmersSellingCropsList=0;
						ResultSet resultFarmersSellingCropsCount=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblsellcrops where admin_name='"+session.getAttribute("admin-name")+"'");
						resultFarmersSellingCropsCount.next();
						farmersSellingCropsList=resultFarmersSellingCropsCount.getInt(1);
					%>
					<h3>
						<font color="#FF9933"><span class="counter"><%=farmersSellingCropsList%></span></font>
					</h3>
					<strong style="font-size: 22px;"><a href="admin-view-customer-crops-selling-details.jsp" class="text-dark">View Farmers Selling Crops</a></strong>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
	<jsp:include page="admin-side-footer.jsp"></jsp:include>
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
		response.sendRedirect("admin-login.jsp");
	 }
	%>
</body>
</html>