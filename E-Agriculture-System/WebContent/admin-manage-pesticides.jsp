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
	<div class="container-fluid">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">
					<strong>Manage Pesticides</strong>
				</h4>
			</div>
		</div>
		<div class="panel panel-warning shadow p-3 mb-5">
			<div class="panel-heading"
				style="font-size: small; font-weight: bold;">
				View Crops &nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<%=(new java.util.Date()).toLocaleString()%>&nbsp;]&nbsp;&nbsp;
				<a href="admin-add-pesticides.jsp" class="btn btn-sm btn-info text-white pull-right"><i
						class="fa fa-plus right"></i> Add Pesticides</a>
			</div>
			<div class="panel-body">
				<%
					String success = (String) session.getAttribute("message");
					if (success != null) {
						session.removeAttribute("message");
				%>
				<div class="alert alert-success" id="success">Pesticide added
					successfully.</div>
				<%
					}
				%>
				<%
					String pesticideEdit = (String) session.getAttribute("pesticide-edit");
					if (pesticideEdit != null) {
						session.removeAttribute("pesticide-edit");
				%>
				<div class="alert alert-info" id="info">Pesticide edited
					successfully.</div>
				<%
					}
				%>
				<%
					String pesticideDelete = (String) session.getAttribute("pesticide-delete");
					if (pesticideDelete != null) {
						session.removeAttribute("pesticide-delete");
				%>
				<div class="alert alert-danger" id="danger">Pesticide deleted
					successfully.</div>
				<%
					}
				%>
				<table id="table" class="table table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Pesticide Name</th>
							<th>Pesticide Cost Range</th>
							<th>Description</th>
							<th>Pesticide Image</th>
							<th>Created At</th>
							<th>Updated At</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblpesticide");
							while (resultset.next()) {
						%>
						<form action="" method="post">
							<tr>
								<td><%=resultset.getInt("id")%></td>
								<td><%=resultset.getString("pesticide_name")%></td>
								<td><label style='color: #33b5e5;'><%=resultset.getString("pesticide_cost_range")%></label></td>
								<td><%=resultset.getString("description")%></td>
								<td><image src="uploads/<%=resultset.getString("pesticide_image_name")%>"
										style="width:130px;height:100px;"></image></td>
								<td><%=resultset.getString("created_at")%></td>
								<td><%=resultset.getString("updated_at")%></td>
								<td><a href="admin-edit-pesticides.jsp?id=<%=resultset.getInt("id")%>" class="btn btn-primary"><i
										class="glyphicon glyphicon-edit"></i></a>&nbsp;<br><a href="AdminDeletePesticides?id=<%=resultset.getInt("id")%>" class="btn btn-danger"><i
										class="glyphicon glyphicon-trash"></i></a></td>
							</tr>
						</form>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
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
		response.sendRedirect("admin-login.jsp");
	 }
	%>
</body>

</html>