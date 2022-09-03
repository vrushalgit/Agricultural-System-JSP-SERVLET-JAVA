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
				<h4 class="header-line">
					<strong>View Customer Crop Details</strong>
				</h4>
			</div>
		</div>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">View Customer Crop Details</div>
			<div class="panel-body">
				<%
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblsellcrops where sell_id='"+ request.getParameter("sellId") + "' and admin_name='" + session.getAttribute("admin-name") + "'");
					if (resultset.next()) {
				%>
				<form action="AdminActionOnCustomerCrops" method="post">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="sellId">Sell Id:</label> <input type="text"
								class="form-control" id="sellId" name="sellId"
								value="<%=resultset.getInt("sell_id")%>" readonly>
						</div>
						<div class="form-group col-md-6"">
							<label for="cname">Full Name:</label> <input type="text"
								class="form-control" id="cname" name="cname"
								value="<%=resultset.getString("customer_name")%>" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="email">Email Id:</label> <input type="text"
								class="form-control" id="email" placeholder="Email Id"
								name="email" value="<%=resultset.getString("email_id")%>"
								readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="mobile">Mobile No:</label> <input type="text"
								class="form-control" id="mobile" placeholder="Mobile No"
								name="mobile" value="<%=resultset.getString("mobile_no")%>"
								required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="address">Address:</label>
							<textarea class="form-control" id="address" name="address"><%=resultset.getString("address")%></textarea>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="cropName">Crop Name:</label> <input type="text"
								class="form-control" id="cropName" name="cropName"
								value="<%=resultset.getString("crop_name")%>" required>
						</div>
						<div class="form-group col-md-6">
							<label for="quantity">Crop Quantity:</label> <input type="text"
								class="form-control" id="quantity" name="quantity"
								value="<%=resultset.getString("crop_quantity")%>" required>
						</div>

					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="cropDescription">Crop Description:</label>
							<textarea class="form-control" id="cropDescription"
								name="cropDescription"><%=resultset.getString("crop_description")%></textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="buyerName">Buyer Name:</label> <input type="text"
								class="form-control" id="buyerName" name="buyerName"
								value="<%=resultset.getString("admin_name")%>" readonly>

						</div>
						<div class="form-group col-md-6">
							<label for="cropDescription">Action:</label> <select
								class="form-control" id="status" name="status">
								<option>Accept Crop</option>
								<option>Reject Crop</option>
							</select>
						</div>
					</div>
					<input type="submit" value="Take Action" class="btn btn-primary">
					<%
						}
					%>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="customer-side-footer.jsp"></jsp:include>
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