<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="account-section bg_img"
		data-background="assets/images/account/account-bg.jpg">
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="account-area">
					<div class="section-header-3">
						<span class="cate">Change Password</span>
						<h2 class="title">ValCT</h2>
					</div>
					<form action="${pageContext.request.contextPath}/changepass" method="post"
						class="account-form">
						<c:if test="${mess != null}">
							<label class="form-group">${mess}</label>
						</c:if>
						<input type="hidden" name="formail" value="${formail}" />
						<div class="form-group">
							<label for="email1">New password<span>*</span></label> <input
								type="password" placeholder="Enter New Password"
								name="passchange" value="${passchange}" id="email1" required>
						</div>
						<div class="form-group">
							<label for="email1">Re-Type Password<span>*</span></label> <input
								type="password" placeholder="Enter ReType Password"
								name="passcheck" value="${passcheck}" id="email1" required>
						</div>
						<br>
						<div class="form-group text-center">
							<input type="submit" value="Comfirm Password">
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