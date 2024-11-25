<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%
// Äáº·t thá»i gian Äáº¿m ngÆ°á»£c (5 phÃºt)
int countdownMinutes = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/ValCT_Nhom5/assets2/css/bootstrap.min.css">

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
				<!-- NÃºt quay láº¡i -->
				<div class="item md-order-1">
					<a href="/ValCT_Nhom5/selectSeats"
						class="custom-button back-button"> <i
						class="flaticon-double-right-arrows-angles"></i>back
					</a>
				</div>

				<!-- Hiá»n thá» ngÃ y vÃ  giá» ÄÃ£ chá»n -->
				<div class="item date-item">
					<!-- Hiá»n thá» startHour theo Äá»nh dáº¡ng HH:mm, dd/MM/yyyy -->
					<c:if test="${not empty startHour}">
						<fmt:formatDate value="${startHour}" pattern="HH:mm, dd/MM/yyyy" />
					</c:if>
				</div>


				<!-- Äáº¿m ngÆ°á»£c thá»i gian -->
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
								<input type="text" placeholder="Please add promo code"
									id="selectedCouponName" name="selectedCouponName" readonly >
							</div>
							<!-- Input ẩn để lưu giá trị coupon -->
							<input type="hidden" id="selectedCouponId"
								name="selectedCouponId">
								<input type="hidden" id="selectedCouponValue"
								name="selectedCouponValue">
							<div class="form-group">
								<!-- Nút để mở modal -->
								<button type="button" data-bs-toggle="modal"
									class="custom-button"
									data-bs-target="#modal-coupon" style="width: 162px; height: 50px;">Add Coupon</button>
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
									<span>Tickets Price</span><span  id="ticketPrice">${totalPrice} VND</span>
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
									<span>food & bevarage</span> <span  id="popcornValue"> <!-- Hiá»n thá» tá»ng tiá»n Food & Beverage -->
										<c:choose>
											<c:when test="${not empty foodAndBeverageTotal}">
                        ${foodAndBeverageTotal}
                    </c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</span>
								</h6> <span class="info" > <!-- Hiá»n thá» danh sÃ¡ch sáº£n pháº©m -->
									<c:if test="${not empty products}">
										<c:forEach var="entry" items="${products}">
											<span> ${entry.value[0]} ${entry.key}
												${entry.value[1]} VND </span>
										</c:forEach>
									</c:if>
							</span>
							</li>
							<li>
								<h6 class="subtitle">
									<span>discount coupon</span><span id="discountValue">$0</span>
								</h6>
							</li>
						</ul>
						<%-- <ul>
							<li><span class="info"><span>price</span><span>${totalPrice} VND</span></span></li>
						</ul> --%>
					</div>
					<div class="proceed-area  text-center">
						<h6 class="subtitle">
							<span>Amount Payable</span> <span id="amountPayableValue"> <c:choose>
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

	<!-- modal -->
	<div class="modal fade" id="modal-coupon" tabindex="-1" aria-labelledby="modal-user" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="border-radius: 20px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);">
            <div class="modal-header" style="display: flex; justify-content: center;">
                <h5 class="modal-title" style ="color:black ">Chon Coupon</h5>
            </div>
            <div class="modal-body">
                <!-- Ô tìm kiếm -->
                <input type="text" id="search-input" placeholder="Tim kiem coupon..." 
                       style="width: 100%; margin-bottom: 10px; padding: 5px; border: 1px solid #ccc; color : #007bff">
                
                <!-- Danh sách coupon -->
                <div style="max-height: 300px; overflow-y: auto; border: 1px solid #ddd; padding: 10px; background-color: #f8f9fa;">
                    <ul class="list-group" id="coupon-list">
                        <!-- Danh sách các coupon -->
                        <c:forEach var="coupon" items="${coupons}">
                            <li class="list-group-item">
                                <button type="button" class="btn btn-link select-coupon" 
                                        data-coupon-id="${coupon.couponID}" 
                                        data-coupon-name="${coupon.couponName}"
                                         data-coupon-value="${coupon.couponValue}">
                                    ${coupon.couponName} - ${coupon.couponValue}%
                                </button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="modal-footer" style="display: flex; justify-content: center;">
                <button type="button" class="btn btn-secondary custom-button" data-bs-dismiss="modal" style="width: 162px; height: 50px;">Close</button>
            </div>
        </div>
    </div>
</div>




	<!-- end modal -->
	<script>
		// Giáº£ sá»­ thá»i gian Äáº¿m ngÆ°á»£c lÃ  5 phÃºt (5 * 60 = 300 giÃ¢y)
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
				window.location.href = "/ValCT_Nhom5/selectSeats";// Dá»«ng Äáº¿m ngÆ°á»£c khi háº¿t thá»i gian
			}
		}, 1000);
	</script>
	
	<script>
	//code thao
	document.addEventListener("DOMContentLoaded", function () {
    const couponButtons = document.querySelectorAll(".select-coupon");

    couponButtons.forEach(button => {
        button.addEventListener("click", function () {
            // Lấy thông tin coupon từ dataset
            const couponId = this.getAttribute("data-coupon-id");
            const couponName = this.getAttribute("data-coupon-name");
            const couponValue = this.getAttribute("data-coupon-value");
			console.log( this.getAttribute("data-coupon-value"));
            // Gửi giá trị coupon đến input ẩn
            document.getElementById("selectedCouponId").value = couponId;
            document.getElementById("selectedCouponValue").value = couponValue;
            document.getElementById("selectedCouponName").value = couponName;
            //
            // Lấy giá trị totalPrice hiện tại và loại bỏ khoảng trắng
            const ticketPriceElement = document.getElementById("ticketPrice");
            const ticketPriceText = ticketPriceElement.textContent.trim(); // Loại bỏ khoảng trắng thừa
            const ticketPrice = parseFloat(ticketPriceText.replace(/[^0-9.-]+/g, "")) || 0; // Chỉ giữ lại số
            
            const popcornValueElement = document.getElementById("popcornValue");
            const popcornValueText = popcornValueElement.textContent.trim(); // Loại bỏ khoảng trắng thừa
            const popcornValue = parseFloat(popcornValueText.replace(/[^0-9.-]+/g, "")) || 0; // Chỉ giữ lại số
            
            
            // Tính toán số tiền giảm giá và tổng tiền sau giảm giá
            const discountAmount = ((ticketPrice+popcornValue) * couponValue) / 100; // Số tiền giảm
            const updatedAmountPayable = (ticketPrice+popcornValue) - discountAmount; // Tổng tiền sau giảm

            // Cập nhật số tiền giảm giá và tổng tiền hiển thị
            const totalPriceElement = document.getElementById("amountPayableValue");
			totalPriceElement.textContent = Math.round(updatedAmountPayable) + " VND";
//
			const discountValueElement = document.getElementById("discountValue");
            discountValueElement.textContent = couponValue + "%"; // Cập nhật giá trị giảm giá
            // Đóng modal (sử dụng jQuery
            $('#modal-coupon').modal('hide');
        });
    });
});


</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("search-input");
        const couponList = document.getElementById("coupon-list");
        const coupons = couponList.querySelectorAll("li");

        // Lắng nghe sự kiện nhập liệu
        searchInput.addEventListener("input", function () {
            const keyword = searchInput.value.toLowerCase();

            // Lọc danh sách coupon
            coupons.forEach(coupon => {
                const text = coupon.textContent.toLowerCase();
                if (text.includes(keyword)) {
                    coupon.style.display = ""; // Hiển thị
                } else {
                    coupon.style.display = "none"; // Ẩn
                }
            });
        });
    });
</script>

	<script src="/ValCT_Nhom5/assets2/js/bootstrap.bundle.min.js"></script>
</body>
</html>