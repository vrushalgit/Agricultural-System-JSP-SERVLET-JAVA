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
<script>
	function myFunction() {
		var buyerName = document.getElementById("buyerName").value;
		document.location.href = "customer-sell-crops.jsp?buyerName="+ buyerName;
	}
</script>
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
	<div class="container-fluid">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">
					<strong>Sell Crops</strong>
				</h4>
			</div>
		</div>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">Sell Crops</div>
			<div class="panel-body">
				<%
					String message = (String) session.getAttribute("success");
					if (message != null) {
						session.removeAttribute("success");
				%>
				<div class="alert alert-success" id="success">Crop sell
					successfully.</div>
				<%
					}
				%>
				<%
					int sellId = DatabaseConnection.generateSellId();
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where uname='"+ session.getAttribute("uname") + "' and email_id='" + session.getAttribute("email") + "'");
					if (resultset.next()) {
				%>
				<form action="CustomerSellCrops" method="post">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="customerId">Sell Id:</label> <input type="text"
								class="form-control" id="customerId" placeholder="Customer Id"
								name="customerId" value="<%=sellId%>" readonly>
						</div>
						<div class="form-group col-md-6"">
							<label for="cname">Full Name:</label> <input type="text"
								class="form-control" id="cname" placeholder="Full Name"
								name="cname" value="<%=resultset.getString("full_name")%>"
								required>
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
						<div class="form-group col-md-6">
							<label for="address">Address:</label>
							<textarea class="form-control" id="address" name="address"><%=resultset.getString("city")%>,<%=resultset.getString("state")%>,<%=resultset.getString("country")%>,<%=resultset.getString("pincode")%></textarea>
						</div>
						<div class="form-group col-md-6">
							<label for="buyerName">Buyer Name:</label> <select
								class="form-control" id="buyerName" name="buyerName"
								onchange="myFunction()">
								<option>Select Buyer</option>
								<%
									ResultSet rsbuyer = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin");
									while (rsbuyer.next()) {
								%>
								<option><%=rsbuyer.getString("full_name")%></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					<%
						}
					%>
					<%
						String buyerName = request.getParameter("buyerName");
						ResultSet rsBuyerDetails = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where full_name='" + buyerName + "'");
						while (rsBuyerDetails.next()) {
					%>
					<div class="panel panel-danger shadow p-3 mb-5">
						<div class="panel-heading">Buyer Details</div>
						<div class="panel-body">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="buyerName">Buyer Name:</label> <input type="text"
										class="form-control" id="buyerName" placeholder="Buyer Name"
										name="cropBuyerName" value="<%=rsBuyerDetails.getString("full_name")%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="buyerEmail">Buyer Email Id:</label> <input
										type="text" class="form-control" id="buyerEmail"
										placeholder="Buyer Email Id" name="buyerEmail"
										value="<%=rsBuyerDetails.getString("email_id")%>" readonly>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="buyerMobile">Buyer Mobile No:</label> <input
										type="text" class="form-control" id="buyerMobile"
										placeholder="Buyer Mobile No" name="buyerMobile"
										value="<%=rsBuyerDetails.getString("mobile_no")%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="buyerAddress">Buyer Address:</label>
									<textarea class="form-control" id="buyerAddress"
										placeholder="Buyer Address" name="buyerAddress"><%=rsBuyerDetails.getString("address")%></textarea>
								</div>
							</div>
						</div>
					</div>
					<%
						}
					%>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="cropName">Crop Name:</label> <input type="text"
								class="form-control" id="cropName" placeholder="Crop Name"
								name="cropName" value="" required>
						</div>
						<div class="form-group col-md-6">
							<label for="quantity">Crop Quantity:</label> <input type="text"
								class="form-control" id="quantity"
								placeholder="Enter Crop Quantity" name="quantity" value=""
								required>
						</div>

					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label for="cropDescription">Crop Description:</label>
							<textarea class="form-control" id="cropDescription"
								placeholder="Crop Description" name="cropDescription"></textarea>
						</div>
					</div>
					
					<input type="submit" value="Sell Crop" class="btn btn-primary">
					<input type="reset" class="btn btn-danger" value="Cancel">
				</form>
			</div>
		</div>
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">View Selling Crops</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Full Name</th>
							<th>Email Id</th>
							<th>Mobile No</th>
							<th>Address</th>
							<th>Crop Name</th>
							<th>Description</th>
							<th>Quantity</th>
							<th>Buyer Name</th>
							<th>Status</th>
						</tr>
					</thead>
					<%
						ResultSet resultSellingCrops = DatabaseConnection.getResultFromSqlQuery("select * from tblsellcrops where email_id='" + session.getAttribute("email") + "'");
						while (resultSellingCrops.next()) {
					%>
					<tbody>
						<tr>
							<td><%=resultSellingCrops.getInt("sell_id")%></td>
							<td><%=resultSellingCrops.getString("customer_name")%></td>
							<td><%=resultSellingCrops.getString("email_id")%></td>
							<td><%=resultSellingCrops.getString("mobile_no")%></td>
							<td><%=resultSellingCrops.getString("address")%></td>
							<td><%=resultSellingCrops.getString("crop_name")%></td>
							<td><%=resultSellingCrops.getString("crop_description")%></td>
							<td><%=resultSellingCrops.getString("crop_quantity")%></td>
							<td><%=resultSellingCrops.getString("admin_name")%></td>
							<%
								if (resultSellingCrops.getString("status").equals("Pending")) {
							%>
							<td><span class="label label-danger">Pending</span></td>
							<%
								} else if (resultSellingCrops.getString("status").equals("Accept Crop")) {
							%>
							<td><span class="label label-success">Crop Accepted</span></td>
							<%
								} else {
							%>
							<td><span class="label label-info">Crop Rejected</span></td>
							<%
								}
							%>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
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