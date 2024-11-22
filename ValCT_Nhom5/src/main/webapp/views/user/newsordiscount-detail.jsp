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
				<h2 class="title">News Or Discount Detail</h2>
				<ul class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/userHome">
							Home </a></li>
					<li><a
						href="${pageContext.request.contextPath}/usernewsOrDiscounts">News
							Or Discount</a></li>
					<li>blog single</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->

	<!-- ==========Blog-Section========== -->
	<section class="blog-section padding-top padding-bottom">
		<div class="container">
			<div class="row justify-content-center mb-30-none">
				<div class="col-lg-8 mb-50 mb-lg-0">
					<article>
						<div class="post-item post-details">
							<div class="post-thumb">
								<c:choose>
									<c:when
										test="${newsOrDiscount.images.substring(0,5) != 'https'}">
										<c:url value="/image?fname=${newsOrDiscount.images}"
											var="imgUrl" />
									</c:when>
									<c:otherwise>
										<c:set var="imgUrl" value="${newsOrDiscount.images}" />
									</c:otherwise>
								</c:choose>
								<img src="${imgUrl}" alt="${newsOrDiscount.title}"
									style="width: 100%; height: 400px; object-fit: cover; border-radius: 10px;">
							</div>
							<div class="post-content">

								<div class="content">
									<div class="entry-content p-0">
										<div class="left">
											<span class="date"> <fmt:formatDate
													value="${newsOrDiscount.date}" pattern="MMM dd, yyyy" />
											</span>
										</div>
									</div>
									<div class="post-header">
										<h4 class="m-title">${newsOrDiscount.title}</h4>
										<p>${newsOrDiscount.description}</p>
										<blockquote>${newsOrDiscount.detail}</blockquote>
										
										
									</div>
									<!-- 									<div class="post-meta text-center"> -->
									<!-- 										<div class="item"> -->
									<%-- 											<label>Bởi tác giả: ${newsOrDiscount.author}</label> --%>
									<!-- 										</div> -->
									<!-- 									</div> -->
									

								</div>
								<div class="col-3,5 text-center">
										<div class="item"
											style="text-align: center; display: flex; justify-content: center; padding : 10px">
											<span> Bởi tác giả: ${newsOrDiscount.author}</span>
										</div>
									</div>
							</div>
						</div>
					</article>
				</div>
				<div class="col-lg-4 col-sm-10 col-md-8">
					<aside>
<!-- 						<div class="widget widget-search"> -->
<!-- 							<h5 class="title">search</h5> -->
<!-- 							<form class="search-form"> -->
<!-- 								<input type="text" placeholder="Enter your Search Content" -->
<!-- 									required> -->
<!-- 								<button type="submit"> -->
<!-- 									<i class="flaticon-loupe"></i>Search -->
<!-- 								</button> -->
<!-- 							</form> -->
<!-- 						</div> -->
						<div class="widget widget-post">
							<h5 class="title">latest post</h5>
							<div class="slider-nav">
								<span class="flaticon-angle-pointing-to-left widget-prev"></span>
								<span class="flaticon-right-arrow-angle widget-next active"></span>
							</div>
							<div class="widget-slider owl-carousel owl-theme">
								<c:forEach items="${listNewsOrDiscount}" var="newsOrDiscount">
									<div class="item">
										<div class="thumb">
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
												</c:choose> <img src="${imgUrl}" alt="${newsOrDiscount.title}"
												style="width: 100%; height: 300px; object-fit: cover; border-radius: 10px;" />
											</a>
										</div>
										<div class="content">
											<h6 class="p-title">
												<a
													href="${pageContext.request.contextPath}/usernewsOrDiscountDetail?id=${newsOrDiscount.newsID}">
													${newsOrDiscount.title} </a>
											</h6>
											<div class="meta-post">
												<a href="#0"><i class="flaticon-user"></i>
													${newsOrDiscount.author}</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Blog-Section========== -->

</body>
</html>