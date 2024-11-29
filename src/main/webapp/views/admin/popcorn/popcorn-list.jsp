<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->



<!-- main content -->
<main class="container-fluid">
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Popcorns</h2>
					<span class="main__title-stat">${popcornTotal } Total</span>

					<div class="main__title-wrap">
						<button type="button" data-bs-toggle="modal"
								class="main__title-link main__title-link--wrap"
								data-bs-target="#modal-user">Add PopCorn</button>
						<!-- search -->
						<form action=" ${pageContext.request.contextPath}/admin/popcorns"
							  method="get" class="main__title-form">
							<input type="text" name="searchQuery" value="${searchQuery}"
								   placeholder="Find popcorn...">
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
							<th>NAME</th>
							<th>TYPE</th>
							<th>PRICE</th>
							<th>STATUS</th>
							<th>ACTIONS</th>
						</tr>
						</thead>

						<tbody>

						<c:forEach var="popcorn" items="${popcorns}">
							<tr>
								<td><div class="catalog__text">${popcorn.popcornID }</div></td>
								<td><div class="catalog__text">${popcorn.namePopCorn }</div></td>
								<td><div class="catalog__text">${popcorn.typePopCorn }</div></td>

								<td><div class="catalog__text"><fmt:formatNumber value="${popcorn.price }"
																				 pattern="#,###" />
									VND</div></td>
								<td><div class="catalog__text">${popcorn.status == true ? 'Available' : 'Unavailable'}</div></td>
								<td>
									<div class="catalog__btns">
										<a href="#" class="catalog__btn catalog__btn--edit"
										   data-bs-toggle="modal" data-bs-target="#modal-edit"
										   data-id="${popcorn.popcornID}"
										   data-type="${popcorn.typePopCorn}"
										   data-name="${popcorn.namePopCorn}"
										   data-price="${popcorn.price}"
										   data-status="${popcorn.status}"> <i class="ti ti-edit"></i>
										</a>
										<button type="button" data-bs-toggle="modal"
												class="catalog__btn catalog__btn--delete"
												data-bs-target="#modal-delete"
												data-id="${popcorn.popcornID}">
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
											href="<c:url value='/admin/popcorns'>
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
									href="<c:url value='/admin/popcorns'>
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
										href="<c:url value='/admin/popcorns'>
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
									href="<c:url value='/admin/popcorns'>
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
											href="<c:url value='/admin/popcorns'>
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

<!-- user modal -->
<div class="modal fade" id="modal-user" tabindex="-1"
	 aria-labelledby="modal-user" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal__content">
				<form
						action="${pageContext.request.contextPath}/admin/popcorns/save "
						method="post" class="modal__form">
					<h4 class="modal__title">Add PopCorn</h4>

					<div class="row">
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="namePopCorn">PopCorn
									Name</label> <input type="text" class="sign__input" name="namePopCorn"
														id="namePopCorn" placeholder="Popcorn Combo Name" required>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="price">Price</label> <input
									type="number" class="sign__input" name="price" id="price"
									placeholder="Price" required>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="typePopCorn">Type</label> <select
									class="sign__selectjs" name="typePopCorn" id="typePopCorn"
									required style="color: white; width: 320px;">
								<option value="Beverage">Beverage</option>
								<option value="Popcorn">Popcorn</option>
								<option value="Combos">Combos</option>
							</select>
							</div>
						</div>

						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="status">Status</label> <select
									class="sign__selectjs" name="status" id="status" required
									style="color: white; width: 320px;">
								<option value="1" ${popcorn.status == 1 ? 'selected' : ''}>Available</option>
								<option value="0" ${popcorn.status == 0 ? 'selected' : ''}>Unavailable</option>
							</select>
							</div>
						</div>

						<div class="col-12">
							<button type="submit" class="sign__btn sign__btn--small"
									style="width: 320px;">
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

<!-- edit popcorn modal -->
<div class="modal fade" id="modal-edit" tabindex="-1"
	 aria-labelledby="modal-user" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal__content">
				<form
						action="${pageContext.request.contextPath}/admin/popcorns/update"
						method="post" class="modal__form" id="edit-popcorn-form">
					<h4 class="modal__title">Edit PopCorn</h4>
					<div class="row">
						<div class="col-12">
							<input type="hidden" class="sign__input" name="popcornID-edit"
								   id="popcornID-edit">
							<div class="sign__group">
								<label class="sign__label" for="namePopCorn">PopCorn
									Name</label> <input type="text" class="sign__input" name="namePopCorn"
														id="namePopCorn" placeholder="Popcorn Combo Name" required>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="price">Price</label> <input
									type="number" class="sign__input" name="price" id="price"
									placeholder="Price" required>
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="typePopCorn">Type</label> <select
									class="sign__selectjs" name="typePopCorn" id="typePopCorn"
									required
									style="color: white; font-weight: bold; width: 320px;">
								<option value="Beverage" style="color: white; font-weight: bold;">Beverage</option>
								<option value="Popcorn"
										style="color: white; font-weight: bold;">Popcorn</option>
								<option value="Combos" style="color: white; font-weight: bold;">Combos</option>
							</select>
							</div>
						</div>

						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="status">Status</label> <select
									class="sign__selectjs" name="status" id="status" required
									style="color: white; font-weight: bold; width: 320px;">
								<option value="1" >Available</option>
								<option value="0" >Unavailable</option>
							</select>
							</div>
						</div>

						<div class="col-12">
							<button type="submit" class="sign__btn sign__btn--small"
									style="width: 320px;">
								<span>Update</span>
							</button>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
</div>

<!-- delete modal -->
<div class="modal fade" id="modal-delete" tabindex="-1"
	 aria-labelledby="modal-delete" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal__content">
				<form
						action="${pageContext.request.contextPath}/admin/popcorns/delete"
						method="POST" class="modal__form_delete">
					<h4 class="modal__title">Service delete</h4>

					<p class="modal__text">Are you sure to permanently delete this
						Service?</p>
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


	// Láº¯ng nghe sá»± kiá»n khi má» Modal
	document.addEventListener("DOMContentLoaded", function () {
		const deleteButtons = document.querySelectorAll(".catalog__btn--delete"); // NÃºt má» modal xÃ³a
		const modalForm = document.querySelector(".modal__form_delete"); // Form trong modal
		deleteButtons.forEach(button => {
			button.addEventListener("click", function () {
				const popcornID = this.getAttribute("data-id"); // Láº¥y userId tá»« attribute
				const baseFormAction = modalForm.getAttribute("action"); // URL ban Äáº§u cá»§a form
				const link = baseFormAction+'?popcornID='+popcornID;
				console.log("link : " + link);
				modalForm.setAttribute("action", link);
			});
		});
	});

	//edit user modal
	document.addEventListener('DOMContentLoaded', function () {
		var form = document.getElementById('edit-popcorn-form');
		var popcornIDField = document.getElementById('popcornID-edit');

		form.addEventListener('submit', function (event) {
			// Láº¥y giÃ¡ trá» cá»§a popcornID
			var popcornID = popcornIDField.value;

			const baseFormAction = form.getAttribute("action"); // URL ban Äáº§u cá»§a form
			const link = baseFormAction+'?popcornID='+popcornID;
			// GÃ¡n giÃ¡ trá» vÃ o URL cá»§a action
			form.action = link
			console.log("url : " + form.action )
		});
	});



	document.addEventListener('DOMContentLoaded', function () {
		// Láº¯ng nghe sá»± kiá»n khi modal ÄÆ°á»£c hiá»n thá»
		var editModal = document.getElementById('modal-edit');
		editModal.addEventListener('show.bs.modal', function (event) {
			// NÃºt kÃ­ch hoáº¡t modal
			var button = event.relatedTarget;

			// Láº¥y thÃ´ng tin tá»« data-attribute
			var popcornID = button.getAttribute('data-id');
			var popcornType = button.getAttribute('data-type');
			var popcornName = button.getAttribute('data-name');
			var popcornPrice = button.getAttribute('data-price');
			var popcornStatus = button.getAttribute('data-status');

			// Äiá»n thÃ´ng tin vÃ o cÃ¡c trÆ°á»ng trong modal
			var modalPopcornType = editModal.querySelector('#typePopCorn');
			var modalPopcornPrice = editModal.querySelector('#price');
			var modalPopcornName = editModal.querySelector('#namePopCorn');
			var modalPopcornStatus = editModal.querySelector('#status');
			var modalPopcornID = editModal.querySelector('#popcornID-edit');

			modalPopcornID.value = popcornID;
			modalPopcornType.value = popcornType;
			modalPopcornPrice.value = popcornPrice;
			modalPopcornName.value = popcornName;
			if(popcornStatus == "true")
			{
				modalPopcornStatus.value = "1";
			}
			else
			{
				modalPopcornStatus.value = "0";
			}
			// modalPopcornStatus.value = popcornStatus;
			console.log("popcornID" + popcornID);
			console.log("popcornType" + popcornType);
			console.log("popcornName" + popcornName);
			console.log("popcornPrice" + popcornPrice);
			console.log("popcornStatus" + popcornStatus);



		});
	});

</script>


