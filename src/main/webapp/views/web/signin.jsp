<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<section class="account-section bg_img"
		data-background="${URL}assets/images/account/account-bg.jpg">
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="account-area">
					<div class="section-header-3">
						<span class="cate">hello</span>
						<h2 class="title">welcome back</h2>
					</div>
					<form action="${pageContext.request.contextPath}/signin" method="post"
						class="account-form">
						<c:if test="${mess != null}">
							<label class="form-group">${mess}</label>
						</c:if>
						<div class="form-group">
							<label for="email2">Email<span>*</span></label> <input
								type="text" placeholder="Enter Your Email" id="email2"
								value="${email}" name="email" required>
						</div>
						<div class="form-group">
							<label for="pass3">Password<span>*</span></label> <input
								type="password" placeholder="Password" id="pass3"
								value="${password}" name="password" required>
						</div>
						<div class="form-group checkgroup">
							<input type="checkbox" id="bal2" value="on" >
							<label for="bal2">remember password</label> 
							<a
								href="${pageContext.request.contextPath}/forgetpass"
								class="forget-pass">Forget Password</a>
						</div>
						<div class="form-group text-center">
							<input type="submit" value="log in">
						</div>
					</form>
					<div class="option">
						Don't have an account? <a href="${pageContext.request.contextPath}/signup">sign up
							now</a>
					</div>
					<div class="or">
						<span>Or</span>
					</div>
					<ul class="social-icons">
						<li><a
							href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid

							&redirect_uri=http://localhost:8080${pageContext.request.contextPath}/loginwithgoogle
							
							&response_type=code
							
							&client_id=762099077141-pflm03291tjlku0h3t5bqfbrvkb3rsto.apps.googleusercontent.com
							
							&approval_prompt=force">
								<i class="fab fa-google"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Sign-In-Section========== -->


	<script src="${URL}assets/js/jquery-3.3.1.min.js"></script>
	<script src="${URL}assets/js/modernizr-3.6.0.min.js"></script>
	<script src="${URL}assets/js/plugins.js"></script>
	<script src="${URL}assets/js/bootstrap.min.js"></script>
	<script src="${URL}assets/js/isotope.pkgd.min.js"></script>
	<script src="${URL}assets/js/magnific-popup.min.js"></script>
	<script src="${URL}assets/js/owl.carousel.min.js"></script>
	<script src="${URL}assets/js/wow.min.js"></script>
	<script src="${URL}assets/js/countdown.min.js"></script>
	<script src="${URL}assets/js/odometer.min.js"></script>
	<script src="${URL}assets/js/viewport.jquery.js"></script>
	<script src="${URL}assets/js/nice-select.js"></script>
	<script src="${URL}assets/js/main.js"></script>
</body>
</html>