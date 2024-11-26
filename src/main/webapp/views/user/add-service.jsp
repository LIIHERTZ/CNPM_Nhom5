<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<!-- NÃºt quay láº¡i -->
				<div class="item md-order-1">
					<a href="${pageContext.request.contextPath}/userMovieCheckout"
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
					<div class="section-header-3">
						<span class="cate">You're hungry</span>
						<h2 class="title">we have food</h2>
						<p>Prebook Your Meal and Save More!</p>
					</div>
					<div class="grid--area">
						<ul class="filter">
							<li data-filter="*" class="active">all</li>
							<li data-filter=".combos">combos</li>
							<li data-filter=".beverage">beverage</li>
							<li data-filter=".popcorn">popcorn</li>

							<!-- <li><a href="/addService?type=all" class="active">All</a></li>
							<li><a href="/addService?type=combos">Combos</a></li>
							<li><a href="/addService?type=bevarage">Beverage</a></li>
							<li><a href="/addService?type=popcorn">Popcorn</a></li> -->

						</ul>
						<div class="grid-area">
							<c:forEach var="popcorn" items="${popcornList}">
								<div class="grid-item ${popcorn.typePopCorn.toLowerCase()}">
									<div class="grid-inner">
										<div class="grid-thumb">
											<img
												<%-- 											//dung xoa cai nay
												src="assets/images/movie/popcorn/pop${popcorn.popcornID}.png"
												alt="${popcorn.namePopCorn}"> --%>
																
												src="assets/images/movie/popcorn/${popcorn.typePopCorn.toLowerCase()}.jpg"
												alt="movie/popcorn">


											<div class="offer-tag">
												<fmt:formatNumber value="${popcorn.price}"
													pattern="#,##0 VND" />
											</div>
											<div class="offer-remainder">
												<h6 class="o-title mt-0">24%</h6>
												<span>off</span>
											</div>
										</div>
										<div class="grid-content">
											<h5 class="subtitle">
												<a href="#0">${popcorn.namePopCorn}</a>
											</h5>
											<form class="cart-button">
												<div class="cart-plus-minus">
													<input class="cart-plus-minus-box" type="text"
														name="qtybutton" value="1">
												</div>

												<!-- 												//dung xoa
												<form class="cart-button" method="post" action="/addToCart">
												<div class="cart-plus-minus">
													<input class="cart-plus-minus-box" type="text"
														name="qtybutton" value="1">
												</div> -->


												<%-- 												//dung xoa cai nay
												<input type="hidden" name="popcornID"
													value="${popcorn.popcornID}"> --%>

												<button type="button" class="custom-button"
													onclick="addToBookingSummary('${popcorn.namePopCorn}', ${popcorn.price}, this)">
													Add</button>
											</form>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
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
									<span>food & bevarage</span><span></span>
								</h6> <span class="info"></span>
							</li>
							<li>
								<h6 class="subtitle">
									<span>discount coupon</span><span>$0</span>
								</h6>
							</li>
						</ul>
						<%-- 						<ul>
							<li><span class="info"><span>price</span><span>${totalPrice}
										VND</span></span></li>
						</ul> --%>
					</div>
					<div class="proceed-area  text-center">
						<h6 class="subtitle">
							<span>Amount Payable</span><span>${totalPrice} VND</span>
						</h6>

						<form id="proceedForm" action="${pageContext.request.contextPath}/userAddService"
							method="post" onsubmit="prepareProceedForm()">
							 <input type="hidden"
								name="foodAndBeverageTotal" id="foodAndBeverageTotal" />
							<input
								type="hidden" name="amountPayable" id="amountPayable" />
							<button type="submit" class="custom-button back-button">Proceed</button>
						</form>

					</div>
					<div class="note">
						<h5 class="title">Note :</h5>
						<p>Please give us 15 minutes for ValCT preparation once you're
							at the cinema</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ==========Movie-Section========== -->

	<script>
		// Giáº£ sá»­ thá»i gian Äáº¿m ngÆ°á»£c lÃ  5 phÃºt (5 * 60 = 300 giÃ¢y)
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
				window.location.href = "${pageContext.request.contextPath}/userMovieCheckout";// Dá»«ng Äáº¿m ngÆ°á»£c khi háº¿t thá»i gian
			}
		}, 1000);
		
		
		
		// Biáº¿n lÆ°u danh sÃ¡ch sáº£n pháº©m trong Booking Summary
	    let bookingSummary = [];
			
	    let initialTotalPrice = parseInt("${totalPrice}".replace(/\D/g, "")); // Tá»ng tiá»n ban Äáº§u (tickets price)
	    let currentTotalPrice = initialTotalPrice; // GiÃ¡ trá» hiá»n táº¡i cá»§a tá»ng tiá»n
	    

	    function addToBookingSummary(name, price, button) {
	        const qtyInput = button.parentElement.querySelector(".cart-plus-minus-box");
	        const quantity = parseInt(qtyInput.value);

	        // TÃ¬m xem sáº£n pháº©m ÄÃ£ cÃ³ trong bookingSummary chÆ°a
	        const existingProduct = bookingSummary.find(item => item.name === name);

	        if (existingProduct) {
	            // Náº¿u sáº£n pháº©m ÄÃ£ tá»n táº¡i, tÄng sá» lÆ°á»£ng
	            existingProduct.quantity += quantity;
	            existingProduct.totalPrice += price * quantity;
	        } else {
	            // Náº¿u sáº£n pháº©m chÆ°a tá»n táº¡i, thÃªm má»i vÃ o danh sÃ¡ch
	            bookingSummary.push({
	                name: name,
	                price: price,
	                quantity: quantity,
	                totalPrice: price * quantity,
	            });
	        }

	        // Cáº­p nháº­t tá»ng tiá»n
	        currentTotalPrice += price * quantity;

	        // Cáº­p nháº­t láº¡i giao diá»n
	        updateBookingSummary();
	    }

	    function updateBookingSummary() {
	    	const bookingListElement = document.querySelector(".side-shape .info"); 
	        const totalAmountElement = document.querySelector(".proceed-area .subtitle span:last-child");
	        
	        const foodAndBeverageTotalElement = document.querySelector(".side-shape .subtitle span:nth-child(2)"); // Pháº§n tá»­ chá»©a tá»ng tiá»n food & beverage
	        
	        
	        let dynamicContent = "";
	        
	        let foodAndBeverageTotal = 0;

	        // Render cÃ¡c sáº£n pháº©m trong bookingSummary
	         bookingSummary.forEach(item => {
        dynamicContent += 
            '<span>' + item.quantity +' '+ item.name +' '+ item.totalPrice + ' VND</span>';
        foodAndBeverageTotal += item.totalPrice;
    });
	        
	      // Thay tháº¿ ná»i dung Äá»ng trong pháº§n info
	         bookingListElement.innerHTML = dynamicContent;
	      
	      // Cáº­p nháº­t tá»ng tiá»n food & beverage
	         foodAndBeverageTotalElement.textContent = foodAndBeverageTotal + " VND";

	        // Cáº­p nháº­t tá»ng tiá»n
	        totalAmountElement.textContent = currentTotalPrice + " VND";
	    }
		
		
	    function prepareProceedForm() {
	        const form = document.getElementById("proceedForm");


	        // Láº·p qua danh sÃ¡ch sáº£n pháº©m (bookingSummary) vÃ  thÃªm input áº©n
	        bookingSummary.forEach((item, index) => {
	        		        	        	            
	        	// Input cho tÃªn sáº£n pháº©m
	            const nameInput = document.createElement("input");
	            nameInput.type = "hidden";
	            nameInput.name = 'product[' + index + '].name';
	            nameInput.value = item.name;
	            nameInput.classList.add("product-input");
	            form.appendChild(nameInput);

	            // Input cho sá» lÆ°á»£ng sáº£n pháº©m
	            const quantityInput = document.createElement("input");
	            quantityInput.type = "hidden";
	            quantityInput.name = 'product[' + index + '].quantity';
	            quantityInput.value = item.quantity;
	            quantityInput.classList.add("product-input");
	            form.appendChild(quantityInput);

	            // Input cho tá»ng tiá»n sáº£n pháº©m
	            const totalPriceInput = document.createElement("input");
	            totalPriceInput.type = "hidden";
	            totalPriceInput.name = 'product[' + index + '].totalPrice';
	            totalPriceInput.value = item.totalPrice;
	            totalPriceInput.classList.add("product-input");
	            form.appendChild(totalPriceInput);
	        });

	        // Input cho tá»ng tiá»n Food & Beverage
	        const foodAndBeverageTotalInput = document.getElementById("foodAndBeverageTotal");
	        const foodAndBeverageTotal = document.querySelector(".side-shape .subtitle span:nth-child(2)").textContent.trim();
	        foodAndBeverageTotalInput.value = foodAndBeverageTotal;

	        // Input cho tá»ng tiá»n chung
	        const amountPayableInput = document.getElementById("amountPayable");
	        amountPayableInput.value = currentTotalPrice;
	    }

		
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