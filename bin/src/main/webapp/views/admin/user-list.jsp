<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- main content -->
<main class="container-fluid">
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Users</h2>

					<span class="main__title-stat">3,702 Total</span>

					<div class="main__title-wrap">
						<button type="button" data-bs-toggle="modal"
							class="main__title-link main__title-link--wrap"
							onclick="window.location.href= '${pageContext.request.contextPath}/admin/users/add '">Add
							user</button>
						<!-- search -->
						<form action=" ${pageContext.request.contextPath}/admin/users"
							method="get" class="main__title-form">
							<input type="text" name="searchQuery" value="${searchQuery}"
								placeholder="Find user..">
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
								<th>ID</th>
								<th>BASIC INFO</th>
								<th>USERNAME</th>
								<th>ACTIONS</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach var="user" items="${users}">
								<tr>
									<td><div class="catalog__text">${user.perID }</div></td>
									<td>
										<div class="catalog__user">
											<div class="catalog__avatar">
												<img src="/ValCT_Nhom5/assets2/img/user.svg" alt="">
											</div>
											<div class="catalog__meta">
												<h3>${user.fullName }</h3>
												<span>${user.email }</span>
											</div>
										</div>
									</td>
									<td><div class="catalog__text">${user.phone }</div></td>

									<td>
										<div class="catalog__btns">
											<a
												href="${pageContext.request.contextPath}/admin/users/edit?userId=${user.perID}"
												class="catalog__btn catalog__btn--edit"> <i
												class="ti ti-edit"></i>
											</a>
											<button type="button" data-bs-toggle="modal"
												class="catalog__btn catalog__btn--delete"
												data-bs-target="#modal-delete" data-id="${user.perID}">
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
					<c:if test="${totalPages > 0}">
						<span class="main__paginator-pages">${currentPage} of
							${totalPages}</span>
					</c:if>
					<c:if test="${totalPages == 0}">
						<span class="main__paginator-pages">0 of ${totalPages}</span>
					</c:if>
					<!-- end amount -->
					<!-- Page size selector -->
					<div class="page-size-selector">
						<label for="pageSize"
							style="background-color: #1a191f; color: #333; padding: 5px 10px; border-radius: 5px;">Page
							Size: </label> <select id="pageSize" name="pageSize"
							onchange="updatePageSize(this)"
							style="background-color: #222028; border: #222028; color: white;">
							<option value="5" <c:if test="${pageSize == 5}">selected</c:if>>5</option>
							<option value="10" <c:if test="${pageSize == 10}">selected</c:if>>10</option>
							<option value="15" <c:if test="${pageSize == 15}">selected</c:if>>15</option>
							<option value="20" <c:if test="${pageSize == 20}">selected</c:if>>20</option>
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
							href="<c:if test='${pageNumber > 1}'>${pageContext.request.contextPath}/admin/users?pageNumber=${pageNumber - 1}&pageSize=${pageSize}&searchQuery=${searchQuery}</c:if>">
								<i class="ti ti-chevron-left"></i>
						</a></li>
						<!-- Page numbers -->
						<c:if test="${totalPages > 0}">
							<ul class="pagination">

								<!-- Nút Previous -->
								<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
									<a class="page-link"
									href="${currentPage > 1 ? pageContext.request.contextPath + '/admin/users?pageNumber=' + (currentPage - 1) + '&pageSize=' + pageSize + '&searchQuery=' + searchQuery : '#'}">&laquo;</a>
								</li>

								<c:if test="${totalPages > 0}">
							<c:forEach var="i" begin="0" end="${totalPages - 1}">
								<li
									class="paginator__item  ${i+1 == currentPage ? 'paginator__item--active' : ''}">
									<a
									href="${pageContext.request.contextPath}/admin/users?pageNumber=${i + 1}&pageSize=${pageSize}&searchQuery=${searchQuery}">
										${i + 1} </a>
								</li>
							</c:forEach>
						</c:if>

								<!-- Nút Next -->
								<li
									class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
									<a class="page-link"
									href="${currentPage < totalPages ? pageContext.request.contextPath + '/admin/users?pageNumber=' + (currentPage + 1) + '&pageSize=' + pageSize + '&searchQuery=' + searchQuery : '#'}">&raquo;</a>
								</li>

							</ul>
						</c:if>

						<!-- Next button -->
						<li class="paginator__item paginator__item--next"><a
							href="<c:if test='${pageNumber < totalPages}'>${pageContext.request.contextPath}/admin/users?pageNumber=${pageNumber + 1}&pageSize=${pageSize}&searchQuery=${searchQuery}</c:if>">
								<i class="ti ti-chevron-right"></i>
						</a></li>
					</ul>

				</div>
				<!-- end paginator -->
			</div>
		</div>
</main>
<!-- end main content -->


<!-- delete modal -->
<div class="modal fade" id="modal-delete" tabindex="-1"
	aria-labelledby="modal-delete" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal__content">
				<form action="${pageContext.request.contextPath}/admin/users/delete"
					method="POST" class="modal__form_delete">
					<h4 class="modal__title">User delete</h4>

					<p class="modal__text">Are you sure to permanently delete this
						user?</p>
					<!-- Hidden input for user ID -->
					<input type="hidden" id="deleteUserId" name="userId" value="">
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
		var pageNumber =  1; // Default to 1
		urlParams.set('pageSize', pageSize); // Update the page size query param
		urlParams.set('pageNumber', pageNumber);

		// Use window.location.href to reload the page with the updated query params
		window.location.href = window.location.pathname + '?'
				+ urlParams.toString();
	}
	
	
	// Láº¯ng nghe sá»± kiá»n khi má» Modal
	document.addEventListener("DOMContentLoaded", function () {
	    const deleteButtons = document.querySelectorAll(".catalog__btn--delete"); // NÃºt má» modal xÃ³a
	    const modalForm = document.querySelector(".modal__form_delete"); // Form trong modal
	    console.log("Action attribute: ", modalForm.getAttribute("action"));
	    console.log("modalForm : " + modalForm);
	    deleteButtons.forEach(button => {
	        button.addEventListener("click", function () {
	            const userId = this.getAttribute("data-id"); // Láº¥y userId tá»« attribute
	            console.log("userID : " + userId);
	            const baseFormAction = modalForm.getAttribute("action"); // URL ban Äáº§u cá»§a form
	            console.log("baseFormAction : " + baseFormAction);
	            const link = baseFormAction+'?userId='+userId;
	            console.log("link : " + link);
	            modalForm.setAttribute("action", link); 
	        });
	    });
	});
</script>
