<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>

	<!-- ==========Banner-Section========== -->
	<c:url value="/image?fname=${movie.image}" var="movieImgUrl"></c:url>
	<section class="details-banner hero-area bg_img"
		data-background="${movieImgUrl}" id = "data-background-MV">
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
					<a href="${pageContext.request.contextPath}/userBookTickets?movieId=${movie.movieID}"
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
					<form action="${pageContext.request.contextPath}/userSelectSeats" method="post">

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
									</ul>  <!-- Tên hàng ở cuối --></li>
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
				</div>
			</div>
		</div>
	</div>



	<!-- ==========Movie-Section========== -->
	<script>
		// Giả sử thời gian đếm ngược là 5 phút (5 * 60 = 300 giây)
		var countdown = 300;
		var countdownTimer = document.getElementById("countdown-timer");

		var countdownInterval = setInterval(function() {
			var minutes = Math.floor(countdown / 60);
			var seconds = countdown % 60;
			countdownTimer.textContent = minutes + ":"
					+ (seconds < 10 ? "0" : "") + seconds;
			countdown--;

			if (countdown < 0) {
				clearInterval(countdownInterval);
				window.location.href = "${pageContext.request.contextPath}/userBookTickets?movieId=${movie.movieID}";// Dừng đếm ngược khi hết thời gian
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
		// Lấy phần tử bằng id
		const element = document.getElementById('data-background-MV');

		// Kiểm tra và gán background image nếu element tồn tại
		if (element) {
		    const bgImage = element.getAttribute('data-background');
		    //const image = 'url('+ '"' + bgImage + '"' + ')';
		    if (bgImage) {
		        element.style.backgroundImage = 'url('+ '"' + bgImage + '"' + ')';;
		        element.style.backgroundSize = 'cover'; // Phủ đầy
		        element.style.backgroundPosition = 'center'; // Canh giữa
		        element.style.backgroundRepeat = 'no-repeat'; // Không lặp lại
		    }
		}


	</script>
</body>
</html>