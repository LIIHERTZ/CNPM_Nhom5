<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<style>
.details-banner-thumb {
    position: relative;
    width: 100%; /* Chiều rộng là 100% của phần tử cha */
    height: 100%; /* Chiều cao có thể tùy chỉnh hoặc tự động theo nội dung */
    overflow: hidden; /* Ẩn những phần ảnh vượt ra ngoài vùng chứa */
}

.movie-img {
    width: 100%; /* Ảnh chiếm toàn bộ chiều rộng */
    height: 100%; /* Ảnh chiếm toàn bộ chiều cao */
    object-fit: cover; /* Lấp đầy vùng chứa mà không bị méo */
    object-position: center; /* Căn giữa ảnh nếu có phần bị cắt */
}
</style>
<body>
	<!-- ==========Banner-Section========== -->
	<section class="details-banner bg_img"
		data-background="assets/images/banner/banner04.jpg">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-thumb">
					<c:choose>
						<c:when test="${movie.image.substring(0,5) != 'https'}">
							<c:url value="/image?fname=${movie.image}" var="imgUrl" />
						</c:when>
						<c:otherwise>
							<c:set var="imgUrl" value="${movie.image}" />
						</c:otherwise>
					</c:choose>
					<a
						href="${pageContext.request.contextPath}/review?movieID=${movie.movieID}">
						<img src="${imgUrl}" alt="${movie.movieName}" class="movie-img">
					</a>
				</div>
				<div class="details-banner-content offset-lg-3">
					<h3 class="title">${movie.movieName}</h3>
					<div class="tags">
						<a href="#0">Vietnamese</a> <a href="#0">English</a>
					</div>
					<a href="#0" class="button">${movie.category}</a>
					<div class="social-and-duration">
						<div class="duration-area">
							<div class="item">
								<i class="far fa-clock"></i><span>${movie.movieDuration}</span>
							</div>
						</div>
						<ul class="social-share">
							<li><a><i class="fab fa-facebook-f"></i></a></li>
							<li><a><i class="fab fa-twitter"></i></a></li>
							<li><a><i class="fab fa-pinterest-p"></i></a></li>
							<li><a><i class="fab fa-linkedin-in"></i></a></li>
							<li><a><i class="fab fa-google-plus-g"></i></a></li>
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
								<img src="assets/images/movie/cake2.png" alt="movie">
							</div>
							<div class="counter-area"></div>
						</div>
						<p>
							<fmt:formatDate value="${movie.releaseDay}" pattern="dd/MM/yyyy" />
						</p>

					</div>
					<div class="item">
						<div class="item-header">
							<h5 class="title">${ratings}</h5>
							<div class="rated">
								<c:forEach var="i" begin="1" end="${ratings}" step="1">
									<i class="fas fa-heart"></i>
								</c:forEach>
								<!-- Hiển thị thêm icon trống nếu rating chưa đạt đủ 5 -->
								<c:forEach var="i" begin="${ratings+1}" end="5" step="1">
									<i class="fas fa-heart" style="color: #ccc;"></i>
									<!-- Icon nhạt màu cho trái tim chưa đầy -->
								</c:forEach>
							</div>

						</div>
						<p>Rating</p>
					</div>
				</div>
				<a
					href="${pageContext.request.contextPath}/userBookTickets?movieId=${movie.movieID}"
					class="custom-button">book tickets</a>
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
								<li onclick="openTab(event, 'summery')">summary</li>
								<li onclick="openTab(event, 'review')">review <span>${count}</span></li>
								<li onclick="openTab(event, 'post-review')">post review</li>
							</ul>
							<div class="tab-area">
								<div id="summery" class="tab-item">
									<div class="item" style="margin-top: 20px;">
										<h5 class="sub-title">description</h5>
										<p>${movie.description}</p>
									</div>
								</div>



								<div id="review" class="tab-item" style="margin-top: 20px;">
									<div class="review-list" id="review-list"
										style="max-height: 400px; overflow-y: auto;">
										<c:forEach var="review" items="${reviews}">
											<div class="movie-review-item">
												<div class="author">
													<div class="thumb">
														<img
															src="${pageContext.request.contextPath}/assets2/img/user.svg"
															alt="user">
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


									<!-- Nút Load More
									<c:if test="${reviews.size() > 2}">
										<div class="load-more text-center">
											<a href="javascript:void(0)" id="load-more-btn"
												class="custom-button transparent">Load More</a>
										</div>
									</c:if>
									-->

								</div>
								<div id="post-review" class="tab-item" style="margin-top: 20px;">
									<!-- Form để gửi đánh giá -->
									<div class="post-review-form"
										style="background-color: #1b1e3d; padding: 20px; border-radius: 10px;">
										<!-- Kiểm tra và thông báo lỗi nếu có -->
										<c:if test="${not empty errorMessage}">
											<div class="alert alert-danger" style="margin-bottom: 15px;">
												${errorMessage}</div>
										</c:if>
										<form
											action="${pageContext.request.contextPath}/userSubmitReview"
											method="post">
											<input type="hidden" name="movieid" value="${movie.movieID}" />
											<input type="hidden" name="perid" value="${perID}" />
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
													<option value="5" selected>Excellent</option>
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
											<div class="form-group text-center" style="margin-top: 15px;">
												<button type="submit" class="custom-button"
													style="background-color: #00d1b2; color: #ffffff; padding: 10px 20px; border-radius: 5px; border: none;">
													Submit</button>
											</div>
										</form>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// Kiểm tra xem có thông báo lỗi nào không
							let errorMessage = "${errorMessage}";
							if (errorMessage && errorMessage.trim() !== "") {
								// Nếu có lỗi, mở tab "post-review"
								openTab(
										{
											currentTarget : document
													.querySelector('[onclick*="post-review"]')
										}, 'post-review');
							} else {
								// Giả lập sự kiện click vào tab đầu tiên để hiển thị nội dung mặc định
								let defaultTab = document
										.getElementsByClassName("tab-menu")[0].children[0];
								if (defaultTab) {
									defaultTab.click(); // Tự động click vào tab đầu tiên nếu không có lỗi
								}
							}
						});

		function openTab(evt, tabName) {
			// 1. Ẩn tất cả các tab nội dung
			let tabItems = document.getElementsByClassName("tab-item");
			for (let i = 0; i < tabItems.length; i++) {
				tabItems[i].style.display = "none"; // Ẩn từng tab nội dung
			}

			// 2. Loại bỏ class "active" cho tất cả các tab menu
			let tabLinks = document.getElementsByClassName("tab-menu")[0].children;
			for (let i = 0; i < tabLinks.length; i++) {
				tabLinks[i].classList.remove("active"); // Loại bỏ class "active" khỏi tất cả các tab menu
			}

			// 3. Hiển thị tab đã chọn
			document.getElementById(tabName).style.display = "block"; // Hiển thị tab tương ứng với id được truyền vào

			// 4. Thêm class "active" cho tab menu đã được click
			evt.currentTarget.classList.add("active"); // Đánh dấu tab menu đã chọn là "active"
		}
	</script>






	<style>
.review-list::-webkit-scrollbar {
	width: 5px; /* Độ rộng của thanh cuộn */
}

.review-list::-webkit-scrollbar-track {
	background: #f1f1f1; /* Màu nền của track thanh cuộn */
	border-radius: 10px; /* Độ bo góc cho track */
}

.review-list::-webkit-scrollbar-thumb {
	background: #888; /* Màu của thanh trượt */
	border-radius: 10px; /* Độ bo góc cho thanh trượt */
}

.review-list::-webkit-scrollbar-thumb:hover {
	background: #555; /* Màu của thanh trượt khi hover */
}
</style>

	<!-- ==========Movie-Section========== -->
</body>
</html>