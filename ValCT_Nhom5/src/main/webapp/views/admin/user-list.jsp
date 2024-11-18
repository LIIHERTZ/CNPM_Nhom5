


<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/slimselect.css">
	<link rel="stylesheet" href="css/admin.css">

	<!-- Icon font -->
	<link rel="stylesheet" href="webfont/tabler-icons.min.css">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">

	<meta name="description" content="Online Movies, TV Shows & Cinema HTML Template">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>HotFlix – Online Movies, TV Shows & Cinema HTML Template</title>
</head>

<body>
	<!-- header -->
	<header class="header">
		<div class="header__content">
			<!-- header logo -->
			<a href="index.html" class="header__logo">
				<img src="img/logo.svg" alt="">
			</a>
			<!-- end header logo -->

			<!-- header menu btn -->
			<button class="header__btn" type="button">
				<span></span>
				<span></span>
				<span></span>
			</button>
			<!-- end header menu btn -->
		</div>
	</header>
	<!-- end header -->

	<!-- sidebar -->
	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="index.html" class="sidebar__logo">
			<img src="img/logo.svg" alt="">
		</a>
		<!-- end sidebar logo -->

		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<img src="img/user.svg" alt="">
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
                <li class="sidebar__nav-item">
                    <a href="index.html" class="sidebar__nav-link"><i class="ti ti-layout-grid"></i> <span>Dashboard</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="Services.html" class="sidebar__nav-link"><i class="ti ti-candy"></i> <span>Services</span></a>
                </li>
            
                <li class="sidebar__nav-item">
                    <a href="cinema.html" class="sidebar__nav-link"><i class="ti ti-building"></i> <span>Cinema</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="catalog.html" class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Catalog</span></a>
                </li>

                <li class="sidebar__nav-item">
                    <a href="users.html" class="sidebar__nav-link sidebar__nav-link--active"><i class="ti ti-users"></i> <span>Users</span></a>
                </li>

                <li class="sidebar__nav-item">
                    <a href="comments.html" class="sidebar__nav-link"><i class="ti ti-message"></i> <span>Comments</span></a>
                </li>
                <li class="sidebar__nav-item">
					<a href="revenues.html" class="sidebar__nav-link"><i class="ti ti-revenues"></i> <span>Revenues</span></a>
				</li>
				<li class="sidebar__nav-item">
					<a href="discounts.html" class="sidebar__nav-link"><i class="ti ti-discounts"></i> <span>Discounts</span></a>
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
                        <li><a href="add-cinema.html">Add Cinema</a></li>
                        <li><a href="add-popcorn.html">Add Service</a></li>
                        <li><a href="add-item.html">Add Movie</a></li>
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
		<div class="sidebar__copyright">© HOTFLIX, 2019—2024. <br>Create by <a
				href="https://themeforest.net/user/dmitryvolkov/portfolio" target="_blank">Dmitry Volkov</a></div>
		<!-- end sidebar copyright -->
	</div>
	<!-- end sidebar -->

	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Users</h2>

						<span class="main__title-stat">3,702 Total</span>

						<div class="main__title-wrap">
							<button type="button" data-bs-toggle="modal" class="main__title-link main__title-link--wrap"
								data-bs-target="#modal-user">Add user</button>

							<select class="filter__select" name="sort" id="filter__sort">
								<option value="0">Date created</option>
								<option value="1">Pricing plan</option>
								<option value="2">Status</option>
							</select>

							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Find user..">
								<button type="button">
									<i class="ti ti-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
					<div class="catalog catalog--1">
						<table class="catalog__table">
							<thead>
								<tr>
									<th>ID</th>
									<th>BASIC INFO</th>
									<th>USERNAME</th>
									<th>CRAETED DATE</th>
									<th>ACTIONS</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>
										<div class="catalog__text">11</div>
									</td>
									<td>
										<div class="catalog__user">
											<div class="catalog__avatar">
												<img src="img/user.svg" alt="">
											</div>
											<div class="catalog__meta">
												<h3>Tess Harper</h3>
												<span>email@email.com</span>
											</div>
										</div>
									</td>
									<td>
										<div class="catalog__text">Username</div>
									</td>
									<td>
										<div class="catalog__text">Premium</div>
									</td>
									<td>
										<div class="catalog__text">13</div>
									</td>
									<td>
										<div class="catalog__text">1</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Approved</div>
									</td>
									<td>
										<div class="catalog__text">05.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal"
												class="catalog__btn catalog__btn--banned"
												data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="edit-user.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal"
												class="catalog__btn catalog__btn--delete"
												data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- end users -->

				<!-- paginator -->
				<div class="col-12">
					<div class="main__paginator">
						<!-- amount -->
						<span class="main__paginator-pages">10 of 169</span>
						<!-- end amount -->

						<ul class="main__paginator-list">
							<li>
								<a href="#">
									<i class="ti ti-chevron-left"></i>
									<span>Prev</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span>Next</span>
									<i class="ti ti-chevron-right"></i>
								</a>
							</li>
						</ul>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev">
								<a href="#"><i class="ti ti-chevron-left"></i></a>
							</li>
							<li class="paginator__item"><a href="#">1</a></li>
							<li class="paginator__item paginator__item--active"><a href="#">2</a></li>
							<li class="paginator__item"><a href="#">3</a></li>
							<li class="paginator__item"><a href="#">4</a></li>
							<li class="paginator__item"><span>...</span></li>
							<li class="paginator__item"><a href="#">29</a></li>
							<li class="paginator__item"><a href="#">30</a></li>
							<li class="paginator__item paginator__item--next">
								<a href="#"><i class="ti ti-chevron-right"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
	</main>
	<!-- end main content -->

	<!-- user modal -->
	<div class="modal fade" id="modal-user" tabindex="-1" aria-labelledby="modal-user" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal__content">
					<form action="#" class="modal__form">
						<h4 class="modal__title">Add User</h4>

						<div class="row">
							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label" for="email2">Email</label>
									<input id="email2" type="text" name="email" class="sign__input"
										placeholder="email@email.com">
								</div>
							</div>
							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label" for="fname">Name</label>
									<input id="fname" type="text" name="fname" class="sign__input"
										placeholder="John Doe">
								</div>
							</div>

							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label" for="username">Username</label>
									<input id="username" type="text" name="username" class="sign__input"
										placeholder="User 123">
								</div>
							</div>

							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label" for="pass0">Password</label>
									<input id="pass0" type="password" name="pass0" class="sign__input">
								</div>
							</div>
							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label" for="phone">Phone</label>
									<input id="phone" type="text" name="phone" class="sign__input"
										placeholder="023812319376">
								</div>
							</div>
							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label" for="rights">Rights</label>
									<select class="sign__select" id="rights">
										<option value="User">User</option>
										<option value="Moderator">Moderator</option>
										<option value="Admin">Admin</option>
									</select>
								</div>
							</div>
							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label" for="sign__gallery-upload">Avatar</label>
									<div class="sign__gallery">
										<label id="gallery1" for="sign__gallery-upload">Upload (40x40)</label>
										<input data-name="#gallery1" id="sign__gallery-upload" name="gallery"
											class="sign__gallery-upload" type="file" accept=".png, .jpg, .jpeg"
											multiple="">
									</div>
								</div>
							</div>

							<div class="col-12 col-lg-6 offset-lg-3">
								<button type="button" class="sign__btn sign__btn--modal">Add</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end user modal -->

	<!-- status modal -->
	<div class="modal fade" id="modal-status" tabindex="-1" aria-labelledby="modal-status" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal__content">
					<form action="#" class="modal__form">
						<h4 class="modal__title">Status change</h4>

						<p class="modal__text">Are you sure about immediately change status?</p>

						<div class="modal__btns">
							<button class="modal__btn modal__btn--apply" type="button"><span>Apply</span></button>
							<button class="modal__btn modal__btn--dismiss" type="button" data-bs-dismiss="modal"
								aria-label="Close"><span>Dismiss</span></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end status modal -->

	<!-- delete modal -->
	<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="modal-delete" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal__content">
					<form action="#" class="modal__form">
						<h4 class="modal__title">User delete</h4>

						<p class="modal__text">Are you sure to permanently delete this user?</p>

						<div class="modal__btns">
							<button class="modal__btn modal__btn--apply" type="button"><span>Delete</span></button>
							<button class="modal__btn modal__btn--dismiss" type="button" data-bs-dismiss="modal"
								aria-label="Close"><span>Dismiss</span></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end delete modal -->

	<!-- JS -->
	<script src="/asset2/js/bootstrap.bundle.min.js"></script>
	<script src="/asset2/js/slimselect.min.js"></script>
	<script src="/asset2/js/smooth-scrollbar.js"></script>
	<script src="/asset2/js/admin.js"></script>
</body>

<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->

</html>