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
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

.container {
	margin-top: 50px;
	background-color: #ffffff;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

h1 {
	text-align: center;
	color: #007bff;
	margin-bottom: 20px;
}

table {
	margin-top: 20px;
}

table thead {
	background-color: #007bff;
	color: white;
}

table tbody tr:nth-child(odd) {
	background-color: #f2f2f2;
}

table tbody tr:nth-child(even) {
	background-color: #ffffff;
}

table tbody tr:hover {
	background-color: #e9ecef;
}

.btn-primary {
	margin-top: 20px;
}

th, td {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container">
		<!-- Title -->
		<h2 style="visibility: hidden;">dhsau</h2>
		<h2 style="visibility: hidden;">dhsau</h2>
		<h1 style="font-size: 24px; font-weight: normal;">Transaction
			Details</h1>


		<!-- Check if there are any details -->
		<c:choose>
			<c:when test="${empty popcornDetails}">
				<p style="text-align: center; color: red;">No popcorn details
					available for this transaction.</p>
			</c:when>
			<c:otherwise>
				<!-- Table -->
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="color: red;">Popcorn ID</th>
							<th style="color: red;">Name</th>
							<th style="color: red;">Type</th>
							<th style="color: red;">Price</th>
							<th style="color: red;">Status</th>
							<th style="color: red;">Quantity</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="popcornPayment" items="${popcornDetails}">
							<tr>
								<td style="color: red;">${popcornPayment.popcorn.popcornID}</td>
								<td style="color: red;">${popcornPayment.popcorn.namePopCorn}</td>
								<td style="color: red;">${popcornPayment.popcorn.typePopCorn}</td>
								<td style="color: red;">${popcornPayment.popcorn.price}</td>
								<td style="color: red;">${popcornPayment.popcorn.status}</td>
								<td style="color: red;">${popcornPayment.quantity}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>

		<!-- Back Button -->
		<div class="text-center">
			<a
				href="${pageContext.request.contextPath}/userTransaction?personId=${sessionScope.person.perID}"
				class="btn btn-primary">Back to Transactions</a>
		</div>
	</div>
</body>
</html>
