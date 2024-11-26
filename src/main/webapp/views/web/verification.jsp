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
		data-background="assets/images/account/account-bg.jpg">
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="account-area">
					<div class="section-header-3">
						<span class="cate">Verify Your Email</span>
					</div>
					<form class="account-form" action="${pageContext.request.contextPath}/verification"
						method="post">
						<c:if test="${mess != null}">
							<label class="form-group">${mess}</label>
						</c:if>
						<div class="form-group">
							<label for="verify">Verify Code<span>*</span></label>
							<div class="Row"
								style="display: flex; align-items: center; gap: 10px;">
								<input type="password" placeholder="Enter Code" id="verify"
									value="${personcode}" name="personcode" required>
								<button type="button" id="resendCode" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/resend';">Resend Code</button>

							</div>
							<br>
							<div class="form-group text-center">
								<input type="submit" value="Submit">
							</div>
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