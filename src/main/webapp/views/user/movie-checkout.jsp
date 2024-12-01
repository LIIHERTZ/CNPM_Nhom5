<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%
    // ÃÂÃ¡ÂºÂ·t thÃ¡Â»Âi gian ÃÂÃ¡ÂºÂ¿m ngÃÂ°Ã¡Â»Â£c (5 phÃÂºt)
    int countdownMinutes = 5;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets2/css/bootstrap.min.css">

<body>


<!-- ==========Banner-Section========== -->
<c:url value="/image?fname=${movie.image}" var="movieImgUrl"></c:url>
<section class="details-banner hero-area bg_img"
         data-background="${movieImgUrl}" id="data-background-MV">
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
            <!-- NÃÂºt quay lÃ¡ÂºÂ¡i -->
            <div class="item md-order-1">
                <a href="${pageContext.request.contextPath}/userSelectSeats"
                   class="custom-button back-button"> <i
                        class="flaticon-double-right-arrows-angles"></i>back
                </a>
            </div>

            <!-- HiÃ¡Â»Ân thÃ¡Â»Â ngÃ y vÃ  giÃ¡Â»Â ÃÂÃÂ£ chÃ¡Â»Ân -->
            <div class="item date-item">
                <!-- HiÃ¡Â»Ân thÃ¡Â»Â startHour theo ÃÂÃ¡Â»Ânh dÃ¡ÂºÂ¡ng HH:mm, dd/MM/yyyy -->
                <c:if test="${not empty startHour}">
                    <fmt:formatDate value="${startHour}" pattern="HH:mm, dd/MM/yyyy"/>
                </c:if>
            </div>


            <!-- ÃÂÃ¡ÂºÂ¿m ngÃÂ°Ã¡Â»Â£c thÃ¡Â»Âi gian -->
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
					<div class="checkout-widget checkout-contact">
						<h5 class="title">Promo Code</h5>
						<form class="checkout-contact-form">
							<div class="form-group">
								<input type="text" placeholder="Please add promo code"
									id="selectedCouponName" name="selectedCouponName" readonly
									>
							</div>
							<!-- Input áº©n Äá» lÆ°u giÃ¡ trá» coupon -->
							 <input type="hidden"
								id="selectedCouponValue" name="selectedCouponValue">
							<div class="form-group">
								<!-- NÃºt Äá» má» modal -->
								<button type="button" data-bs-toggle="modal"
									class="custom-button" data-bs-target="#modal-coupon"
									style="width: 162px; height: 50px;">Add Coupon</button>
							</div>
						</form>
					</div>
					<div class="checkout-widget checkout-card mb-0">
						<h5 class="title">Payment Option</h5>
						<ul class="payment-option">
							<li class="active"><a href="#0"> <img
									src="assets/images/payment/card.png" alt="payment"> <span>VNPAY</span>
							</a></li>
						</ul>
						<form action="${pageContext.request.contextPath}/userMovieCheckout" method="post"
							  class="payment-card-form">
							<input type="hidden" id="amountPayable" name="amountPayable" value="${amountPayable != null ? amountPayable : totalPrice}">
							<input type="hidden" id="selectedCouponId" name="selectedCouponId">
							<div class="form-group">
								<!-- NÃºt submit sáº½ gá»i phÆ°Æ¡ng thá»©c POST -->
								<input type="submit" class="custom-button" value="Make Payment">
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
						<h4 class="title">booking summary</h4>
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
									<span>Tickets Price</span><span id="ticketPrice">${totalPrice}
										VND</span>
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
									<span>food & bevarage</span> <span id="popcornValue"> <!-- HiÃ¡Â»Ân thÃ¡Â»Â tÃ¡Â»Âng tiÃ¡Â»Ân Food & Beverage -->
										<c:choose>
											<c:when test="${not empty foodAndBeverageTotal}">
                        ${foodAndBeverageTotal}
                    </c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</span>
								</h6> <span class="info"> <!-- HiÃ¡Â»Ân thÃ¡Â»Â danh sÃÂ¡ch sÃ¡ÂºÂ£n phÃ¡ÂºÂ©m -->
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
					</div>
					<div class="proceed-area  text-center">
						<h6 class="subtitle">
							<span>Amount Payable</span> <span id="amountPayableValue">
								<c:choose>
									<c:when test="${not empty amountPayable}">
                ${amountPayable} VND
            </c:when>
									<c:otherwise>
                ${totalPrice} VND
            </c:otherwise>
								</c:choose>
							</span>
						</h6>
						<a href="${pageContext.request.contextPath}/userAddService"
							class="custom-button back-button">Add-Service</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ==========Movie-Section========== -->

	<!-- modal -->
	<div class="modal fade" id="modal-coupon" tabindex="-1"
		aria-labelledby="modal-user" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content"
				style="border-radius: 20px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);">
				<div class="modal-header"
					style="display: flex; justify-content: center;">
					<h5 class="modal-title" style="color: black">Chon Coupon</h5>
				</div>
				<div class="modal-body">
					<!-- Ã tÃ¬m kiáº¿m -->
					<input type="text" id="search-input"
						placeholder="Tim kiem coupon..."
						style="width: 100%; margin-bottom: 10px; padding: 5px; border: 1px solid #ccc; color: #007bff">

					<!-- Danh sÃ¡ch coupon -->
					<div
						style="max-height: 300px; overflow-y: auto; border: 1px solid #ddd; padding: 10px; background-color: #f8f9fa;">
						<ul class="list-group" id="coupon-list">
							<!-- Danh sÃ¡ch cÃ¡c coupon -->
							<c:forEach var="coupon" items="${coupons}">
								<li class="list-group-item">
									<button type="button" class="btn btn-link select-coupon"
										data-coupon-id="${coupon.couponID}"
										data-coupon-name="${coupon.couponName}"
										data-coupon-value="${coupon.couponValue}">
										${coupon.couponName} - ${coupon.couponValue}%</button>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="modal-footer"
					style="display: flex; justify-content: center;">
					<button type="button" class="btn btn-secondary custom-button"
						data-bs-dismiss="modal" style="width: 162px; height: 50px;">Close</button>
				</div>
			</div>
		</div>
	</div>




	<!-- end modal -->
	<script>
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
				window.location.href = "${pageContext.request.contextPath}/userSelectSeats";
			}
		}, 1000);
	</script>

	<script>
	//code thao
	document.addEventListener("DOMContentLoaded", function () {
    const couponButtons = document.querySelectorAll(".select-coupon");

    couponButtons.forEach(button => {
        button.addEventListener("click", function () {
            // Láº¥y thÃ´ng tin coupon tá»« dataset
            const couponId = this.getAttribute("data-coupon-id");
            const couponName = this.getAttribute("data-coupon-name");
            const couponValue = this.getAttribute("data-coupon-value");
			console.log( this.getAttribute("data-coupon-value"));
            // Gá»­i giÃ¡ trá» coupon Äáº¿n input áº©n
            document.getElementById("selectedCouponId").value = couponId;
            document.getElementById("selectedCouponValue").value = couponValue;
            document.getElementById("selectedCouponName").value = couponName;
            // Láº¥y giÃ¡ trá» totalPrice hiá»n táº¡i vÃ  loáº¡i bá» khoáº£ng tráº¯ng
            const ticketPriceElement = document.getElementById("ticketPrice");
            const ticketPriceText = ticketPriceElement.textContent.trim(); // Loáº¡i bá» khoáº£ng tráº¯ng thá»«a
            const ticketPrice = parseFloat(ticketPriceText.replace(/[^0-9.-]+/g, "")) || 0; // Chá» giá»¯ láº¡i sá»
            
            const popcornValueElement = document.getElementById("popcornValue");
            const popcornValueText = popcornValueElement.textContent.trim(); // Loáº¡i bá» khoáº£ng tráº¯ng thá»«a
            const popcornValue = parseFloat(popcornValueText.replace(/[^0-9.-]+/g, "")) || 0; // Chá» giá»¯ láº¡i sá»
            
            
            // TÃ­nh toÃ¡n sá» tiá»n giáº£m giÃ¡ vÃ  tá»ng tiá»n sau giáº£m giÃ¡
            const discountAmount = ((ticketPrice+popcornValue) * couponValue) / 100; // Sá» tiá»n giáº£m
            const updatedAmountPayable = (ticketPrice+popcornValue) - discountAmount; // Tá»ng tiá»n sau giáº£m

         // Cáº­p nháº­t sá» tiá»n giáº£m giÃ¡ vÃ  tá»ng tiá»n hiá»n thá»
            const totalPriceElement = document.getElementById("amountPayableValue");
            totalPriceElement.textContent = Math.round(updatedAmountPayable) + " VND";

			// cap nhat so tien hidden
			const totalPrice = document.getElementById("amountPayable");
			totalPrice.value = Math.round(updatedAmountPayable);
//
			const discountValueElement = document.getElementById("discountValue");
            discountValueElement.textContent = couponValue + "%"; // Cáº­p nháº­t giÃ¡ trá» giáº£m giÃ¡
            // ÄÃ³ng modal (sá»­ dá»¥ng jQuery
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

        // Láº¯ng nghe sá»± kiá»n nháº­p liá»u
        searchInput.addEventListener("input", function () {
            const keyword = searchInput.value.toLowerCase();

            // Lá»c danh sÃ¡ch coupon
            coupons.forEach(coupon => {
                const text = coupon.textContent.toLowerCase();
                if (text.includes(keyword)) {
                    coupon.style.display = ""; // Hiá»n thá»
                } else {
                    coupon.style.display = "none"; // áº¨n
                }
            });
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
	// Khi người dùng rời trang, trả lại ghế chưa thanh toán
	window.addEventListener("beforeunload", function () {
		fetch('/releaseSeat', {
			method: 'POST',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `selectedSeats=${selectedSeats}&screeningId=${screeningId}`
		});
	});

	</script>

	<script src="${pageContext.request.contextPath}/assets2/js/bootstrap.bundle.min.js"></script>
</body>
</html>