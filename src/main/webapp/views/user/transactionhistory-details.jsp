<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transaction Details</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

</head>

<body>
<style>
/* Toàn bộ body */
body {
	font-family: Arial, sans-serif;
	background-color: #0b112b; /* Nền xanh đen */
	color: #ffffff; /* Màu chữ trắng */
}

/* Container chính */
.container {
	margin-top: 50px;
	background-color: rgba(15, 15, 35, 0.95); /* Nền tối trong suốt */
	padding: 20px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Hiệu ứng đổ bóng */
	border-radius: 10px;
}

/* Tiêu đề */
h1 {
	text-align: center;
	color: #fbc531; /* Màu vàng nhấn */
	margin-bottom: 30px;
	font-size: 30px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8); /* Bóng chữ */
}

/* Bảng hiển thị thông tin */
table {
	margin-top: 20px;
}

table thead {
	background-color: #fbc531; /* Nền vàng */
	color: #0b112b; /* Chữ xanh đen */
}

table tbody tr:nth-child(odd) {
	background-color: rgba(255, 255, 255, 0.1); /* Nền trong suốt nhẹ */
}

table tbody tr:nth-child(even) {
	background-color: rgba(255, 255, 255, 0.2); /* Nền sáng hơn */
}

table tbody tr:hover {
	background-color: rgba(255, 255, 255, 0.3); /* Hiệu ứng hover */
}

th, td {
	text-align: center;
	vertical-align: middle;
	color: #ffffff; /* Chữ trắng */
	padding: 10px;
}

/* Nút Back */
.btn-primary {
	margin-top: 20px;
	background-color: #fbc531; /* Màu vàng */
	border-color: #fbc531;
	color: #0b112b; /* Chữ xanh đen */
}

.btn-primary:hover {
	background-color: #e1a800; /* Vàng đậm hơn khi hover */
	border-color: #e1a800;
}

.text-center p {
	color: #fbc531; /* Màu vàng nhấn */
	font-size: 16px;
}
</style>
	<div class="container">
		<!-- Tiêu đề -->
		  <h2 style="visibility: hidden;">dhsau</h2>
        <h2 style="visibility: hidden;">dhsau</h2>
         <h2 style="visibility: hidden;">dhsau</h2>
        <h1 style="font-size: 50px; font-weight: normal;">Transaction Details</h1>
		

		<!-- Kiểm tra nếu có thông tin -->
		<c:choose>
			<c:when test="${empty popcornDetails}">
				<p style="text-align: center;">No popcorn details available for this transaction.</p>
			</c:when>
			<c:otherwise>
				<!-- Bảng hiển thị thông tin -->
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Popcorn ID</th>
							<th>Name</th>
							<th>Type</th>
							<th>Price</th>
							<th>Status</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="popcornPayment" items="${popcornDetails}">
							<tr>
								<td>${popcornPayment.popcorn.popcornID}</td>
								<td>${popcornPayment.popcorn.namePopCorn}</td>
								<td>${popcornPayment.popcorn.typePopCorn}</td>
								<td>$${popcornPayment.popcorn.price}</td>
								<td>${popcornPayment.popcorn.status}</td>
								<td>${popcornPayment.quantity}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>

		<!-- Nút Back -->
		<div class="text-center">
			<a
				href="${pageContext.request.contextPath}/userTransaction?personId=${sessionScope.person.perID}"
				class="btn btn-primary">Back to Transactions</a>
		</div>
	</div>
</body>

</html>
