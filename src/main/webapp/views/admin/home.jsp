<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- main content -->
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Admin Dashboard</h2>

					<button class="sidebar__user-btn" type="button"
						onclick="window.location.href='${pageContext.request.contextPath}/logout'">
						<i class="ti ti-logout"></i>
					</button>
				</div>
			</div>
			<!-- end main title -->
		</div>
	</div>
	<!-- end main content -->
</body>
</html>