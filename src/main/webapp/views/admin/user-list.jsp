<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- main content -->
<main class="container-fluid">
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Users</h2>

					<span class="main__title-stat">${userTotal } Total</span>

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
							<th>PHONE</th>
							<th>BIRTHDATE</th>
							<th>GENDER</th>
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
											<img src="${pageContext.request.contextPath}/assets2/img/user.svg" alt="">
										</div>
										<div class="catalog__meta">
											<h3>${user.fullName }</h3>
											<span>${user.email }</span>
										</div>
									</div>
								</td>
								<td><div class="catalog__text">${user.phone }</div></td>
								<fmt:formatDate value="${user.birthDate}" pattern="dd-MM-yyyy"
												var="birthDateFormatted" />
								<td><div class="catalog__text">${birthDateFormatted }</div></td>
								<td>
									<div class="catalog__text">
										<c:choose>
											<c:when test="${user.gender == 1}">
												Male
											</c:when>
											<c:otherwise>
												Female
											</c:otherwise>
										</c:choose>
									</div>
								</td>

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
					<div class="col-1.02">
						<label class="sign__label" for="pageSize">Page Size: </label> <select
							class="sign__select" id="pageSize" name="pageSize"
							onchange="updatePageSize(this)">
						<option value="5" <c:if test="${pageSize == 5}">selected</c:if>>5
							items</option>
						<option value="10" <c:if test="${pageSize == 10}">selected</c:if>>10
							items</option>
						<option value="15" <c:if test="${pageSize == 15}">selected</c:if>>15
							items</option>
						<option value="20" <c:if test="${pageSize == 20}">selected</c:if>>20
							items</option>
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
						<li
								class="paginator__item paginator__item--prev ${currentPage == 1 ? 'disabled' : ''}">
							<c:choose>
								<c:when test="${currentPage > 1}">
									<a
											href="<c:url value='/admin/users'>
                    <c:param name='pageNumber' value='${currentPage - 1}'/>
                    <c:param name='pageSize' value='${pageSize}'/>
                    <c:if test="${not empty searchQuery}">
                        <c:param name='searchQuery' value='${searchQuery}'/>
                    </c:if>
                </c:url>">
										<i class="ti ti-chevron-left"></i>
									</a>
								</c:when>
								<c:otherwise>
									<a href="#"> <i class="ti ti-chevron-left"></i>
									</a>
								</c:otherwise>
							</c:choose>
						</li>

						<!-- Display first page and ellipsis if needed -->
						<c:if test="${currentPage > 3}">
							<li class="paginator__item"><a
									href="<c:url value='/admin/users'>
                <c:param name='pageNumber' value='1'/>
                <c:param name='pageSize' value='${pageSize}'/>
                <c:if test="${not empty searchQuery}">
                    <c:param name='searchQuery' value='${searchQuery}'/>
                </c:if>
            </c:url>">1</a>
							</li>
							<li class="paginator__item" style = "color : white;">...</li>
						</c:if>

						<!-- Page numbers around current page -->
						<c:set var="startPage"
							   value="${currentPage  > 1 ? currentPage  : 1}" />
						<c:set var="endPage"
							   value="${currentPage + 1 < totalPages ? currentPage + 1 : totalPages}" />
						<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
							<li
									class="paginator__item ${pageNum == currentPage ? 'paginator__item--active' : ''}">
								<a
										href="<c:url value='/admin/users'>
                <c:param name='pageNumber' value='${pageNum}'/>
                <c:param name='pageSize' value='${pageSize}'/>
                <c:if test="${not empty searchQuery}">
                    <c:param name='searchQuery' value='${searchQuery}'/>
                </c:if>
            </c:url>">${pageNum}</a>
							</li>
						</c:forEach>

						<!-- Display last page and ellipsis if needed -->
						<c:if test="${currentPage < totalPages - 2}">
							<li class="paginator__item" style = "color : white;">...</li>
							<li class="paginator__item"><a
									href="<c:url value='/admin/users'>
                <c:param name='pageNumber' value='${totalPages}'/>
                <c:param name='pageSize' value='${pageSize}'/>
                <c:if test="${not empty searchQuery}">
                    <c:param name='searchQuery' value='${searchQuery}'/>
                </c:if>
            </c:url>">${totalPages}</a>
							</li>
						</c:if>

						<!-- Next button -->
						<li
								class="paginator__item paginator__item--next ${currentPage == totalPages ? 'disabled' : ''}">
							<c:choose>
								<c:when test="${currentPage < totalPages}">
									<a
											href="<c:url value='/admin/users'>
                    <c:param name='pageNumber' value='${currentPage + 1}'/>
                    <c:param name='pageSize' value='${pageSize}'/>
                    <c:if test="${not empty searchQuery}">
                        <c:param name='searchQuery' value='${searchQuery}'/>
                    </c:if>
                </c:url>">
										<i class="ti ti-chevron-right"></i>
									</a>
								</c:when>
								<c:otherwise>
									<a href="#"> <i class="ti ti-chevron-right"></i>
									</a>
								</c:otherwise>
							</c:choose>
						</li>
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


	// Lắng nghe sự kiện khi mở Modal
	document.addEventListener("DOMContentLoaded", function () {
		const deleteButtons = document.querySelectorAll(".catalog__btn--delete"); // Nút mở modal xóa
		const modalForm = document.querySelector(".modal__form_delete"); // Form trong modal
		console.log("Action attribute: ", modalForm.getAttribute("action"));
		console.log("modalForm : " + modalForm);
		deleteButtons.forEach(button => {
			button.addEventListener("click", function () {
				const userId = this.getAttribute("data-id"); // Lấy userId từ attribute
				console.log("userID : " + userId);
				const baseFormAction = modalForm.getAttribute("action"); // URL ban đầu của form
				console.log("baseFormAction : " + baseFormAction);
				const link = baseFormAction+'?userId='+userId;
				console.log("link : " + link);
				modalForm.setAttribute("action", link);
			});
		});
	});
</script>