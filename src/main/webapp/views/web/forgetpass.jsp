<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>

<body>

	<section class="account-section bg_img"
		data-background="assets/images/account/account-bg.jpg">
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="account-area">
					<div class="section-header-3">
						<span class="cate">Forget password</span>
						<h2 class="title">ValCT</h2>
					</div>
					<form action="${pageContext.request.contextPath}/forgetpass" method="post"
						class="account-form">
						<c:if test="${exception != null}">
							<label class="form-group">${exception}</label>
						</c:if>
						<div class="form-group">
							<label for="email1">Email<span>*</span></label> <input
								type="text" placeholder="Enter Your Email" id="email1"
								name="formail" value="${formail}" required>
						</div>
						<br>
						<div class="form-group text-center">
							<input type="submit" value="Send Reset Link">
						</div>
					</form>
					<div class="option">
						Already have an account? <a href="${pageContext.request.contextPath}/signin">Login</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>

