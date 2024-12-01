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
		<a href="${pageContext.request.contextPath}/adminHome"
			class="sidebar__logo"> <img
			src="${pageContext.request.contextPath}/assets2/img/logo.png" alt=""
			width="300" height="300">
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
				<p>${person.fullName}</p>
			</div>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">

				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/admin/cinemas"
					class="sidebar__nav-link"><i class="ti ti-door"></i> <span>Cinema</span></a></li>
				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/admin/movies"
					class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Movie</span></a></li>
				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/adminnewsOrDiscounts"
					class="sidebar__nav-link"><i class="ti ti-news"></i> <span>News
							And Discount</span></a></li>
				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/adminMessage"
					class="sidebar__nav-link"><i class="ti ti-message-circle"></i>
						<span>Chats</span></a></li>


				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/admin/users"
					class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a></li>


				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/admin/coupons"
					class="sidebar__nav-link"><i class="ti ti-ticket"></i> <span>Coupon</span></a></li>

				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/admin/popcorns"
					class="sidebar__nav-link"><i class="ti ti-baby-bottle"></i> <span>Popcorn</span></a></li>
				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/admin/revenues-statics"
					class="sidebar__nav-link"><i class="ti ti-presentation"></i> <span>Revenue</span></a></li>

				<li class="sidebar__nav-item"><a
					href="${pageContext.request.contextPath}/logout"
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