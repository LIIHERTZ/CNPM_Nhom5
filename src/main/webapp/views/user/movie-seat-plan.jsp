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
<<<<<<< HEAD
=======
				<!-- Nút quay lại -->
>>>>>>> HongPhuc
				<div class="item md-order-1">
					<a href="/ValCT_Nhom5/bookTickets"
						class="custom-button back-button"> <i
						class="flaticon-double-right-arrows-angles"></i>back
					</a>
				</div>
<<<<<<< HEAD
				<div class="item date-item">
					<span class="date">MON, SEP 09 2020</span> <select
						class="select-bar">
						<option value="sc1">09:40</option>
						<option value="sc2">13:45</option>
						<option value="sc3">15:45</option>
						<option value="sc4">19:50</option>
					</select>
				</div>
				<div class="item">
					<h5 class="title">05:00</h5>
=======

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
>>>>>>> HongPhuc
					<p>Mins Left</p>
				</div>
			</div>
		</div>
	</section>
<<<<<<< HEAD
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
=======

	<!-- ==========Page-Title========== -->

	<!-- ==========Movie-Section========== -->
	<style>
/* Ẩn checkbox */
.seat-checkbox {
	display: none;
}

/* Tạo hiệu ứng tích bằng cách sử dụng label */
.seat-label {
	cursor: pointer;
}

/* Thay đổi hình ảnh ghế khi checkbox được chọn */
.seat-checkbox:checked+img {
	content: url("assets/images/movie/seat01-booked.png");
	/* Hình ảnh ghế thường đang chọn */
}

.seat-checkbox.couple:checked+img {
	content: url("assets/images/movie/seat02-booked.png");
	/* Hình ảnh ghế đôi đang chọn */
}
</style>

	<div class="seat-plan-section padding-bottom padding-top">
		<div class="container">
			<div class="screen-area">
				<h4 class="screen">Screen</h4>
				<div class="screen-thumb">
					<img src="assets/images/movie/screen-thumb.png" alt="screen">
				</div>
				<h5 class="subtitle">silver plus</h5>
				<div class="screen-wrapper">
					<form action="/ValCT_Nhom5/selectSeats" method="post">

						<input type="hidden" name="selectedSeats" id="hiddenSelectedSeats"
							value=""> <input type="hidden" name="totalPrice"
							id="hiddenTotalPrice" value=""> 
							
							
							<input type="hidden"
							name="screeningId" value="${screeningId}">
						<ul class="seat-area">
							<!-- Duyệt qua từng hàng -->
							<c:forEach var="rowEntry" items="${seatStatusesGroupedByRow}">
								<li class="seat-line"><span>${rowEntry.key}</span> <!-- Hiển thị tên hàng -->
									<ul class="seat--area">
										<!-- Duyệt qua từng ghế trong hàng -->
										<c:forEach var="seatStatus" items="${rowEntry.value}">
											<li class="single-seat"><label class="seat-label">
													<!-- Checkbox cho ghế --> <input type="checkbox"
													class="seat-checkbox ${seatStatus.seat.isCouple() ? 'couple' : ''}"
													name="selectedSeats" data-status="free"
													data-seat-number="${seatStatus.seat.seatNumber}"
													data-couple="${seatStatus.seat.isCouple()}"
													value="${seatStatus.seat.seatID}"
													${seatStatus.status ? 'disabled' : ''}> <!-- Hình ảnh dựa trên trạng thái và loại ghế -->
													<img
													src="assets/images/movie/${
                                                    seatStatus.seat.isCouple() 
                                                    ? (seatStatus.status ? 'seat02-free.png' : 'seat02.png') 
                                                    : (seatStatus.status ? 'seat01-free.png' : 'seat01.png')
                                                }"
													alt="seat"> <span>${seatStatus.seat.seatNumber}</span>
											</label></li>
										</c:forEach>
									</ul> <span>${rowEntry.key}</span> <!-- Tên hàng ở cuối --></li>
							</c:forEach>
						</ul>


						<div class="proceed-book bg_img"
							data-background="assets/images/movie/movie-bg-proceed.jpg">
							<div class="proceed-to-book">
								<div class="book-item">
									<span>You have Choosed Seat</span>
									<h3 class="title selected-seats">No seats selected</h3>
									<!-- Giữ nguyên style -->
								</div>
								<div class="book-item">
									<span>Total Price</span>
									<h3 class="title total-price">0 VND</h3>
									<!-- Giữ nguyên style -->
								</div>
								<div class="book-item">
								
									<button type="submit" class="custom-button">Proceed</button>																		
									
									<!-- Giữ nguyên style -->
								</div>
							</div>
						</div>





					</form>
>>>>>>> HongPhuc
				</div>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	<!-- ==========Movie-Section========== -->
=======



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
				window.location.href = "/ValCT_Nhom5/bookTickets";// Dừng đếm ngược khi hết thời gian
			}
		}, 1000);
		document
				.querySelectorAll(".single-seat input[type='checkbox']")
				.forEach(
						function(checkbox) {
							checkbox
									.addEventListener(
											"change",
											function() {
												const img = this.closest(
														"label").querySelector(
														"img");

												// Khi checkbox được chọn
												if (this.checked) {
													img.src = this.classList
															.contains("couple") ? "assets/images/movie/seat02-booked.png" // Hình ảnh ghế đôi đang chọn
															: "assets/images/movie/seat01-booked.png"; // Hình ảnh ghế đơn đang chọn
												}
												// Khi checkbox bị bỏ chọn
												else {
													const isCouple = this.classList
															.contains("couple");
													const isBooked = this.dataset.status === "booked";

													// Kiểm tra trạng thái ban đầu
													if (isBooked) {
														img.src = isCouple ? "assets/images/movie/seat02-booked.png" // Ghế đôi đã đặt
																: "assets/images/movie/seat01-booked.png"; // Ghế đơn đã đặt
													} else {
														img.src = isCouple ? "assets/images/movie/seat02.png" // Ghế đôi trống
																: "assets/images/movie/seat01.png"; // Ghế đơn trống
													}
												}
											});
						});
		
		
		
		
		
		
		document.addEventListener("DOMContentLoaded", function () {
		    const checkboxes = document.querySelectorAll(".seat-checkbox");
		    const selectedSeatsElement = document.querySelector(".selected-seats");
		    const totalPriceElement = document.querySelector(".total-price");

		    let selectedSeats = [];
		    let totalPrice = 0;

		    checkboxes.forEach((checkbox) => {
		        checkbox.addEventListener("change", function () {
		            const seatNumber = this.dataset.seatNumber; // Lấy số ghế
		            const isCouple = this.dataset.couple === "true"; // Kiểm tra ghế đôi

		            if (this.checked) {
		                // Thêm ghế vào danh sách đã chọn
		                selectedSeats.push(seatNumber);
		                totalPrice += isCouple ? 150000 : 90000; // Giá ghế đôi: 150k, đơn: 90k
		            } else {
		                // Xóa ghế khỏi danh sách
		                selectedSeats = selectedSeats.filter(seat => seat !== seatNumber);
		                totalPrice -= isCouple ? 150000 : 90000;
		            }

		            // Cập nhật giao diện
		            selectedSeatsElement.textContent = selectedSeats.length > 0 
		                ? selectedSeats.join(", ") 
		                : "No seats selected";
		            totalPriceElement.textContent = totalPrice > 0 
		                ? totalPrice + " VND" // Sử dụng backticks ở đây
		                : "0 VND";
		        });
		    });
		    
		 // Cập nhật hidden input khi submit form
		    document.querySelector("form").addEventListener("submit", function () {
		        const hiddenSeatsInput = document.getElementById("hiddenSelectedSeats");
		        const hiddenPriceInput = document.getElementById("hiddenTotalPrice");

		        hiddenSeatsInput.value = selectedSeats.join(","); // Danh sách ghế đã chọn
		        hiddenPriceInput.value = totalPrice; // Tổng giá
		    });
		    
		});


	</script>
>>>>>>> HongPhuc
</body>
</html>