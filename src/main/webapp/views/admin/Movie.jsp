<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<body>
	<!-- header -->
	<header class="header">
		<div class="header__content">
			<!-- header logo -->
			<a href="index.html" class="header__logo">
				<img src="/ValCT_Nhom5/assets2/img/logo.svg" alt="">
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
			<img src="/ValCT_Nhom5/assets2/img/logo.svg" alt="">
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
                    <a href="catalog.html" class="sidebar__nav-link sidebar__nav-link--active"><i class="ti ti-movie"></i> <span>Catalog</span></a>
                </li>

                <li class="sidebar__nav-item">
                    <a href="users.html" class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a>
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
		<div class="sidebar__copyright">© HOTFLIX, 2019—2024. <br>Create by <a href="https://themeforest.net/user/dmitryvolkov/portfolio" target="_blank">Dmitry Volkov</a></div>
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
						<h2>Catalog</h2>

						<span class="main__title-stat">14,452 Total</span>

						<div class="main__title-wrap">
							<a href="add-item.html" class="main__title-link main__title-link--wrap">Add item</a>

							<select class="filter__select" name="sort" id="filter__sort">
								<option value="0">Date created</option>
								<option value="1">Rating</option>
								<option value="2">Views</option>
							</select>

							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="Find movie / tv series..">
								<button type="button">
									<i class="ti ti-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- items -->
				<div class="col-12">
					<div class="catalog catalog--1">
						<table class="catalog__table">
							<thead>
								<tr>
									<th>ID</th>
									<th>TITLE</th>
									<th>RATING</th>
									<th>CATEGORY</th>
									<th>VIEWS</th>
									<th>STATUS</th>
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
										<div class="catalog__text"><a href="#">I Dream in Another Language</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">7.9</div>
									</td>
									<td>
										<div class="catalog__text">Movie</div>
									</td>
									<td>
										<div class="catalog__text">1392</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Visible</div>
									</td>
									<td>
										<div class="catalog__text">05.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="edit-item.html" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="edit-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="catalog__text">12</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">The Forgotten Road</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">7.1</div>
									</td>
									<td>
										<div class="catalog__text">Movie</div>
									</td>
									<td>
										<div class="catalog__text">1093</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--red">Hidden</div>
									</td>
									<td>
										<div class="catalog__text">05.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="catalog__text">13</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">Whitney</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">6.3</div>
									</td>
									<td>
										<div class="catalog__text">TV Series</div>
									</td>
									<td>
										<div class="catalog__text">723</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Visible</div>
									</td>
									<td>
										<div class="catalog__text">04.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="catalog__text">14</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">Red Sky at Night</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">8.4</div>
									</td>
									<td>
										<div class="catalog__text">TV Series</div>
									</td>
									<td>
										<div class="catalog__text">2457</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Visible</div>
									</td>
									<td>
										<div class="catalog__text">04.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								<tr>
									<td>
										<div class="catalog__text">15</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">Into the Unknown</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">7.9</div>
									</td>
									<td>
										<div class="catalog__text">Movie</div>
									</td>
									<td>
										<div class="catalog__text">5092</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Visible</div>
									</td>
									<td>
										<div class="catalog__text">03.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="catalog__text">16</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">The Unseen Journey</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">7.1</div>
									</td>
									<td>
										<div class="catalog__text">TV Series</div>
									</td>
									<td>
										<div class="catalog__text">2713</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--red">Hidden</div>
									</td>
									<td>
										<div class="catalog__text">03.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="catalog__text">17</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">Savage Beauty</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">6.3</div>
									</td>
									<td>
										<div class="catalog__text">Cartoon</div>
									</td>
									<td>
										<div class="catalog__text">901</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Visible</div>
									</td>
									<td>
										<div class="catalog__text">03.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="catalog__text">18</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">Endless Horizon</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">8.4</div>
									</td>
									<td>
										<div class="catalog__text">Movie</div>
									</td>
									<td>
										<div class="catalog__text">8430</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Visible</div>
									</td>
									<td>
										<div class="catalog__text">02.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								<tr>
									<td>
										<div class="catalog__text">19</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">The Lost Key</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">7.9</div>
									</td>
									<td>
										<div class="catalog__text">Movie</div>
									</td>
									<td>
										<div class="catalog__text">818</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--green">Visible</div>
									</td>
									<td>
										<div class="catalog__text">02.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="catalog__text">20</div>
									</td>
									<td>
										<div class="catalog__text"><a href="#">Echoes of Yesterday</a></div>
									</td>
									<td>
										<div class="catalog__text catalog__text--rate">7.1</div>
									</td>
									<td>
										<div class="catalog__text">Anime</div>
									</td>
									<td>
										<div class="catalog__text">1046</div>
									</td>
									<td>
										<div class="catalog__text catalog__text--red">Hidden</div>
									</td>
									<td>
										<div class="catalog__text">01.02.2023</div>
									</td>
									<td>
										<div class="catalog__btns">
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--banned" data-bs-target="#modal-status">
												<i class="ti ti-lock"></i>
											</button>
											<a href="#" class="catalog__btn catalog__btn--view">
												<i class="ti ti-eye"></i>
											</a>
											<a href="add-item.html" class="catalog__btn catalog__btn--edit">
												<i class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- end items -->

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
							<button class="modal__btn modal__btn--dismiss" type="button" data-bs-dismiss="modal" aria-label="Close"><span>Dismiss</span></button>
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
						<h4 class="modal__title">Item delete</h4>

						<p class="modal__text">Are you sure to permanently delete this item?</p>

						<div class="modal__btns">
							<button class="modal__btn modal__btn--apply" type="button"><span>Delete</span></button>
							<button class="modal__btn modal__btn--dismiss" type="button" data-bs-dismiss="modal" aria-label="Close"><span>Dismiss</span></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end delete modal -->
	  <!-- Add Item Modal -->
    <div class="modal fade" id="modal-add-item" tabindex="-1" aria-labelledby="modal-add-item" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal__content">
                    <form action="#" class="modal__form">
                        <h4 class="modal__title">Add New Movie</h4>

                        <div class="mb-3">
                            <label for="movie-title" class="form-label">Title</label>
                            <input type="text" class="form-control" id="movie-title" placeholder="Enter movie title">
                        </div>

                        <div class="mb-3">
                            <label for="movie-category" class="form-label">Category</label>
                            <select class="form-control" id="movie-category">
                                <option value="Movie">Movie</option>
                                <option value="TV Series">TV Series</option>
                                <option value="Cartoon">Cartoon</option>
                                <option value="Anime">Anime</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="movie-rating" class="form-label">Rating</label>
                            <input type="number" class="form-control" id="movie-rating" placeholder="Enter movie rating" min="0" max="10" step="0.1">
                        </div>

                        <div class="modal__btns">
                            <button class="modal__btn modal__btn--apply" type="submit"><span>Add Movie</span></button>
                            <button class="modal__btn modal__btn--dismiss" type="button" data-bs-dismiss="modal" aria-label="Close"><span>Dismiss</span></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- end Add Item Modal -->

</body>