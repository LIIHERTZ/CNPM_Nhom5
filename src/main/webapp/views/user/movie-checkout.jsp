<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%
// Đặt thời gian đếm ngược (5 phút)
int countdownMinutes = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- ==========Banner-Section========== -->
	<section class="details-banner hero-area bg_img"
		data-background="'assets/images/banner/banner03.jpg'">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-content">
					<!-- Display movie title -->
					<h3 class="title">${movie.movieName}</h3>

					<!-- Optional: Add additional movie information here -->
					<div class="movie-info">
						<!-- Example: Movie duration -->
						<p>
							<strong>Duration:</strong> ${movie.movieDuration}
						</p>

						<!-- Example: Movie release date -->
						<p>
							<strong>Category:</strong> ${movie.category}
						</p>
						<p>
							<strong>Experience:</strong> ${experience}
						</p>
						<p>
							<strong>version:</strong> ${version}
						</p>
						<p>
							<strong>Location:</strong> ${selectedLocation}
						</p>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->

	<!-- ==========Page-Title========== -->
	<section class="page-title bg-one">
		<div class="container">
			<div class="page-title-area">
				<!-- Nút quay lại -->
				<div class="item md-order-1">
					<a href="/ValCT_Nhom5/selectSeats"
						class="custom-button back-button"> <i
						class="flaticon-double-right-arrows-angles"></i>back
					</a>
				</div>

				<!-- Hiển thị ngày và giờ đã chọn -->
				<div class="item date-item">
					<!-- Hiển thị startHour theo định dạng HH:mm, dd/MM/yyyy -->
					<c:if test="${not empty startHour}">
						<fmt:formatDate value="${startHour}" pattern="HH:mm, dd/MM/yyyy" />
					</c:if>
				</div>


				<!-- Đếm ngược thời gian -->
				<div class="item">
					<h5 class="title" id="countdown-timer">05:00</h5>
					<p>Mins Left</p>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Page-Title========== -->

	<!-- ==========Movie-Section========== -->
	<div class="movie-facility padding-bottom padding-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div
						class="checkout-widget d-flex flex-wrap align-items-center justify-cotent-between">
						<div class="title-area">
							<h5 class="title">Already a Boleto Member?</h5>
							<p>Sign in to earn points and make booking easier!</p>
						</div>
						<a href="/ValCT_Nhom5/signin" class="sign-in-area"> <i
							class="fas fa-user"></i><span>Sign in</span>
						</a>
					</div>
					<div class="checkout-widget checkout-contact">
						<h5 class="title">Share your Contact Details</h5>
						<form class="checkout-contact-form">
							<div class="form-group">
								<input type="text" placeholder="Full Name">
							</div>
							<div class="form-group">
								<input type="text" placeholder="Enter your Mail">
							</div>
							<div class="form-group">
								<input type="text" placeholder="Enter your Phone Number ">
							</div>
							<div class="form-group">
								<input type="submit" value="Continue" class="custom-button">
							</div>
						</form>
					</div>
					<div class="checkout-widget checkout-contact">
						<h5 class="title">Promo Code</h5>
						<form class="checkout-contact-form">
							<div class="form-group">
								<input type="text" placeholder="Please enter promo code">
							</div>
							<div class="form-group">
								<input type="submit" value="Verify" class="custom-button">
							</div>
						</form>
					</div>
					<div class="checkout-widget checkout-card mb-0">
						<h5 class="title">Payment Option</h5>
						<ul class="payment-option">
							<li class="active"><a href="#0"> <img
									src="assets/images/payment/card.png" alt="payment"> <span>Credit
										Card</span>
							</a></li>
							<li><a href="#0"> <img
									src="assets/images/payment/card.png" alt="payment"> <span>Debit
										Card</span>
							</a></li>
							<li><a href="#0"> <img
									src="assets/images/payment/paypal.png" alt="payment"> <span>paypal</span>
							</a></li>
						</ul>
						<h6 class="subtitle">Enter Your Card Details</h6>
						<form class="payment-card-form">
							<div class="form-group w-100">
								<label for="card1">Card Details</label> <input type="text"
									id="card1">
								<div class="right-icon">
									<i class="flaticon-lock"></i>
								</div>
							</div>
							<div class="form-group w-100">
								<label for="card2"> Name on the Card</label> <input type="text"
									id="card2">
							</div>
							<div class="form-group">
								<label for="card3">Expiration</label> <input type="text"
									id="card3" placeholder="MM/YY">
							</div>
							<div class="form-group">
								<label for="card4">CVV</label> <input type="text" id="card4"
									placeholder="CVV">
							</div>
							<div class="form-group check-group">
								<input id="card5" type="checkbox" checked> <label
									for="card5"> <span class="title">QuickPay</span> <span
									class="info">Save this card information to my Boleto
										account and make faster payments.</span>
								</label>
							</div>
							<div class="form-group">
								<input type="submit" class="custom-button" value="make payment">
							</div>
						</form>
						<p class="notice">
							By Clicking "Make Payment" you agree to the <a href="#0">terms
								and conditions</a>
						</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="booking-summery bg-one">
						<h4 class="title">booking summery</h4>
						<ul>
							<li>
								<h6 class="subtitle">${movie.movieName}</h6> <span class="info">${experience},
									${version}</span>
							</li>
							<li>
								<h6 class="subtitle">
									<span>${selectedLocation}</span>
								</h6>
								<div class="info">
									<span><fmt:formatDate value="${startHour}"
											pattern="HH:mm, dd/MM/yyyy" /></span> <span>Tickets</span>
								</div>
							</li>
							<li>
								<h6 class="subtitle mb-0">
									<span>Tickets Price</span><span>${totalPrice} VND</span>
								</h6>
							</li>
							<li>
								<h6 class="subtitle mb-0">
									<span>Seats</span><span>${selectedSeats}</span>
								</h6>
							</li>
						</ul>
						<ul class="side-shape">
							<li>
								<h6 class="subtitle">
									<span>food & bevarage</span> <span> <!-- Hiển thị tổng tiền Food & Beverage -->
										<c:choose>
											<c:when test="${not empty foodAndBeverageTotal}">
                        ${foodAndBeverageTotal}
                    </c:when>
											<c:otherwise>
                    </c:otherwise>
										</c:choose>
									</span>
								</h6> <span class="info"> <!-- Hiển thị danh sách sản phẩm -->
									<c:if test="${not empty products}">
										<c:forEach var="entry" items="${products}">
											<span> ${entry.value[0]}  ${entry.key} 
												${entry.value[1]} VND </span>
										</c:forEach>
									</c:if>
							</span>
							</li>
							<li>
								<h6 class="subtitle">
									<span>discount coupon</span><span>$0</span>
								</h6>
							</li>
						</ul>
						<%-- <ul>
							<li><span class="info"><span>price</span><span>${totalPrice} VND</span></span></li>
						</ul> --%>
					</div>
					<div class="proceed-area  text-center">
						<h6 class="subtitle">
							<span>Amount Payable</span> <span> <c:choose>
									<c:when test="${not empty amountPayable}">
                ${amountPayable} VND
            </c:when>
									<c:otherwise>
                ${totalPrice} VND
            </c:otherwise>
								</c:choose>
							</span>
						</h6>
						<a href="/ValCT_Nhom5/addService"
							class="custom-button back-button">Add-Service</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ==========Movie-Section========== -->

	<script>
		// Giả sử thời gian đếm ngược là 5 phút (5 * 60 = 300 giây)
		var countdown = 300;
		var countdownTimer = document.getElementById("countdown-timer");

		setInterval(function() {
			var minutes = Math.floor(countdown / 60);
			var seconds = countdown % 60;
			countdownTimer.textContent = minutes + ":"
					+ (seconds < 10 ? "0" : "") + seconds;
			countdown--;

			if (countdown < 0) {
				clearInterval(countdownInterval);
				window.location.href = "/ValCT_Nhom5/selectSeats";// Dừng đếm ngược khi hết thời gian
			}
		}, 1000);
	</script>

</body>
</html>