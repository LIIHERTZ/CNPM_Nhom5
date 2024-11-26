<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

</head>
<body>
	<style>
/* CSS cho toàn bộ trang */
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #0b1121; /* Nền tối */
	color: #ffffff; /* Chữ màu sáng */
	line-height: 1.6;
}

h1 {
	text-align: center;
	font-size: 2.5rem;
	margin: 20px 0;
	color: #ffffff;
}

/* Bộ lọc phim */
.filter-bar {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin: 20px auto;
	padding: 10px 20px;
	background-color: #172a46;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
	max-width: 600px;
}

.filter-bar a {
	text-decoration: none;
	padding: 10px 25px;
	color: #fff;
	background-color: #3498db; /* Xanh dương */
	border-radius: 25px;
	font-size: 16px;
	font-weight: bold;
	transition: all 0.3s ease;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.filter-bar a.active {
	background-color: #f39c12; /* Vàng cam cho nút đang được chọn */
	box-shadow: 0 4px 10px rgba(243, 156, 18, 0.5);
}

.filter-bar a:hover {
	background-color: #2980b9; /* Xanh dương đậm hơn khi hover */
	transform: translateY(-3px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}

/* Grid layout cho danh sách phim */
.movie-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	padding: 20px;
	max-width: 1200px;
	margin: 0 auto;
}

.movie-card {
	background-color: #172a46;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
	overflow: hidden;
	text-align: center;
	padding: 10px;
	position: relative;
	transition: transform 0.3s, box-shadow 0.3s;
}

.movie-card:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.7);
}

.movie-card img {
	width: 100%;
	border-bottom: 3px solid #f39c12;
	height: 320px;
	object-fit: cover;
}

.movie-card h2 {
	font-size: 18px;
	margin: 10px 0 5px;
	text-transform: uppercase;
	color: #ffffff;
}

.movie-card p {
	margin: 5px 0;
	font-size: 14px;
	color: #d3d3d3;
}

.btn-group {
	display: flex;
	justify-content: space-between; /* Căn đều các nút */
	gap: 10px; /* Khoảng cách giữa các nút */
	margin-top: 10px;
}

.btn-group button, .btn-group a {
	flex: 1; /* Các nút sẽ chia đều khoảng cách */
	display: inline-block;
	text-align: center;
	padding: 10px 20px;
	font-size: 14px;
	font-weight: bold;
	text-transform: uppercase;
	color: #ffffff;
	border-radius: 20px;
	transition: all 0.3s ease;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	border: none;
}

/* Nút Buy Ticket */
.btn-buy {
	background: linear-gradient(45deg, #e74c3c, #c0392b); /* Gradient đỏ */
}

.btn-buy:hover {
	background: linear-gradient(45deg, #c0392b, #a93226);
	transform: translateY(-3px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}

/* Nút Detail */
.btn-detail {
	background-color: #f39c12; /* Màu vàng cam */
	color: #fff;
}

.btn-detail:hover {
	background-color: #e67e22;
	transform: translateY(-3px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}
</style>
	<section class="movie-section padding-top padding-bottom">
		<h1>${pageTitle}</h1>

		<!-- Thanh bộ lọc phim -->
		<div class="filter-bar">
			<a href="?filter=showing"
				class="${param.filter == 'showing' ? 'active' : ''}">Phim Đang
				Chiếu</a> <a href="?filter=comingSoon"
				class="${param.filter == 'comingSoon' ? 'active' : ''}">Phim Sắp
				Chiếu</a> <a href="${pageContext.request.contextPath}/userMovieList"
				class="${empty param.filter ? 'active' : ''}">Tất Cả Phim</a>
		</div>

		<!-- Hiển thị danh sách phim -->
		<div class="movie-grid">
			<c:forEach var="movie" items="${movies}">
				<div class="movie-card">
					<!-- Hình ảnh -->
					<c:choose>
						<c:when test="${movie.image.substring(0,5) != 'https'}">
							<c:url value="/image?fname=${movie.image}" var="imgUrl" />
						</c:when>
						<c:otherwise>
							<c:set var="imgUrl" value="${movie.image}" />
						</c:otherwise>
					</c:choose>
					<img src="${imgUrl}" alt="${movie.movieName}">
					<!-- Tên phim -->
					<h2>${movie.movieName}</h2>

					<!-- Thông tin -->
					<p>
						<strong>Thể loại:</strong> ${movie.category}
					</p>
					<p>
						<strong>Thời lượng:</strong> ${movie.movieDuration}
					</p>
					<p>
						<strong>Khởi chiếu:</strong>
						<fmt:formatDate value="${movie.releaseDay}" pattern="dd/MM/yyyy" />
					</p>
					<div class="btn-group">
						<button class="btn-buy"
							onclick="location.href='${pageContext.request.contextPath}/bookTickets?movieId=${movie.movieID}'">🎟️
							Buy Ticket</button>
						<a
							href="${pageContext.request.contextPath}/movieDetail?id=${movie.movieID}"
							class="btn-detail">🔍 Detail</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<body>


	<!-- ==========Movie-Section========== -->
	<section class="movie-section padding-top padding-bottom">
		<div class="container">
			<div class="row flex-wrap-reverse justify-content-center">
				<div class="col-lg-9 mb-50 mb-lg-0">
					<div class="filter-tab tab">
						<div class="filter-area">
							<div class="filter-main">
								<div class="left">
									<div class="item">
										<span class="show">Show :</span> <select class="select-bar">
											<option value="12">12</option>
											<option value="15">15</option>
											<option value="18">18</option>
											<option value="21">21</option>
											<option value="24">24</option>
											<option value="27">27</option>
											<option value="30">30</option>
										</select>
									</div>
									<div class="item">
										<span class="show">Sort By :</span> <select class="select-bar">
											<option value="showing">now showing</option>
											<option value="exclusive">exclusive</option>
											<option value="trending">trending</option>
											<option value="most-view">most view</option>
										</select>
									</div>
								</div>
								<ul class="grid-button tab-menu">
									<li><i class="fas fa-th"></i></li>
									<li class="active"><i class="fas fa-bars"></i></li>
								</ul>
							</div>
						</div>
						<div class="tab-area">
							<div class="tab-item">
								<div class="row mb-10 justify-content-center">
									<c:forEach var="movie" items="${movies}">
										<div class="col-sm-6 col-lg-4">
											<div class="movie-grid">
												<div class="movie-thumb c-thumb">
													<c:choose>
														<c:when test="${movie.image.substring(0,5) != 'https'}">
															<c:url value="/image?fname=${movie.image}" var="imgUrl" />
														</c:when>
														<c:otherwise>
															<c:set var="imgUrl" value="${movie.image}" />
														</c:otherwise>
													</c:choose>
													<a
														href="${pageContext.request.contextPath}/bookTickets?movieId=${movie.movieID}">
														<img src="${imgUrl}" alt="${movie.movieName}"
														class="movie-img">
													</a>
												</div>

												<div class="movie-content bg-one">
													<h5 class="title m-0">
														<a
															href="${pageContext.request.contextPath}/bookTickets?movieId=${movie.movieID}">${movie.movieName}</a>
													</h5>
													<ul class="movie-action-list">
														<li><a
															href="${pageContext.request.contextPath}/bookTickets?movieId=${movie.movieID}"
															class="btn btn-primary">Book Ticket</a></li>
														<li><a
															href="${pageContext.request.contextPath}/userReview?movieID=${movie.movieID}"
															class="btn btn-secondary btn-detail">🔍 Detail</a></li>
													</ul>
												</div>

											</div>
										</div>
									</c:forEach>

									<style>
.movie-img {
	width: 280px; /* Đặt chiều rộng cố định */
	height: 300px; /* Đặt chiều cao cố định */
	object-fit: cover; /* Đảm bảo ảnh không bị méo, sẽ cắt xén nếu cần */
}

.movie-grid {
	width: 280px; /* Chiều rộng cố định */
	height: 430px; /* Chiều cao cố định */
	background-color: #12234e; /* Màu nền */
	margin: 15px; /* Khoảng cách giữa các khung */
	border-radius: 10px; /* Bo góc khung phim */
	overflow: hidden; /* Ẩn nội dung vượt khung */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Đổ bóng */
	display: flex;
	flex-direction: column; /* Sắp xếp các thành phần theo chiều dọc */
	align-items: center; /* Căn giữa theo chiều ngang */
	justify-content: space-between;
	/* Căn đều các thành phần theo chiều dọc */
}

.movie-thumb {
	width: 100%;
	display: flex;
	justify-content: center; /* Căn giữa ảnh */
}

.movie-img {
	width: 280px; /* Đặt chiều rộng cố định */
	height: 300px; /* Đặt chiều cao cố định */
	object-fit: cover; /* Đảm bảo ảnh không bị méo, sẽ cắt xén nếu cần */
}

.movie-content {
	padding: 10px; /* Khoảng cách nội dung bên trong */
	color: #fff; /* Màu chữ */
	font-size: 14px; /* Kích thước chữ */
}

.movie-content h5 {
	font-size: 18px; /* Cỡ chữ lớn cho tiêu đề */
	font-weight: bold; /* Chữ in đậm */
	margin-bottom: 10px; /* Khoảng cách bên dưới tiêu đề */
}

.movie-content ul {
	display: flex; /* Hiển thị các icon xếp ngang */
	list-style: none; /* Bỏ dấu đầu dòng */
	padding: 0; /* Loại bỏ padding */
	margin: 10px 0 0; /* Khoảng cách phía trên */
	justify-content: center; /* Căn giữa các mục */
}

.movie-content ul li {
	display: flex;
	align-items: center; /* Căn giữa theo chiều ngang */
	margin-right: 15px; /* Khoảng cách giữa các mục */
	margin-bottom: 10px;
}
}
</style>
								</div>
							</div>
							<div class="tab-item active">
								<div class="movie-area mb-10">
									<c:forEach var="movie" items="${movies}">
										<div class="movie-list">
											<div class="movie-thumb c-thumb">
												<c:choose>
													<c:when test="${movie.image.substring(0,5) != 'https'}">
														<c:url value="/image?fname=${movie.image}" var="imgUrl" />
													</c:when>
													<c:otherwise>
														<c:set var="imgUrl" value="${movie.image}" />
													</c:otherwise>
												</c:choose>
												<a
													href="${pageContext.request.contextPath}/bookTickets?movieId=${movie.movieID}">
													<img src="${imgUrl}" alt="${movie.movieName}"
													class="movie-img">
												</a>
												
											</div>
											<div class="movie-content bg-one">
												<h5 class="title">
													<a href="movie-details.html">${movie.movieName}</a>
												</h5>
												
												<p class="duration"><strong>Thời lượng:</strong> ${movie.movieDuration}</p>
												<p>
													<strong>Thể loại:</strong> ${movie.category}
												</p>
												<p>
													<strong>Khởi chiếu:</strong>
													<fmt:formatDate value="${movie.releaseDay}"
														pattern="dd/MM/yyyy" />
												</p>
												<ul class="movie-rating-percent">
													<li>
														<div class="thumb">
															<img
																src="${pageContext.request.contextPath}/assets/images/movie/tomato.png"
																alt="movie">
														</div> <span class="content">88%</span>
													</li>
													<li>
														<div class="thumb">
															<img
																src="${pageContext.request.contextPath}/assets/images/movie/cake.png"
																alt="movie">
														</div> <span class="content">88%</span>
													</li>
												</ul>
												<div class="book-area">
													<div class="book-ticket">
														<div class="react-item mr-auto">
															<a href="${pageContext.request.contextPath}/bookTickets?movieId=${movie.movieID}">
																<div class="thumb">
																	<img
																		src="${pageContext.request.contextPath}/assets/images/icons/book.png"
																		alt="icons">
																</div> <span>book ticket</span>
															</a>
														</div>
														<div class="react-item mr-auto">
															<a href="${pageContext.request.contextPath}/userReview?movieID=${movie.movieID}">
																<div class="thumb">
																	<img
																		src="${pageContext.request.contextPath}/assets/images/icons/play-button.png"
																		alt="icons">
																</div> <span>Movie Detail</span>
															</a>
														</div>
														<p>Movie Trailer: ${movie.movieTrailer}</p>
														<div class="react-item">
															<a href="${movie.movieTrailer}" class="video-popup">
																<div class="thumb">
																	<img
																		src="${pageContext.request.contextPath}/assets/images/icons/heart.png"
																		alt="icons">
																</div> <span>watch trailer</span>
															</a>
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									
								</div>
							</div>
						</div>
						<div class="pagination-area text-center">
							<a href="#0"><i class="fas fa-angle-double-left"></i><span>Prev</span></a>
							<a href="#0">1</a> <a href="#0">2</a> <a href="#0" class="active">3</a>
							<a href="#0">4</a> <a href="#0">5</a> <a href="#0"><span>Next</span><i
								class="fas fa-angle-double-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Movie-Section========== -->
	




	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/modernizr-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/odometer.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/viewport.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/nice-select.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>


<!-- Mirrored from pixner.net/boleto/demo/movie-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 06:26:33 GMT -->
</html>