<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="/ValCT_Nhom5/adminHome" class="sidebar__logo"> <img
			src="/ValCT_Nhom5/assets2/img/logo.png" alt="" width="300" height="300">
		</a>
		<!-- end sidebar logo -->

		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<img src="/ValCT_Nhom5/assets2/img/user.svg" alt="">
			</div>

			<div class="sidebar__user-title">
				<span>Admin</span>
				<p>${person.fullName}</p>
			</div>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">
				<li class="sidebar__nav-item"><a href="/ValCT_Nhom5/adminHome"
					class="sidebar__nav-link"><i class="ti ti-layout-grid"></i> <span>Dashboard</span></a></li>

				<li class="sidebar__nav-item"><a href="/ValCT_Nhom5/admin/cinemas"
					class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Cinema</span></a></li>

				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/adminnewsOrDiscounts"
					class="sidebar__nav-link"><i class="ti ti-notification"></i> <span>News
							And Discount</span></a></li>

				<li class="sidebar__nav-item"><a href="users.html"
					class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a></li>


				<li class="sidebar__nav-item"><a href="reviews.html"
					class="sidebar__nav-link"><i class="ti ti-star-half-filled"></i>
						<span>Coupon</span></a></li>

				<li class="sidebar__nav-item"><a href="settings.html"
					class="sidebar__nav-link"><i class="ti ti-settings"></i> <span>Popcorn</span></a></li>


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
	</div>



</body>
</html>