<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<!-- main content -->
<main class="container-fluid">
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Coupons</h2>

					<div class="main__title-wrap">
						<button type="button" data-bs-toggle="modal"
							class="main__title-link main__title-link--wrap"
							data-bs-target="#modal-user">Add Coupon</button>
						<!-- search -->
						<form action=" ${pageContext.request.contextPath}/admin/coupons"
							method="get" class="main__title-form">
							<input type="text" name="searchQuery" value="${searchQuery}"
								placeholder="Find coupon...">
							<button type="submit">
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
								<th>COUPON ID</th>
								<th>COUPON NAME</th>
								<th>COUPON TYPE</th>
								<th>COUPON VALUE</th>
								<th>START DATE</th>
								<th>END DATE</th>
								<th>ACTIONS</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach var="coupon" items="${coupons}">
								<tr>
									<td><div class="catalog__text">${coupon.couponID }</div></td>
									<td><div class="catalog__text">${coupon.couponName }</div></td>
									<td><div class="catalog__text">${coupon.couponType }</div></td>
									<td><div class="catalog__text">${coupon.couponValue }</div></td>
									<!-- Định dạng ngày sử dụng JSTL -->
									<fmt:formatDate value="${coupon.startDate}"
										pattern="yyyy-MM-dd" var="startDateFormatted" />
									<fmt:formatDate value="${coupon.endDate}" pattern="yyyy-MM-dd"
										var="endDateFormatted" />
									<td><div class="catalog__text">${startDateFormatted }</div></td>
									<td><div class="catalog__text">${endDateFormatted }</div></td>
									<td>
										<div class="catalog__btns">
											<a
												href="${pageContext.request.contextPath}/admin/coupons/edit?couponID=${coupon.couponID}"
												class="catalog__btn catalog__btn--edit"> <i
												class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal"
												class="catalog__btn catalog__btn--delete"
												data-bs-target="#modal-delete" data-id="${coupon.couponID}">
												<i class="ti ti-trash"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>



						</tbody>
					</table>
				</div>
			</div>
			<!-- end users -->

			<!-- paginator -->
			<div class="col-12">
				<div class="main__paginator">
					<!-- amount -->
					<span class="main__paginator-pages">${currentPage} of
						${totalPages}</span>
					<!-- end amount -->
					<!-- Page size selector -->
					<div class="page-size-selector main__paginator-pages"  >
						<label for="pageSize"
							style= color: #333; padding: 5px 10px; border-radius: 5px;>Page
							Size  :   </label> <select id="pageSize" name="pageSize"
							onchange="updatePageSize(this)"
							style= "background-color : #222028 ;  border :#222028; color :white; ">
							<option value="5" <c:if test="${pageSize == 5}">selected</c:if>> 5</option>
							<option value="10" <c:if test="${pageSize == 10}">selected</c:if>> 10</option>
							<option value="15" <c:if test="${pageSize == 15}">selected</c:if>> 15</option>
							<option value="20" <c:if test="${pageSize == 20}">selected</c:if>> 20</option>
						</select>
					</div>
					<ul class="main__paginator-list">
						<li><a href="#"> <i class="ti ti-chevron-left"></i> <span>Prev</span>
						</a></li>
						<li><a href="#"> <span>Next</span> <i
								class="ti ti-chevron-right"></i>
						</a></li>
					</ul>
					<ul class="paginator">
						<!-- Prev button -->
						<li class="paginator__item paginator__item--prev"><a
							href="<c:if test='${pageNumber > 1}'>${pageContext.request.contextPath}/admin/coupons?pageNumber=${pageNumber - 1}&pageSize=${pageSize}</c:if>">
								<i class="ti ti-chevron-left"></i>
						</a></li>
						<!-- Page numbers -->
						<c:forEach var="i" begin="0" end="${totalPages - 1}">
							<li class="paginator__item  ${i+1 == currentPage ? 'paginator__item--active' : ''}">
								<a
								href="${pageContext.request.contextPath}/admin/coupons?pageNumber=${i + 1}&pageSize=${pageSize}">
									${i + 1} </a>
							</li>
						</c:forEach>
						<!-- Next button -->
						<li class="paginator__item paginator__item--next"><a
							href="<c:if test='${pageNumber < totalPages}'>${pageContext.request.contextPath}/admin/coupons?pageNumber=${pageNumber + 1}&pageSize=${pageSize}</c:if>">
								<i class="ti ti-chevron-right"></i>
						</a></li>
					</ul>

				</div>
				<!-- end paginator -->
			</div>
		</div>
</main>
<!-- end main content -->

<!-- user modal -->
<div class="modal fade" id="modal-user" tabindex="-1"
	aria-labelledby="modal-user" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal__content">
				<form
					action="${pageContext.request.contextPath}/admin/coupons/save "
					method="post" class="modal__form">
					<h4 class="modal__title">Add Coupon</h4>

					<div class="row">
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="couponName">Coupon Name</label>
								<input type="text" class="sign__input" name="couponName"
									id="couponName" placeholder="Coupon Name" required>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="couponType">Type</label> <select
									class="sign__selectjs" name="couponType" id="couponType"
									required>
									<option value="Coupon 1">Coupon 1</option>
									<option value="Coupon 2">Coupon 2</option>
									<option value="Coupon 3">Coupon 3</option>
									<option value="Coupon 4 ">Coupon 4</option>
								</select>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="couponValue">Coupon
									Value</label> <input type="number" class="sign__input" name="couponValue"
									id="couponValue" placeholder="Coupon Value" required>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="startDate">Start Date</label> <input
									type="Date" class="sign__input" name="startDate" id="startDate"
									required>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="endDate">End Date</label> <input
									type="Date" class="sign__input" name="endDate" id="endDate"
									required>
							</div>
						</div>

						<div class="col-12">
							<button type="submit" class="sign__btn sign__btn--small">
								<span>Save</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- end user modal -->

<!-- delete modal -->
<div class="modal fade" id="modal-delete" tabindex="-1"
	aria-labelledby="modal-delete" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal__content">
				<form
					action="${pageContext.request.contextPath}/admin/coupons/delete"
					method="POST" class="modal__form_delete">
					<h4 class="modal__title">Coupon delete</h4>

					<p class="modal__text">Are you sure to permanently delete this
						Coupon delete?</p>
					<div class="modal__btns">
						<button class="modal__btn modal__btn--apply" type="submit">
							<span>Delete</span>
						</button>
						<button class="modal__btn modal__btn--dismiss" type="button"
							data-bs-dismiss="modal" aria-label="Close">
							<span>Dismiss</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- end delete modal -->



<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->
<script>
	//JavaScript to handle page size change
	function updatePageSize(select) {
		var pageSize = select.value;
		var urlParams = new URLSearchParams(window.location.search);
		var pageNumber = 1; // Default to 1 
		urlParams.set('pageSize', pageSize); // Update the page size query param
		urlParams.set('pageNumber', pageNumber);

		// Use window.location.href to reload the page with the updated query params
		window.location.href = window.location.pathname + '?'
				+ urlParams.toString();
	}
	
	
	// Lắng nghe sự kiện khi mở Modal
	document.addEventListener("DOMContentLoaded", function () {
	    const deleteButtons = document.querySelectorAll(".catalog__btn--delete"); // Nút mở modal xóa
	    const modalForm = document.querySelector(".modal__form_delete"); // Form trong modal
	    deleteButtons.forEach(button => {
	        button.addEventListener("click", function () {
	            const couponID = this.getAttribute("data-id"); // Lấy userId từ attribute
	            const baseFormAction = modalForm.getAttribute("action"); // URL ban đầu của form
	            const link = baseFormAction+'?couponID='+couponID;
	            console.log("link : " + link);
	            modalForm.setAttribute("action", link); 
	        });
	    });
	});
</script>
