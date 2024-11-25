<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/slimselect.css">
<link rel="stylesheet" href="css/admin.css">

<!-- Icon font -->
<link rel="stylesheet" href="webfont/tabler-icons.min.css">

<!-- Favicons -->
<link rel="icon" type="image/png" href="icon/favicon-32x32.png"
	sizes="32x32">
<link rel="apple-touch-icon" href="icon/favicon-32x32.png">

<meta name="description"
	content="Online Movies, TV Shows & Cinema HTML Template">
<meta name="keywords" content="">
<meta name="author" content="Dmitry Volkov">
<title>HotFlix – Online Movies, TV Shows & Cinema HTML Template</title>
</head>
<body>
	<!-- sidebar -->
	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="index.html" class="sidebar__logo"> <img
			src="${pageContext.request.contextPath}/assets2/img/logo.svg" alt="">
		</a>
		<!-- end sidebar logo -->
		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<img src="${pageContext.request.contextPath}/assets2/img/user.svg"
					alt="">
			</div>

			<div class="sidebar__user-title">
				<span>Admin</span>
				<p>John Doe</p>
			</div>

			<button class="sidebar__user-btn" type="button">
				<i class="ti ti-logout"></i>
			</button>
		</div>
		<!-- end sidebar user -->
		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">
				<li class="sidebar__nav-item"><a href="index.html"
					class="sidebar__nav-link"><i class="ti ti-layout-grid"></i> <span>Dashboard</span></a>
				</li>

				<li class="sidebar__nav-item"><a href="catalog.html"
					class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Catalog</span></a>
				</li>

				<li class="sidebar__nav-item"><a href="users.html"
					class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a>
				</li>

				<li class="sidebar__nav-item"><a href="comments.html"
					class="sidebar__nav-link"><i class="ti ti-message"></i> <span>Comments</span></a>
				</li>

				<li class="sidebar__nav-item"><a href="reviews.html"
					class="sidebar__nav-link sidebar__nav-link--active"><i
						class="ti ti-star-half-filled"></i> <span>Reviews</span></a></li>

				<li class="sidebar__nav-item"><a href="settings.html"
					class="sidebar__nav-link"><i class="ti ti-settings"></i> <span>Settings</span></a>
				</li>
				<!-- dropdown -->
				<li class="sidebar__nav-item"><a class="sidebar__nav-link"
					href="#" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"><i class="ti ti-files"></i> <span>Pages</span>
						<i class="ti ti-chevron-down"></i></a>
					<ul class="dropdown-menu sidebar__dropdown-menu">
						<li><a href="add-item.html">Add item</a></li>
						<li><a href="edit-user.html">Edit user</a></li>
						<li><a href="signin.html">Sign In</a></li>
						<li><a href="signup.html">Sign Up</a></li>
						<li><a href="forgot.html">Forgot password</a></li>
						<li><a href="404.html">404 Page</a></li>
					</ul></li>
				<!-- end dropdown -->
				<li class="sidebar__nav-item"><a
					href="https://hotflix.volkovdesign.com/main/index.html"
					class="sidebar__nav-link"><i class="ti ti-arrow-left"></i> <span>Back
							to HotFlix</span></a></li>
			</ul>
		</div>
		<!-- end sidebar nav -->
		<!-- sidebar copyright -->
		<div class="sidebar__copyright">
			© HOTFLIX, 2019—2024. <br>Create by <a
				href="https://themeforest.net/user/dmitryvolkov/portfolio"
				target="_blank">Dmitry Volkov</a>
		</div>
		<!-- end sidebar copyright -->
	</div>
	<!-- end sidebar -->
	<!-- main content -->
	<main class="container-fluid">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Reviews</h2>
						<span class="main__title-stat">9,071 Total</span>
						<div class="main__title-wrap">
							<select class="filter__select" name="sort" id="filter__sort">
								<option value="0">Date created</option>
								<option value="1">Rating</option>
							</select>

							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Key word..">
								<button type="button">
									<i class="ti ti-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->
				<!-- reviews -->
				<div class="col-12">
					<div class="catalog catalog--1">
						<table class="catalog__table">
							<thead>
								<tr>
									<th>ID</th>
									<th>NAME</th>
									<th>RATING</th>
									<th>ACTIONS</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="movie" items="${movies}">
									<tr>
										<td>
											<div class="catalog__text">${movie.movieID}</div>
										</td>
										<td>
											<div class="catalog__text">${movie.movieName}</div>
										</td>
										<td>
											<div class="catalog__text">${movie.rating}</div>
										</td>
										<td>
											<div class="catalog__btns">
												<button type="button" data-bs-toggle="modal"
													class="catalog__btn catalog__btn--view"
													data-bs-target="#modal-view">
													<i class="ti ti-eye"></i>
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
				<!-- end reviews -->
				<!-- paginator -->
				<div class="col-12">
					<div class="main__paginator">
						<!-- amount -->
						<span class="main__paginator-pages">1 of 169</span>
						<!-- end amount -->

						<ul class="main__paginator-list">
							<li><a href="#"> <i class="ti ti-chevron-left"></i> <span>Prev</span>
							</a></li>
							<li><a href="#"> <span>Next</span> <i
									class="ti ti-chevron-right"></i>
							</a></li>
						</ul>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev"><a
								href="#"><i class="ti ti-chevron-left"></i></a></li>
							<li class="paginator__item paginator__item--active"><a
								href="#">1</a></li>
							<li class="paginator__item"><a href="#">2</a></li>
							<li class="paginator__item"><a href="#">3</a></li>
							<li class="paginator__item"><a href="#">4</a></li>
							<li class="paginator__item"><span>...</span></li>
							<li class="paginator__item"><a href="#">29</a></li>
							<li class="paginator__item"><a href="#">30</a></li>
							<li class="paginator__item paginator__item--next"><a
								href="#"><i class="ti ti-chevron-right"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
	</main>
	<!-- end main content -->
	<!-- view modal -->
	<div class="modal fade" id="modal-view" tabindex="-1"
		aria-labelledby="modal-view" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal__content modal__content--view">
					<h4 class="modal__title">Customer Reviews</h4>
					<button type="button" class="modal__close-btn"
						data-bs-dismiss="modal" aria-label="Close">
						<i class="ti ti-x"></i>
					</button>
					<div class="reviews__list">
						<!-- Mỗi phần tử bình luận -->
						<div class="reviews__item">
							<div class="reviews__autor">
								<div class="reviews__avatar">
									<img
										src="${pageContext.request.contextPath}/assets2/img/user.svg"
										alt="User Avatar">
								</div>
								<div class="reviews__details">
									<span class="reviews__name">DUONG</span> <span
										class="reviews__date">Verified review</span>
								</div>
							</div>
							<div class="reviews__content">
								<p class="reviews__text">This movie had a great storyline
									and wonderful characters. I really enjoyed it from start to
									finish.</p>
							</div>
							<div class="reviews__actions">
								<button class="reviews__report" onclick="reportReview()">
									<i class="ti ti-flag"></i> <span>Report</span>
								</button>
								<button class="reviews__reply" onclick="toggleReplyBox(this)">
									<i class="ti ti-message"></i> <span>Reply</span>
								</button>
							</div>
							<div class="reply-box" style="display: none;">
								<textarea class="reply-textarea"
									placeholder="Write your reply here..."></textarea>
								<button class="send-reply-btn" onclick="sendReply()">Send</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function reportReview() {
			alert("Bạn đã nhấn nút Tố cáo. Chức năng tố cáo đang được xử lý.");
			// Thêm mã để xử lý tố cáo, ví dụ: mở modal để người dùng báo cáo
		}

		function toggleReplyBox(button) {
			const reviewItem = button.closest('.reviews__item');
			const replyBox = reviewItem.querySelector('.reply-box');

			if (replyBox.style.display === "none") {
				replyBox.style.display = "block"; // Hiển thị khung trả lời
			} else {
				replyBox.style.display = "none"; // Ẩn khung trả lời
			}
		}
		function sendReply() {
			alert("Your reply has been sent!");
			// Thêm mã để xử lý việc gửi trả lời, ví dụ gửi lên server hoặc thêm vào danh sách bình luận
		}
	</script>
	<!-- end view modal -->
	<!-- CSS cho Modal -->
	<style>
/* Modal chỉnh sửa */
.modal__content--view {
	background-color: #1b1e3d; /* Màu nền tối đồng nhất */
	color: #ffffff; /* Màu chữ trắng */
	padding: 20px; /* Khoảng cách bên trong */
	border-radius: 10px; /* Bo góc mềm mại */
	max-height: 80vh; /* Giới hạn chiều cao modal */
	overflow-y: auto; /* Cuộn khi nội dung dài */
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5); /* Thêm bóng cho modal */
}

/* Tiêu đề modal */
.modal__title {
	font-size: 1.5em;
	color: #ffc107; /* Màu vàng nổi bật */
	font-weight: bold;
	text-align: center;
	margin-bottom: 20px;
}

/* Nút đóng modal */
.modal__close-btn {
	font-size: 1.5em;
	color: #ffffff;
	background: transparent;
	border: none;
	position: absolute;
	top: 15px;
	right: 15px;
	cursor: pointer;
}

.modal__close-btn:hover {
	color: #ffc107; /* Màu vàng khi hover */
}

/* Danh sách bình luận */
.reviews__list {
	max-height: 60vh; /* Giới hạn chiều cao để cuộn */
	overflow-y: auto; /* Cuộn dọc */
	padding-right: 10px;
	scrollbar-width: thin; /* Thanh cuộn mỏng */
	scrollbar-color: #888 #1b1e3d; /* Màu thanh cuộn */
}

.reviews__list::-webkit-scrollbar {
	width: 4px; /* Thanh cuộn mỏng */
}

.reviews__list::-webkit-scrollbar-thumb {
	background: #888;
	border-radius: 5px;
}

.reviews__list::-webkit-scrollbar-thumb:hover {
	background: #555;
}

/* Bình luận */
.reviews__item {
	background-color: #24243e; /* Màu nền mỗi bình luận */
	color: #ffffff; /* Màu chữ trắng */
	padding: 15px;
	margin-bottom: 15px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Hiệu ứng đổ bóng */
}

/* Tác giả bình luận */
.reviews__autor {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.reviews__avatar img {
	width: 50px;
	height: 50px;
	border-radius: 50%; /* Bo tròn hình ảnh */
	border: 2px solid #ffc107; /* Đường viền vàng */
}

.reviews__name {
	color: #ffc107; /* Màu vàng nổi bật */
	font-weight: bold;
	font-size: 1.1em;
}

.reviews__date {
	color: #b5b5b5; /* Màu xám nhạt */
	font-size: 0.9em;
}

/* Nội dung bình luận */
.reviews__text {
	font-size: 1em;
	line-height: 1.5;
	color: #e0e0e0; /* Màu chữ xám nhạt */
}

/* Nút hành động (Report và Reply) */
.reviews__actions button {
	color: #ffffff;
	background: none;
	border: none;
	font-size: 1em;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 5px;
}

.reviews__actions button:hover {
	color: #ffc107; /* Màu vàng khi hover */
}

.reviews__report i {
	color: #ff4b2b; /* Màu đỏ cho nút Report */
}

.reviews__reply i {
	color: #00d1b2; /* Màu xanh cho nút Reply */
}

/* Hộp trả lời */
.reply-box {
	background-color: #1b1e3d; /* Màu nền đồng nhất */
	color: #ffffff; /* Màu chữ trắng */
	padding: 10px;
	border-radius: 5px;
	margin-top: 10px;
}

.reply-box textarea {
	width: 100%;
	background-color: #24243e;
	color: #e0e0e0;
	border: 1px solid #333;
	border-radius: 5px;
	padding: 10px;
	margin-bottom: 10px;
	resize: none;
}

.reply-box .send-reply-btn {
	background-color: #ffc107;
	color: #000000;
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.reply-box .send-reply-btn:hover {
	background-color: #e6a600; /* Màu tối hơn khi hover */
}
</style>
	<!-- end view modal -->
	<!-- JS -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/slimselect.min.js"></script>
	<script src="js/smooth-scrollbar.js"></script>
	<script src="js/admin.js"></script>
</body>
</html>
