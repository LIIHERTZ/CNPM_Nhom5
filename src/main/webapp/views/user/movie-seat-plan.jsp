<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%
// Lấy giờ đã chọn (giả sử giờ được gửi từ server)
String selectedTime = (String) request.getAttribute("startHour");
if (selectedTime == null) {
	selectedTime = "9:40"; // Giá trị mặc định nếu chưa có
}

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
					<a href="/ValCT_Nhom5/bookTickets"
						class="custom-button back-button"> <i
						class="flaticon-double-right-arrows-angles"></i>back
					</a>
				</div>

				<!-- Hiển thị ngày và giờ đã chọn -->
				<div class="item date-item">
					<!-- Hiển thị ngày và giờ từ biến selectedTime (có thể chứa ngày và startHour) -->
					<span class="date"> ${fn:substring(selectedStartHour, 11, 16)}
						, ${selectedTime} </span>
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
	<div class="seat-plan-section padding-bottom padding-top">
		<div class="container">
			<div class="screen-area">
				<h4 class="screen">screen</h4>
				<div class="screen-thumb">
					<img src="assets/images/movie/screen-thumb.png" alt="movie">
				</div>
				<h5 class="subtitle">silver plus</h5>
				<div class="screen-wrapper">
					<ul class="seat-area">
						<li class="seat-line"><span>G</span>
							<ul class="seat--area">
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
									</ul>
								</li>
							</ul> <span>G</span></li>
						<li class="seat-line"><span>f</span>
							<ul class="seat--area">
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat seat-free"><img
											src="assets/images/movie/seat01-booked.png" alt="seat">
											<span class="sit-num">f7</span></li>
										<li class="single-seat seat-free"><img
											src="assets/images/movie/seat01-booked.png" alt="seat">
											<span class="sit-num">f8</span></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat seat-free"><img
											src="assets/images/movie/seat01-booked.png" alt="seat">
											<span class="sit-num">f9</span></li>
										<li class="single-seat seat-free"><img
											src="assets/images/movie/seat01-booked.png" alt="seat">
											<span class="sit-num">f10</span></li>
										<li class="single-seat seat-free"><img
											src="assets/images/movie/seat01-booked.png" alt="seat">
											<span class="sit-num">f11</span></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat01.png" alt="seat"></li>
									</ul>
								</li>
							</ul> <span>f</span></li>
					</ul>
				</div>
				<h5 class="subtitle">silver plus</h5>
				<div class="screen-wrapper">
					<ul class="seat-area couple">
						<li class="seat-line"><span>e</span>
							<ul class="seat--area">
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
							</ul> <span>e</span></li>
						<li class="seat-line"><span>d</span>
							<ul class="seat--area">
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-booked.png" alt="seat">
											<span class="sit-num">D7 D8</span></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
							</ul> <span>d</span></li>
						<li class="seat-line"><span>c</span>
							<ul class="seat--area">
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">f11 f12</span></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
							</ul> <span>c</span></li>
						<li class="seat-line"><span>b</span>
							<ul class="seat--area">
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">b7 b8</span></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
										<li class="single-seat"><img
											src="assets/images/movie/seat02.png" alt="seat"></li>
									</ul>
								</li>
							</ul> <span>b</span></li>
						<li class="seat-line"><span>a</span>
							<ul class="seat--area">
								<li class="front-seat">
									<ul>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">a1 a2</span></li>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">a3 a4</span></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">a5 a6</span></li>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">a7 a8</span></li>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">a9 a10</span></li>
									</ul>
								</li>
								<li class="front-seat">
									<ul>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">a11</span></li>
										<li class="single-seat seat-free-two"><img
											src="assets/images/movie/seat02-free.png" alt="seat"> <span
											class="sit-num">a12</span></li>
									</ul>
								</li>
							</ul> <span>a</span></li>
					</ul>
				</div>
			</div>
			<div class="proceed-book bg_img"
				data-background="assets/images/movie/movie-bg-proceed.jpg">
				<div class="proceed-to-book">
					<div class="book-item">
						<span>You have Choosed Seat</span>
						<h3 class="title">d9, d10</h3>
					</div>
					<div class="book-item">
						<span>total price</span>
						<h3 class="title">$150</h3>
					</div>
					<div class="book-item">
						<a href="/ValCT_Nhom5/movieCheckout" class="custom-button">proceed</a>
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
				clearInterval(countdownInterval); // Dừng đếm ngược khi hết thời gian
			}
		}, 1000);
	</script>
</body>
</html>