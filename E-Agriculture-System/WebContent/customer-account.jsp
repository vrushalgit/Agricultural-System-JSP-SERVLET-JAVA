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
				<h2 class="title">Customer Account</h2>
				<ul class="breadcrumbs-custom-path mt-2">
					<li><a href="#url">Customer</a></li>
					<li class="active"><span class="fa fa-arrow-right mx-2"
						aria-hidden="true"></span>Create Account</li>
				</ul>
			</div>
		</div>
	</section>
	<br>
	<br>
	<div class="container">
		<div class="panel panel-info shadow p-3 mb-5">
			<div class="panel-heading">Create Account</div>
			<div class="panel-body">
				<%
					String message = (String) session.getAttribute("success");
				if (message != null) {
					session.removeAttribute("success");
				%>
				<div class="alert alert-success" id="success">Account created
					successfully.</div>
				<%
					}
				%>
				<form action="CustomerAccount" method="post" name="customerForm"
					id="form" role="form">
					<div class="form-row">
						<%
							int customerId = DatabaseConnection.generateCustomerId();
						%>
						<div class="form-group col-md-6">
							<label for="customerId">Customer Id:</label> <input type="text"
								class="form-control" id="customerId" placeholder="Customer Id"
								name="customerId" value="<%=customerId%>" readonly>
						</div>
						<div class="form-group col-md-6"">
							<label for="cname">Full Name:</label> <input type="text"
								class="form-control" id="cname" placeholder="Full Name"
								name="cname" required onkeypress="return lettersValidate(event)">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="email">Email Id:</label> <input type="email"
								class="form-control" id="email" placeholder="Email Id"
								name="email" required
								title="Email can not be blank and should contain @ character.">
						</div>
						<div class="form-group col-md-6">
							<label for="mobile">Mobile No:</label> <input type="text"
								class="form-control" id="mobile" placeholder="Mobile No"
								name="mobile" required onkeypress="return numberValidate(event)"
								maxlength="10">
						</div>
					</div>
					<div class="form-group">
						<label for="gender">Select Gender:</label> <select
							class="form-control" id="gender" name="gender">
							<option>Male</option>
							<option>Female</option>
						</select>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="city">City:</label> <input type="text"
								class="form-control" id="city" placeholder="Enter City"
								name="city" required>
						</div>
						<div class="form-group col-md-6">
							<label for="state">State:</label> <input type="text"
								class="form-control" id="state" placeholder="Enter State"
								name="state" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="country">Country:</label> <input type="text"
								class="form-control" id="country" placeholder="Enter Country"
								name="country" required>
						</div>
						<div class="form-group col-md-6">
							<label for="pincode">Pincode:</label> <input type="text"
								class="form-control" id="pincode" placeholder="Enter Pincode"
								name="pincode" required oninput="limitNumber(this)"
								maxlength="6">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="uname">Username:</label> <input type="text"
								class="form-control" id="uname" placeholder="Enter username"
								name="uname" required onkeypress="return lettersValidate(event)">
						</div>
						<div class="form-group col-md-6">
							<label for="upass">Password:</label> <input type="password"
								class="form-control" id="upass" placeholder="Enter password"
								name="upass" required oninput="limitChar(this)" maxlength="12">
						</div>
					</div>
					<input type="submit" value="Create Account" class="btn btn-primary"
						id="buttonValidate"> <input type="reset"
						class="btn btn-danger" value="Cancel"> <a
						href="customer-login.jsp">Click here to customer login.</a>
				</form>
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
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
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
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	           return false;
	    	} 
	   		
	    }
	</script>
	<script>
	 $(document).ready(function() {
         $("#buttonValidate").click(function() {
             var cname = $("#cname").val();
             var email = $("#email").val();
             var mobile = $("#mobile").val();
             var gender = $("#gender").val();
             var city = $("#city").val();
             var state = $("#state").val();
             var country = $("#country").val();
             var pincode = $("#pincode").val();
             var uname = $("#uname").val();
             var upass = $("#upass").val();
             if (cname === "" || email === "" || mobile === "" || gender === "" || city === "" || state === "" || country === "" || pincode === "" || uname === "" || upass === "")
             {
                 $("#cname").css("border-color", "red");
                 $("#email").css("border-color", "red");
                 $("#mobile").css("border-color", "red");
                 $("#gender").css("border-color", "red");
                 $("#city").css("border-color", "red");
                 $("#state").css("border-color", "red");
                 $("#country").css("border-color", "red");
                 $("#pincode").css("border-color", "red");
                 $("#uname").css("border-color", "red");
                 $("#upass").css("border-color", "red");
                 alert("All fields are mendatory.");
                 return false;
             }
         });
     });                                              
	</script>
	<script>
		$(document).ready(function() { 
		    $('#buttonValidate').click(function() {  
		 
		        $(".error").hide();
		        var hasError = false;
		        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		 
		        var emailaddressVal = $("#email").val();
		        if(emailaddressVal == '') {
		            $("#email").after('<span class="error">Please enter your email address.</span>');
		            hasError = true;
		        }
		 
		        else if(!emailReg.test(emailaddressVal)) {
		            $("#email").after('<span class="error">Enter a valid email address.</span>');
		            hasError = true;
		        }
		 
		        if(hasError == true) { return false; }
		 
		    });
		});
	</script>
	<script>
	    $(document).ready(function() {
	        $("#form").submit(function(e) {
	            
	        	 var mobile = $('#mobile').val().length;
		         if (mobile !== 10) {
		             alert("Mobile number should be 10 digit only.");
		             e.preventDefault();
		             return false;
		         }
	             else
	                {}
	        });
	    });
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