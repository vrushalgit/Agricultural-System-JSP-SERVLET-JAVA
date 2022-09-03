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
			<jsp:include page="customer-side-header.jsp"></jsp:include>
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
					<strong>Profile</strong>
				</h4>
			</div>
		</div>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">View Profile</div>
			<div class="panel-body">
				<%
					String message = (String) session.getAttribute("profile-update");
					if (message != null) {
						session.removeAttribute("profile-update");
				%>
				<div class="alert alert-success" id="success">Profile updated successfully.</div>
				<%
					}
				%>
				<%
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where uname='"+ session.getAttribute("uname") + "' and email_id='" + session.getAttribute("email") + "'");
					if (resultset.next()) {
				%>
				<form action="CustomerEditProfile" method="post">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="customerId">Customer Id:</label> <input type="text"
								class="form-control" id="customerId" placeholder="Customer Id"
								name="customerId" value="<%=resultset.getInt("id")%>" readonly>
						</div>
						<div class="form-group col-md-6"">
							<label for="cname">Full Name:</label> <input type="text"
								class="form-control" id="cname" placeholder="Full Name"
								name="cname" value="<%=resultset.getString("full_name") %>" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="email">Email Id:</label> <input type="text"
								class="form-control" id="email" placeholder="Email Id"
								name="email" value="<%=resultset.getString("email_id") %>" readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="mobile">Mobile No:</label> <input type="text"
								class="form-control" id="mobile" placeholder="Mobile No"
								name="mobile" value="<%=resultset.getString("mobile_no") %>" required>
						</div>
					</div>
					<div class="form-group">
						<label for="gender">Select Gender:</label> <select
							class="form-control" id="gender" name="gender" value="<%=resultset.getString("gender") %>">
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="city">City:</label> <input type="text"
								class="form-control" id="city" placeholder="Enter City"
								name="city" value="<%=resultset.getString("city") %>" required>
						</div>
						<div class="form-group col-md-6">
							<label for="state">State:</label> <input type="text"
								class="form-control" id="state" placeholder="Enter State"
								name="state" value="<%=resultset.getString("state") %>" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="country">Country:</label> <input type="text"
								class="form-control" id="country" placeholder="Enter Country"
								name="country" value="<%=resultset.getString("country") %>" required>
						</div>
						<div class="form-group col-md-6">
							<label for="pincode">Pincode:</label> <input type="text"
								class="form-control" id="pincode" placeholder="Enter Pincode"
								name="pincode" value="<%=resultset.getString("pincode") %>" required>
						</div>
					</div>
					<input type="submit" value="Edit Info" class="btn btn-primary">
					<input type="reset" class="btn btn-danger" value="Cancel">
				</form>
				<%
					}
				%>
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
	<%
		} else {
		response.sendRedirect("customer-login.jsp");
	 }
	%>
</body>
</html>