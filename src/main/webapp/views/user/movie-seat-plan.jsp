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
					<a href="/ValCT_Nhom5/bookTickets"
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
    .seat-checkbox:checked + img {
        content: url("assets/images/movie/seat01.png"); /* Hình ảnh ghế đang chọn */
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
                <form action="/ValCT_Nhom5/confirmBooking" method="post">
                    <input type="hidden" name="screeningId" value="${screeningId}">
                    <ul class="seat-area">
                        <!-- Duyệt qua từng hàng -->
                        <c:forEach var="rowEntry" items="${seatStatusesGroupedByRow}">
                            <li class="seat-line">
                                <span>${rowEntry.key}</span> <!-- Hiển thị tên hàng -->
                                <ul class="seat--area">
                                    <!-- Duyệt qua từng ghế trong hàng -->
                                    <c:forEach var="seatStatus" items="${rowEntry.value}">
                                        <li class="single-seat">
                                            <label class="seat-label">
                                                <!-- Checkbox cho ghế -->
                                                <input type="checkbox" class="seat-checkbox" name="selectedSeats" value="${seatStatus.seat.seatID}"
                                                       ${seatStatus.status ? 'disabled' : ''}>
                                                <!-- Hình ảnh dựa trên trạng thái ghế -->
                                                <img src="assets/images/movie/${seatStatus.status ? 'seat01-free.png' : 'seat01-booked.png'}" 
                                                     alt="seat">
                                                <span>${seatStatus.seat.seatNumber}</span>
                                            </label>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <span>${rowEntry.key}</span> <!-- Tên hàng ở cuối -->
                            </li>
                        </c:forEach>
                    </ul>
                    <button type="submit" class="custom-button">Confirm</button>
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
	    document.querySelectorAll(".single-seat input[type='checkbox']").forEach(function(checkbox) {
	        checkbox.addEventListener("change", function() {
	            const img = this.closest("label").querySelector("img");
	            if (this.checked) {
	                img.src = "assets/images/movie/seat01.png"; // Hình ảnh khi ghế được chọn
	            } else {
	                img.src = this.dataset.status === "booked"
	                    ? "assets/images/movie/seat01-booked.png" // Trạng thái đã đặt
	                    : "assets/images/movie/seat01-free.png"; // Trạng thái trống
	            }
	        });
	    });
	</script>

</body>
</html>