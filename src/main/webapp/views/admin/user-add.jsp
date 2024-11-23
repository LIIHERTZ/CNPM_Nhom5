<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->

<!-- sidebar -->
<div class="sidebar">
	<!-- sidebar logo -->
	<a href="index.html" class="sidebar__logo"> <img
		src="/ValCT_Nhom5/assets2/img/logo.svg" alt="">
	</a>
	<!-- end sidebar logo -->

	<!-- sidebar user -->
	<div class="sidebar__user">
		<div class="sidebar__user-img">
			<img src="/ValCT_Nhom5/assets2/img/user.svg" alt="">
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
		© HOTFLIX, 2019—2024. <br>Create by <a
			href="https://themeforest.net/user/dmitryvolkov/portfolio"
			target="_blank">Dmitry Volkov</a>
	</div>
	<!-- end sidebar copyright -->
</div>
<!-- end sidebar -->

<main class="container-fluid">
	<div class="container-fluid">


		<!-- user modal -->
		<form action="${pageContext.request.contextPath}/admin/users/save "
			method="post" class="modal__form">
			<h4 class="modal__title">Add User</h4>

			<div class="row">
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="email2">Email</label> <input
							id="email2" type="text" name="email" class="sign__input"
							placeholder="email@email.com">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="fname">Name</label> <input
							id="fname" type="text" name="fname" class="sign__input"
							placeholder="John Doe">
					</div>
				</div>

				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="password">Password</label> <input
							id="password" type="password" name="password" class="sign__input">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="phone">Phone</label> <input
							id="phone" type="text" name="phone" class="sign__input"
							placeholder="023812319376">
					</div>
				</div>
				<div class="col-12">
					<div class="sign__group">
						<label class="sign__label" for="rights">Rights</label> <select
							class="sign__select" id="rights" name="rights">
							<option value="User">User</option>
							<option value="Admin">Admin</option>
						</select>
					</div>
				</div>
				<div class="col-12 col-lg-6 offset-lg-3">
					<button type="submit" class="sign__btn sign__btn--modal">Add</button>
				</div>
			</div>
		</form>
		<!-- end user modal -->
	</div>
</main>