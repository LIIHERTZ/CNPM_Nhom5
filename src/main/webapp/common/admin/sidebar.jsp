<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
=======
    pageEncoding="UTF-8"%>
>>>>>>> 7492db4024a1a50bf9a34bcca9bd36229f64b9dc
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="sidebar">
		<!-- sidebar logo -->
<<<<<<< HEAD
		<a href="/ValCT_Nhom5/adminHome" class="sidebar__logo"> <img
			src="/ValCT_Nhom5/assets2/img/logo.png" alt="" width="300"
			height="300">
		</a>
		<!-- end sidebar logo -->

		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<img src="/ValCT_Nhom5/assets2/img/user.svg" alt="">
=======
		<a href="index.html" class="sidebar__logo">
			<img src="assets2/img/logo.svg" alt="">
		</a>
		<!-- end sidebar logo -->
		
		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<img src="assets2/img/user.svg" alt="">
>>>>>>> 7492db4024a1a50bf9a34bcca9bd36229f64b9dc
			</div>

			<div class="sidebar__user-title">
				<span>Admin</span>
<<<<<<< HEAD
				<p>${person.fullName}</p>
			</div>
=======
				<p>John Doe</p>
			</div>

			<button class="sidebar__user-btn" type="button">
				<i class="ti ti-logout"></i>
			</button>
>>>>>>> 7492db4024a1a50bf9a34bcca9bd36229f64b9dc
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">
<<<<<<< HEAD
				<li class="sidebar__nav-item"><a href="/ValCT_Nhom5/adminHome"
					class="sidebar__nav-link"><i class="ti ti-layout-grid"></i> <span>Dashboard</span></a></li>

				<li class="sidebar__nav-item"><a
					href="/ValCT_Nhom5/admin/cinemas" class="sidebar__nav-link"><i
						class="ti ti-door"></i> <span>Cinema</span></a></li>
				<li class="sidebar__nav-item"><a
					href="/ValCT_Nhom5/admin/movies" class="sidebar__nav-link"><i
						class="ti ti-movie"></i> <span>Movie</span></a></li>
				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/adminnewsOrDiscounts"
					class="sidebar__nav-link"><i class="ti ti-news"></i> <span>News
							And Discount</span></a></li>

				<li class="sidebar__nav-item"><a href="users.html"
					class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a></li>


				<li class="sidebar__nav-item"><a href="reviews.html"
					class="sidebar__nav-link"><i class="ti ti-ticket"></i>
						<span>Coupon</span></a></li>

				<li class="sidebar__nav-item"><a href="settings.html"
					class="sidebar__nav-link"><i class="ti ti-baby-bottle"></i> <span>Popcorn</span></a></li>


				<li class="sidebar__nav-item"><a href="/ValCT_Nhom5/logout"
					class="sidebar__nav-link"><i class="ti ti-arrow-left"></i> <span>Back
							to ValCT</span></a></li>
			</ul>
			<script>
    // Lấy URL hiện tại của trang
    const currentPath = window.location.pathname;

    // Lấy tất cả các liên kết trong thanh sidebar
    const sidebarLinks = document.querySelectorAll('.sidebar__nav-link');

    // Duyệt qua tất cả các liên kết để tìm liên kết nào khớp với URL hiện tại
    sidebarLinks.forEach(link => {
        if (link.getAttribute('href') === currentPath) {
            link.classList.add('sidebar__nav-link--active');
        }
    });
</script>
		</div>
		<!-- end sidebar nav -->
=======
				<li class="sidebar__nav-item">
					<a href="index.html" class="sidebar__nav-link sidebar__nav-link--active"><i class="ti ti-layout-grid"></i> <span>Dashboard</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="catalog.html" class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Catalog</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="users.html" class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="comments.html" class="sidebar__nav-link"><i class="ti ti-message"></i> <span>Comments</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="reviews.html" class="sidebar__nav-link"><i class="ti ti-star-half-filled"></i> <span>Reviews</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="settings.html" class="sidebar__nav-link"><i class="ti ti-settings"></i> <span>Settings</span></a>
				</li>

				<!-- dropdown -->
				<li class="sidebar__nav-item">
					<a class="sidebar__nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="ti ti-files"></i> <span>Pages</span> <i class="ti ti-chevron-down"></i></a>

					<ul class="dropdown-menu sidebar__dropdown-menu">
						<li><a href="add-item.html">Add item</a></li>
						<li><a href="edit-user.html">Edit user</a></li>
						<li><a href="signin.html">Sign In</a></li>
						<li><a href="signup.html">Sign Up</a></li>
						<li><a href="forgot.html">Forgot password</a></li>
						<li><a href="404.html">404 Page</a></li>
					</ul>
				</li>
				<!-- end dropdown -->

				<li class="sidebar__nav-item">
					<a href="https://hotflix.volkovdesign.com/main/index.html" class="sidebar__nav-link"><i class="ti ti-arrow-left"></i> <span>Back to HotFlix</span></a>
				</li>
			</ul>
		</div>
		<!-- end sidebar nav -->
		
		<!-- sidebar copyright -->
		<div class="sidebar__copyright">© HOTFLIX, 2019—2024. <br>Create by <a href="https://themeforest.net/user/dmitryvolkov/portfolio" target="_blank">Dmitry Volkov</a></div>
		<!-- end sidebar copyright -->
>>>>>>> 7492db4024a1a50bf9a34bcca9bd36229f64b9dc
	</div>



</body>
</html>