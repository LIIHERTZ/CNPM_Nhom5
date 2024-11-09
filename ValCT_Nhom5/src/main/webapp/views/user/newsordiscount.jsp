<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ==========Banner-Section========== -->
	<section class="main-page-header speaker-banner bg_img"
		data-background="assets/images/banner/banner07.jpg">
		<div class="container">
			<div class="speaker-banner-content">
				<h2 class="title">News And Discount</h2>
				<ul class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/userHome">
							Home </a></li>
					<li>News And Discount</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->

	<!-- ==========Blog-Section========== -->
	<section class="blog-section padding-top padding-bottom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 mb-50 mb-lg-0">
					<article>
						<c:forEach items="${listNewsOrDiscount}" var="newsOrDiscount">
							<div class="post-item">
								<div class="post-thumb">
									<a
										href="${pageContext.request.contextPath}/usernewsOrDiscountDetail?id=${newsOrDiscount.newsID}">
										<c:choose>
											<c:when
												test="${newsOrDiscount.images.substring(0,5) != 'https'}">
												<c:url value="/image?fname=${newsOrDiscount.images}"
													var="imgUrl" />
											</c:when>
											<c:otherwise>
												<c:set var="imgUrl" value="${newsOrDiscount.images}" />
											</c:otherwise>
										</c:choose> <img src="${imgUrl}" alt="${newsOrDiscount.title}" style="width: 100%; height: 300px; object-fit: cover; border-radius: 10px;"/>
									</a>
								</div>
								<div class="post-content">
									<div class="post-header">
										<h4 class="title">
											<a
												href="${pageContext.request.contextPath}/usernewsOrDiscountDetail?id=${newsOrDiscount.newsID}">
												${newsOrDiscount.title} </a>
										</h4>
										<p>${newsOrDiscount.description}</p>
									</div>
									<div class="entry-content">
										<div class="left">
											<span class="date"> <fmt:formatDate
													value="${newsOrDiscount.date}" pattern="MMM dd, yyyy" />
												Bởi tác giả
											</span>
											<div class="authors">
<!-- 												<div class="thumb"> -->
<!-- 													<a href="#0"><img src="assets/images/blog/author.jpg" -->
<!-- 														alt="#0"></a> -->
<!-- 												</div> -->
												<h6 class="title">
													<a href="#0">${newsOrDiscount.author}</a>
												</h6>
											</div>
										</div>
										<a
											href="${pageContext.request.contextPath}/usernewsOrDiscountDetail?id=${newsOrDiscount.newsID}"
											class="buttons">Read More <i class="flaticon-right"></i></a>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 						<div class="post-item"> -->
						<!-- 							<div class="post-thumb"> -->
						<!-- 								<a href="blog-details.html"> <img -->
						<!-- 									src="assets/images/blog/blog04.jpg" alt="blog"> -->
						<!-- 								</a> -->
						<!-- 							</div> -->
						<!-- 							<div class="post-content"> -->
						<!-- 								<div class="post-header"> -->
						<!-- 									<h4 class="title"> -->
						<!-- 										<a href="blog-details.html"> Movie Ticket Prices: One Size -->
						<!-- 											Fits All? It's Time to Experiment </a> -->
						<!-- 									</h4> -->
						<!-- 									<div class="meta-post"> -->
						<!-- 										<a href="#0" class="mr-4"><i class="flaticon-conversation"></i>20 -->
						<!-- 											Comments</a> <a href="#0"><i class="flaticon-view"></i>466 -->
						<!-- 											View</a> -->
						<!-- 									</div> -->
						<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. -->
						<!-- 										Phasellus ac cursus leo. Nullam dolor nunc, hendrerit non -->
						<!-- 										velit id, pharetra viverra elit.</p> -->
						<!-- 								</div> -->
						<!-- 								<div class="entry-content"> -->
						<!-- 									<div class="left"> -->
						<!-- 										<span class="date">Dece 15, 2020 BY </span> -->
						<!-- 										<div class="authors"> -->
						<!-- 											<div class="thumb"> -->
						<!-- 												<a href="#0"><img src="assets/images/blog/author.jpg" -->
						<!-- 													alt="#0"></a> -->
						<!-- 											</div> -->
						<!-- 											<h6 class="title"> -->
						<!-- 												<a href="#0">Alvin Mcdaniel</a> -->
						<!-- 											</h6> -->
						<!-- 										</div> -->
						<!-- 									</div> -->
						<!-- 									<a href="#0" class="buttons">Read More <i -->
						<!-- 										class="flaticon-right"></i></a> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
					</article>
					<div class="pagination-area text-center">
						<a href="#0"><i class="fas fa-angle-double-left"></i><span>Prev</span></a>
						<a href="#0">1</a> <a href="#0">2</a> <a href="#0" class="active">3</a>
						<a href="#0">4</a> <a href="#0">5</a> <a href="#0"><span>Next</span><i
							class="fas fa-angle-double-right"></i></a>
					</div>
				</div>
				<div class="col-lg-4 col-sm-10 col-md-8">
					<aside>
						<div class="widget widget-search">
							<h5 class="title">search</h5>
							<form class="search-form">
								<input type="text" placeholder="Enter your Search Content"
									required>
								<button type="submit">
									<i class="flaticon-loupe"></i>Search
								</button>
							</form>
						</div>
						<div class="widget widget-post">
							<h5 class="title">latest post</h5>
							<div class="slider-nav">
								<span class="flaticon-angle-pointing-to-left widget-prev"></span>
								<span class="flaticon-right-arrow-angle widget-next active"></span>
							</div>
							<div class="widget-slider owl-carousel owl-theme">
								<div class="item">
									<div class="thumb">
										<a href="#0"> <img src="assets/images/blog/slider01.jpg"
											alt="blog">
										</a>
									</div>
									<div class="content">
										<h6 class="p-title">
											<a href="#0">Three Ways to Book Sporting Event Tickets</a>
										</h6>
										<div class="meta-post">
											<a href="#0" class="mr-4"><i class="flaticon-loupe"></i>20
												Comments</a> <a href="#0"><i class="flaticon-loupe"></i>466
												View</a>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="thumb">
										<a href="#0"> <img src="assets/images/blog/slider01.jpg"
											alt="blog">
										</a>
									</div>
									<div class="content">
										<h6 class="p-title">
											<a href="#0">Three Ways to Book Sporting Event Tickets</a>
										</h6>
										<div class="meta-post">
											<a href="#0" class="mr-4"><i class="flaticon-loupe"></i>20
												Comments</a> <a href="#0"><i class="flaticon-loupe"></i>466
												View</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Blog-Section========== -->

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
	<script src="assets/js/contact.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>