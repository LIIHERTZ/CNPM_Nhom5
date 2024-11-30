<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->

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
			<img src="${pageContext.request.contextPath}/assets2/img/user.svg" alt="">
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
			<li class="sidebar__nav-item"><a href="Services.html"
				class="sidebar__nav-link"><i class="ti ti-candy"></i> <span>Services</span></a>
			</li>

			<li class="sidebar__nav-item"><a href="cinema.html"
				class="sidebar__nav-link"><i class="ti ti-building"></i> <span>Cinema</span></a>
			</li>
			<li class="sidebar__nav-item"><a href="catalog.html"
				class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Catalog</span></a>
			</li>

			<li class="sidebar__nav-item"><a href="users.html"
				class="sidebar__nav-link sidebar__nav-link--active"><i
					class="ti ti-users"></i> <span>Users</span></a></li>

			<li class="sidebar__nav-item"><a href="comments.html"
				class="sidebar__nav-link"><i class="ti ti-message"></i> <span>Comments</span></a>
			</li>
			<li class="sidebar__nav-item"><a href="revenues.html"
				class="sidebar__nav-link"><i class="ti ti-revenues"></i> <span>Revenues</span></a>
			</li>
			<li class="sidebar__nav-item"><a href="discounts.html"
				class="sidebar__nav-link"><i class="ti ti-discounts"></i> <span>Discounts</span></a>
			</li>
			<li class="sidebar__nav-item"><a href="reviews.html"
				class="sidebar__nav-link"><i class="ti ti-star-half-filled"></i>
					<span>Reviews</span></a></li>

			<li class="sidebar__nav-item"><a href="settings.html"
				class="sidebar__nav-link"><i class="ti ti-settings"></i> <span>Settings</span></a>
			</li>
			<!-- dropdown -->
			<li class="sidebar__nav-item"><a class="sidebar__nav-link"
				href="#" role="button" data-bs-toggle="dropdown"
				aria-expanded="false"><i class="ti ti-files"></i> <span>Pages</span>
					<i class="ti ti-chevron-down"></i></a>

				<ul class="dropdown-menu sidebar__dropdown-menu">
					<li><a href="add-cinema.html">Add Cinema</a></li>
					<li><a href="add-popcorn.html">Add Service</a></li>
					<li><a href="add-item.html">Add Movie</a></li>
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
		Â© HOTFLIX, 2019â2024. <br>Create by <a
			href="https://themeforest.net/user/dmitryvolkov/portfolio"
			target="_blank">Dmitry Volkov</a>
	</div>
	<!-- end sidebar copyright -->
</div>
<!-- end sidebar -->

<main class="container-fluid">
	<div class="container-fluid">
		<!-- user modal -->
		<form
			action="${pageContext.request.contextPath}/admin/coupons/update?couponID=${coupon.couponID}"
			method="post" class="modal__form">
			<h4 class="modal__title">Edit Coupon</h4>

			<div class="row">
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="couponName">Coupon Name</label> <input
							type="text" class="sign__input" name="couponName" id="couponName"
							placeholder="Coupon Name" required value="${coupon.couponName }">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="couponType">Type</label> <select
							class="sign__selectjs" name="couponType" id="couponType" required
							value="${coupon.couponType }" style="color: white;">
							<option value="Coupon 1">Coupon 1</option>
							<option value="Coupon 2">Coupon 2</option>
							<option value="Coupon 3">Coupon 3</option>
							<option value="Coupon 4 ">Coupon 4</option>
						</select>
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="couponValue">Coupon Value</label>
						<input type="text" class="sign__input" name="couponValue"
							id="couponValue" placeholder="Coupon Value" required
							value="${coupon.couponValue }">
					</div>
					<!-- Äá»nh dáº¡ng ngÃ y sá»­ dá»¥ng JSTL -->
					<fmt:formatDate value="${coupon.startDate}" pattern="yyyy-MM-dd"
						var="formattedDate" />
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="startDate">Start Date</label> <input
							type="Date" class="sign__input" name="startDate" id="startDate"
							required value="${formattedDate}">
					</div>
				</div>
				<!-- Äá»nh dáº¡ng ngÃ y sá»­ dá»¥ng JSTL -->
				<fmt:formatDate value="${coupon.endDate}" pattern="yyyy-MM-dd"
					var="formattedDate" />
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="endDate">End Date</label> <input
							type="Date" class="sign__input" name="endDate" id="endDate"
							required value="${formattedDate }">
					</div>
				</div>

				<div class="col-12">
					<button type="submit" class="sign__btn sign__btn--small">
						<span>Update</span>
					</button>
				</div>
			</div>
		</form>
	</div>
</main>
<!-- end user modal -->