<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transaction History</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
</head>

<body>
	<style>
body {
	font-family: 'Arial', sans-serif;
	background: #0b112b;
	color: #ffffff;
}

.account-section {
	padding: 50px 0;
	background:
		url("${pageContext.request.contextPath}/assets/images/account/account-bg.jpg")
		no-repeat center center/cover;
	text-align: center;
	color: white;
}

.account-section h1 {
	font-size: 36px;
	font-weight: bold;
	margin-bottom: 30px;
}

.table-container {
	margin: 20px auto;
	padding: 20px;
	background: rgba(15, 15, 35, 0.95);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	max-width: 90%;
}

.table {
	margin-bottom: 0;
	color: #ffffff;
}

.table thead {
	background-color: #fbc531;
	color: #0b112b;
}

.table tbody tr:nth-child(odd) {
	background-color: rgba(255, 255, 255, 0.1);
}

.table tbody tr:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

.table th, .table td {
	text-align: center;
	vertical-align: middle;
}

.table td {
	color: #f1f1f1;
}

.btn-back {
	margin-top: 20px;
}

.btn-primary {
	background-color: #fbc531;
	border-color: #fbc531;
	color: #0b112b;
}

.btn-primary:hover {
	background-color: #e1a800;
	border-color: #e1a800;
}

.btn-info {
	background-color: #00aaff;
	border-color: #00aaff;
	color: #ffffff;
}

.btn-info:hover {
	background-color: #008ecc;
	border-color: #008ecc;
}

.pagination {
	margin: 20px 0;
	display: flex;
	justify-content: center;
	list-style: none;
	padding: 0;
}

.pagination li {
	margin: 0 5px;
}

.pagination a {
	color: #ffffff;
	background-color: #0b112b;
	padding: 8px 12px;
	text-decoration: none;
	border: 1px solid #fbc531;
	border-radius: 4px;
	transition: all 0.3s ease;
}

.pagination a:hover {
	background-color: #fbc531;
	color: #0b112b;
}

.pagination .active {
	background-color: #fbc531;
	color: #0b112b;
	border: 1px solid #fbc531;
}
</style>

	<section class="account-section bg_img">
		<div class="container">
			<h2 style="visibility: hidden;">dhsau</h2>
			<h2 style="visibility: hidden;">dhsau</h2>
			<h1 style="font-size: 50px; font-weight: normal;">Transaction
				History</h1>
		</div>
	</section>

	<div class="container table-container">
		<!-- Transaction History Table -->
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Payment Id</th>
					<th>Movie Name</th>
					<th>Cinema Name</th>
					<th>Room Name</th>
					<th>Seat</th>
					<th>Start Hour</th>
					<th>End Hour</th>
					<th>Total Price</th>
					<th>Details</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ticket" items="${ticketHistory}">
					<tr>
						<td>${ticket.paymentId}</td>
						<td>${ticket.movieName}</td>
						<td>${ticket.cinemaName}</td>
						<td>${ticket.roomName}</td>
						<td>${ticket.concatenatedSeats}</td>
						<td>${ticket.startHour}</td>
						<td>${ticket.endHour}</td>
						<td>${ticket.totalPrice}</td>
						<td>
							<button class="btn btn-info btn-details"
								onclick="window.location.href='${pageContext.request.contextPath}/userTransactionDetail?paymentId=${ticket.paymentId}'">
								Details</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<!-- Pagination -->
		<c:if test="${totalPages > 0}">
			<ul class="pagination">
				<c:forEach var="i" begin="0" end="${totalPages - 1}">
					<li><a
						href="${pageContext.request.contextPath}/userTransaction?personId=${personId}&page=${i}"
						class="${i == currentPage ? 'active' : ''}"> ${i + 1} </a></li>
				</c:forEach>
			</ul>
		</c:if>

		<div class="text-center btn-back">
			<a href="${pageContext.request.contextPath}/userHome"
				class="btn btn-primary">Back to Home</a>
		</div>
	</div>

	<!-- Include Bootstrap JS -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>