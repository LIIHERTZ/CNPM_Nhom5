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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f8f9fa;
        }

        .account-section {
            padding: 50px 0;
            background: url("${pageContext.request.contextPath}/assets/images/account/account-bg.jpg") no-repeat center center / cover;
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
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            max-width: 90%;
        }

        .table {
            margin-bottom: 0;
            text-align: left;
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }

        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <!-- Section for Transaction History -->
    <section class="account-section bg_img">
        <div class="container">
        <h2 style="visibility: hidden;">dhsau</h2>
        <h2 style="visibility: hidden;">dhsau</h2>
            <h1 style="font-size: 24px; font-weight: normal;">Transaction History</h1>
        </div>
    </section>

    <div class="container table-container">
        <!-- Transaction History Table -->
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th style="color: red;">Ticket ID</th>
                    <th style="color: red;">Movie Name</th>
                    <th style="color: red;">Cinema Name</th>
                    <th style="color: red;">Room Name</th>
                    <th style="color: red;">Chair Number</th>
                    <th style="color: red;">Start Hour</th>
                    <th style="color: red;">End Hour</th>
                    <th style="color: red;">Price</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${ticketHistory}">
                    <tr>
                        <td style="color: red;">${ticket.ticketID}</td>
                        <td style="color: red;">${ticket.movieName}</td>
                        <td style="color: red;">${ticket.cinemaName}</td>
                        <td style="color: red;">${ticket.roomName}</td>
                        <td style="color: red;">${ticket.chairNumber}</td>
                        <td style="color: red;"><fmt:formatDate value="${ticket.startHour}" pattern="HH:mm dd-MM-yyyy"/></td>
                        <td style="color: red;"><fmt:formatDate value="${ticket.endHour}" pattern="HH:mm dd-MM-yyyy"/></td>
                        <td style="color: red;">$${ticket.priceTicket}</td>
						<td>
							<button class="btn btn-info btn-details"
								onclick="window.location.href='${pageContext.request.contextPath}/userTransactionDetail?ticketId=${ticket.ticketID}'">
								Details</button>
						</td>
					</tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-center btn-back">
            <a href="${pageContext.request.contextPath}/userHome" class="btn btn-primary">Back to Home</a>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>
