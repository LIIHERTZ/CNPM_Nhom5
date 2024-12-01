<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<body>
	<!-- ==========Preloader========== -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ==========Preloader========== -->

	<!-- ==========Movie-Section========== -->
	<section class="movie-section padding-top padding-bottom">
		<div class="container">
			<div class="row flex-wrap-reverse justify-content-center">
				<div class="col-lg-11 mb-50 mb-lg-0">
					<div class="filter-tab tab">
						<div class="filter-area">
							<div class="filter-main">
								<div class="left">

									<div class="item">
										<span class="show">Sort By :</span> <select class="select-bar"
											onchange="location = this.value;">
											<option value="?filter=showing"
												${param.filter == 'showing' ? 'selected' : ''}>Phim
												Đang Chiếu</option>
											<option value="?filter=comingSoon"
												${param.filter == 'comingSoon' ? 'selected' : ''}>Phim
												Sắp Chiếu</option>
											<option
												value="${pageContext.request.contextPath}/userMovieList"
												${empty param.filter ? 'selected' : ''}>Tất Cả Phim
											</option>
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
														href="${pageContext.request.contextPath}/userReview?movieID=${movie.movieID}">
														<img src="${imgUrl}" alt="${movie.movieName}"
														class="movie-img">
													</a>
												</div>

												<div class="movie-content bg-one">
													<h5 class="title m-0">
														<a
															href="${pageContext.request.contextPath}/userReview?movieID=${movie.movieID}">${movie.movieName}</a>
													</h5>

													<ul class="movie-action-list">
														<div>
															<a
																href="${pageContext.request.contextPath}/userBookTickets?movieId=${movie.movieID}"
																class="custom-button"> <i
																class="bi bi-ticket-perforated-fill"></i> Book Ticket
															</a>
														</div>

														<div>
															<a
																href="${pageContext.request.contextPath}/userReview?movieID=${movie.movieID}"
																class=" custom-button flaticon-loupe">Detail</a>
														</div>
													</ul>
												</div>
												<br>

											</div>
										</div>
									</c:forEach>

									<style>
.custom-button {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.movie-img {
	width: 280px; /* Đặt chiều rộng cố định */
	height: 300px; /* Đặt chiều cao cố định */
	object-fit: cover; /* Đảm bảo ảnh không bị méo, sẽ cắt xén nếu cần */
}

.movie-grid {
	width: 350px; /* Chiều rộng cố định */
	height: 430px; /* Chiều cao cố định */
	background-color: #12234e; /* Màu nền */
	margin: 10px; /* Khoảng cách giữa các khung */
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
	margin-right: 25px; /* Khoảng cách giữa các mục */
	margin-bottom: 10px;
}

.movie-action-list>div {
	margin-right: 15px; /* Khoảng cách giữa các thẻ theo chiều ngang */
	display: inline-block; /* Đảm bảo các thẻ đứng cạnh nhau */
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
													href="${pageContext.request.contextPath}/userReview?movieID=${movie.movieID}">
													<img src="${imgUrl}" alt="${movie.movieName}"
													class="movie-img">
												</a>

											</div>
											<div class="movie-content bg-one">
												<h5 class="title">
													<a
														href="<c:choose>
                                                            <c:when test='${not empty sessionScope.person}'>
                                                            ${pageContext.request.contextPath}/review?movieID=${movie.movieID}&perID=${person.perID}
                                                            </c:when>
                                                            <c:otherwise>
                                                            ${pageContext.request.contextPath}/review?movieID=${movie.movieID}
                                                            </c:otherwise>
                                                            </c:choose>">
														${movie.movieName} </a>
												</h5>

												<p class="duration">
													<strong>Thời lượng:</strong> ${movie.movieDuration}
												</p>

												<ul class="movie-rating-percent">
													<li>
														<div class="thumb">
															<img
																src="${pageContext.request.contextPath}/assets/images/movie/tomato.png"
																alt="movie">
														</div> <span class="content"><strong>Thể loại:</strong>
															${movie.category}</span>
													</li>
													<li>
														<div class="thumb">
															<img
																src="${pageContext.request.contextPath}/assets/images/movie/cake.png"
																alt="movie">
														</div> <span class="content"> <strong>Khởi
																chiếu:</strong> <fmt:formatDate value="${movie.releaseDay}"
																pattern="dd/MM/yyyy" />
													</span>
													</li>
												</ul>
												<div class="book-area">
													<div class="book-ticket">
														<div class="react-item mr-auto">
															<a
																href="${pageContext.request.contextPath}/userBookTickets?movieId=${movie.movieID}">
																<div class="thumb">
																	<img
																		src="${pageContext.request.contextPath}/assets/images/icons/book.png"
																		alt="icons">
																</div> <span>book ticket</span>
															</a>
														</div>
														<div class="react-item mr-auto">
															<a
																href="${pageContext.request.contextPath}/userReview?movieID=${movie.movieID}">
																<div class="thumb">
																	<img
																		src="${pageContext.request.contextPath}/assets/images/icons/play-button.png"
																		alt="icons">
																</div> <span>Movie Detail</span>
															</a>
														</div>
														<div class="react-item">
															<c:choose>
																<c:when test="${not empty movie.movieTrailer}">
																	<a href="${movie.movieTrailer}" class="video-popup"
																		title="Watch the trailer for ${movie.movieName}"
																		aria-label="Watch the trailer for ${movie.movieName}">
																		<div class="thumb">
																			<img
																				src="${pageContext.request.contextPath}/assets/images/icons/heart.png"
																				alt="Watch trailer icon"
																				onerror="this.src='${pageContext.request.contextPath}/assets/images/icons/default.png';">
																		</div> <span>watch trailer</span>
																	</a>
																</c:when>
																<c:otherwise>
																	<span>No trailer available</span>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>


<!-- Mirrored from pixner.net/boleto/demo/movie-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 06:26:33 GMT -->
</html>