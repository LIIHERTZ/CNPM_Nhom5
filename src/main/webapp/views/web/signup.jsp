<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from pixner.net/boleto/demo/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 06:27:35 GMT -->
<head>

</head>

<body>


	<!-- ==========Sign-In-Section========== -->
	<section class="account-section bg_img"
		data-background="assets/images/account/account-bg.jpg">
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="account-area">
					<div class="section-header-3">
						<span class="cate">welcome</span>
						<h2 class="title">to ValCT</h2>
					</div>
					<form action="${pageContext.request.contextPath}/signup" method="post"
						class="account-form">
						<c:if test="${exception != null}">
							<label class="form-group">${exception}</label>
						</c:if>
						<div class="form-group">
							<label for="fullname">Full Name<span>*</span></label> <input
								type="text" placeholder="Enter Your Full Name" id="fullname"
								name="fullname" value="${fullname}" required>
						</div>
						<div class="form-group">
							<label for="email1">Email<span>*</span></label> <input
								type="text" placeholder="Enter Your Email" id="email1"
								name="email" value="${email}" required>
						</div>
						<div class="form-group">
							<label for="pass1">Password<span>*</span></label> <input
								type="password" placeholder="Password" id="pass1"
								name="passsignup" value="${passsignup}" required>
						</div>
						<div class="form-group">
							<label for="pass2">Confirm Password<span>*</span></label> <input
								type="password" placeholder="Re-type Password" id="pass2"
								name="passcheck" value="${passscheck}" required>
						</div>
						<div class="form-group">
							<label for="pass2">Phone<span>*</span></label> <input
								type="text" placeholder="Your Phone" 
								name="phone" value="${phone}" required>
						</div>
						<div class="form-group">
							<div class="form-check-inline" style="margin-right: 50px;">
								<input class="form-check-input" type="checkbox" value="0"
									name="gender" id="agreeMale"
									onclick="toggleCheckbox('agreeFemale', this)"> <label
									for="agreeMale">Nam</label>
							</div>

							<div class="form-check-inline">
								<input class="form-check-input" type="checkbox" value="1"
									name="gender" id="agreeFemale"
									onclick="toggleCheckbox('agreeMale', this)"> <label
									for="agreeFemale">Nữ</label>
							</div>
						</div>
						<script>
							function toggleCheckbox(otherId, checkbox) {
								const otherCheckbox = document
										.getElementById(otherId);
								otherCheckbox.checked = !checkbox.checked;
							}
						</script>
						<div class="form-group">
							<label>Region<span>*</span></label> <input type="text"
								placeholder="Your Province" name="region" list="exampleList"
								value="${region}">
							<datalist id="exampleList">
								<c:forEach var="city" items="${listcity}">
									<option value="${city}">
								</c:forEach>
							</datalist>
						</div>
						<div class="form-group">
							<label>BirthDay<span>*</span></label> <input type="date"
								name="dob" value="${dob}">
						</div>
						<br>
						<div class="form-group text-center">
							<input type="submit" value="Verification">
						</div>
					</form>
					<div class="option">
						Already have an account? <a href="${pageContext.request.contextPath}/signin">Login</a>
					</div>
					<div class="or">
						<span>Or</span>
					</div>
					<ul class="social-icons">
						<li><a href="#0"> <i class="fab fa-google"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Sign-In-Section========== -->
</body>


<!-- Mirrored from pixner.net/boleto/demo/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 06:27:35 GMT -->
</html>

