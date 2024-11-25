<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/odometer.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<title>Boleto - Online Ticket Booking Website HTML Template</title>
</head>
<body>
	<!-- ==========Banner-Section========== -->
	<section class="details-banner bg_img"
		data-background="assets/images/banner/banner03.jpg">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-thumb">
					<img src="assets/images/movie/venus.jpg" alt="movie"> <a
						href="https://www.youtube.com/watch?v=j9aNzRFaZ5I"
						class="video-popup"> <img
						src="assets/images/movie/video-button.png" alt="movie">
					</a>
				</div>
				<div class="details-banner-content offset-lg-3">
					<h3 class="title">${movie.movieName}</h3>
					<div class="tags">
						<a href="#0">Vietnamese</a> <a href="#0">English</a>
					</div>
					<a href="#0" class="button">Action</a>
					<div class="social-and-duration">
						<div class="duration-area">
							<div class="item">
								<i class="far fa-clock"></i><span>${movie.movieDuration}</span>
							</div>
						</div>
						<ul class="social-share">
							<li><a href="#0"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#0"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#0"><i class="fab fa-pinterest-p"></i></a></li>
							<li><a href="#0"><i class="fab fa-linkedin-in"></i></a></li>
							<li><a href="#0"><i class="fab fa-google-plus-g"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->

	<!-- ==========Book-Section========== -->
	<section class="book-section bg-one">
		<div class="container">
			<div class="book-wrapper offset-lg-3">
				<div class="left-side">
					<div class="item">
						<div class="item-header">
							<div class="thumb">
								<img src="assets/images/movie/tomato2.png" alt="movie">
							</div>
							<div class="counter-area">
								<span class="counter-item odometer" data-odometer-final="86">0</span>
							</div>
						</div>
						<p>tomatometer</p>
					</div>
					<div class="item">
						<div class="item-header">
							<div class="thumb">
								<img src="assets/images/movie/cake2.png" alt="movie">
							</div>
							<div class="counter-area">
								<span class="counter-item odometer" data-odometer-final="91">0</span>
							</div>
						</div>
						<p>audience Score</p>
					</div>
					<div class="item">
						<div class="item-header">
							<h5 class="title">${movie.rating}</h5>
							<div class="rated">
								<i class="fas fa-heart"></i> <i class="fas fa-heart"></i> <i
									class="fas fa-heart"></i> <i class="fas fa-heart"></i> <i
									class="fas fa-heart"></i>
							</div>
						</div>
						<p>Rating</p>
					</div>
				</div>
				<a href="#0" class="custom-button">book tickets</a>
			</div>
		</div>
	</section>
	<!-- ==========Book-Section========== -->

	<!-- ==========Movie-Section========== -->
	<section class="movie-details-section padding-top padding-bottom">
		<div class="container">
			<div class="row justify-content-center flex-wrap-reverse mb--50">
				<div class="col-lg-12 mb-50">
					<div class="movie-details">
						<div class="tab summery-review">
							<ul class="tab-menu">
								<li class="active" onclick="openTab(event, 'summery')">summery</li>
								<li onclick="openTab(event, 'review')">review <span>${count}</span></li>
								<li onclick="openTab(event, 'post-review')">post review</li>
							</ul>
							<div class="tab-area">
								<div id="summery" class="tab-item active">
									<!-- Nội dung phần tóm tắt của bạn không thay đổi -->
									<div class="item" style="margin-top: 20px;">
										<h5 class="sub-title">description</h5>
										<p>${movie.description}</p>
									</div>
								</div>

								<div id="review" class="tab-item" style="margin-top: 20px;">
									<!-- Khu vực review ban đầu (hiển thị 3 review đầu tiên) -->
									<div class="review-list" id="review-list">
										<c:forEach var="review" items="${reviews}">
											<div class="movie-review-item">
												<div class="author">
													<div class="thumb">
														<img
															src="${pageContext.request.contextPath}/assets2/img/user.svg"
															alt="cast">
													</div>
													<div class="movie-review-info">
														<span class="reply-date">from
															${review.person.region}</span>
														<h6 class="subtitle">${review.person.fullName}</h6>
														<span><i class="fas fa-check"></i> verified review</span>
													</div>
												</div>
												<div class="movie-review-content">
													<div class="review">
														<c:forEach begin="1" end="${review.evaluate}">
															<i class="flaticon-favorite-heart-button"></i>
														</c:forEach>
													</div>
													<p>${review.content}</p>
												</div>
											</div>
										</c:forEach>
									</div>
									<div class="load-more text-center">
										<button id="load-more" class="custom-button transparent">Load
											More</button>
									</div>
								</div>


								<div id="post-review" class="tab-item" style="margin-top: 20px;">
									<!-- Phần form post review của bạn không thay đổi -->
									<div class="post-review-form"
										style="background-color: #1b1e3d; padding: 20px; border-radius: 10px;">
										<form method="post"
											action="${pageContext.request.contextPath}/userReview">
											<input type="hidden" name="action" value="addReview">
											<div class="form-group">
												<label for="rating" style="color: #ffffff; font-size: 1em;">Rating:</label>
												<select id="rating" name="rating" class="form-control"
													required
													style="background-color: #283149; color: #ffffff; border: 1px solid #00d1b2; border-radius: 5px; padding: 10px; height: 40px; line-height: 1.5; font-size: 14px;">
													<option value="">Select Rating</option>
													<option value="1">Poor</option>
													<option value="2">Fair</option>
													<option value="3">Good</option>
													<option value="4">Very Good</option>
													<option value="5">Excellent</option>
												</select>
											</div>
											<div class="form-group" style="margin-top: 15px;">
												<label for="review-text"
													style="color: #ffffff; font-size: 1em;">Your
													Review:</label>
												<textarea id="review-text" name="review_text"
													class="form-control" rows="3" required
													style="background-color: #283149; color: #ffffff; border: 1px solid #00d1b2; border-radius: 5px; padding: 10px;"></textarea>
											</div>
											<div class="form-group text-center" style="margin-top: 20px;">
												<button type="submit"
													style="padding: 8px 16px; font-size: 14px; background: linear-gradient(45deg, #ff416c, #ff4b2b); color: #ffffff; border: none; border-radius: 5px; cursor: pointer; display: inline-block; width: auto;">Submit
													Review</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				</div>
			</div>
		</div>
		
	</section>
	
	
	<!-- ==========Movie-Section========== -->

	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/js/modernizr-3.6.0.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<script src="assets/js/magnific-popup.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/countdown.min.js"></script>
	<script src="assets/js/odometer.min.js"></script>
	<script src="assets/js/viewport.jquery.js"></script>
	<script src="assets/js/nice-select.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>