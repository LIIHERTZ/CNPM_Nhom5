<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

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
		<form
			action="${pageContext.request.contextPath}/admin/popcorns/update?popcornID=${popcorn.popcornID}"
			method="post" class="modal__form">
			<h4 class="modal__title">Edit PopCorn</h4>

			<div class="row">
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="namePopCorn">PopCorn Name</label>
						<input type="text" class="sign__input" name="namePopCorn"
							id="namePopCorn" placeholder="Popcorn Combo Name" required
							value="${popcorn.namePopCorn}">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="price">Price</label> <input
							type="number" class="sign__input" name="price" id="price"
							placeholder="Price" required value="${popcorn.price}">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="typePopCorn">Type</label> <select
							class="sign__selectjs" name="typePopCorn" id="typePopCorn"
							required value="${popcorn.typePopCorn}"
							style="color: white; font-weight: bold;">
							<option value="Small" style="color: white; font-weight: bold;">Small</option>
							<option value="Regular" style="color: white; font-weight: bold;">Regular</option>
							<option value="Large" style="color: white; font-weight: bold;">Large</option>
							<option value="Extra Large"
								style="color: white; font-weight: bold;">Extra Large</option>
						</select>
					</div>
				</div>

				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="status">Status</label> <select
							class="sign__selectjs" name="status" id="status" required
							style="color: white; font-weight: bold;">
							<option value="1" ${popcorn.status == true ? 'selected' : ''}
								style="color: white; font-weight: bold;">Available</option>
							<option value="0" ${popcorn.status == false ? 'selected' : ''}
								style="color: white; font-weight: bold;">Unavailable</option>
						</select>
					</div>
				</div>

				<div class="col-12">
					<button type="submit" class="sign__btn sign__btn--small">
						<span>Update</span>
					</button>
				</div>
			</div>
		</form>
		<!-- end user modal -->
	</div>
</main>