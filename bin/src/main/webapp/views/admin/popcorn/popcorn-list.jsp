<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->



<!-- main content -->
<main class="container-fluid">
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Popcorns</h2>

					<span class="main__title-stat">3,702 Total</span>

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
									<td><div class="catalog__text">${popcorn.price }</div></td>
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
							href="<c:if test='${pageNumber > 1}'>${pageContext.request.contextPath}/admin/popcorns?pageNumber=${pageNumber - 1}&pageSize=${pageSize}&searchQuery=${searchQuery}</c:if>">
								<i class="ti ti-chevron-left"></i>
						</a></li>
						<!-- Page numbers -->
						<c:if test="${totalPages > 0}">
							<c:forEach var="i" begin="0" end="${totalPages - 1}">
								<li
									class="paginator__item  ${i+1 == currentPage ? 'paginator__item--active' : ''}">
									<a
									href="${pageContext.request.contextPath}/admin/popcorns?pageNumber=${i + 1}&pageSize=${pageSize}&searchQuery=${searchQuery}">
										${i + 1} </a>
								</li>
							</c:forEach>
						</c:if>
						<!-- Next button -->
						<li class="paginator__item paginator__item--next"><a
							href="<c:if test='${pageNumber < totalPages}'>${pageContext.request.contextPath}/admin/popcorns?pageNumber=${pageNumber + 1}&pageSize=${pageSize}&searchQuery=${searchQuery}</c:if>">
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
									<option value="Small">Small</option>
									<option value="Regular">Regular</option>
									<option value="Large">Large</option>
									<option value="Extra Large">Extra Large</option>
								</select>
							</div>
						</div>

						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="status">Status</label> <select
									class="sign__selectjs" name="status" id="status" required style="color: white; width: 320px;">
									<option value="1" ${popcorn.status == 1 ? 'selected' : ''}>Available</option>
									<option value="0" ${popcorn.status == 0 ? 'selected' : ''}>Unavailable</option>
								</select>
							</div>
						</div>

						<div class="col-12">
							<button type="submit" class="sign__btn sign__btn--small" style="width: 320px;">
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
									required "
									style="color: white; font-weight: bold; width: 320px;">
									<option value="Small" style="color: white; font-weight: bold;">Small</option>
									<option value="Regular"
										style="color: white; font-weight: bold;">Regular</option>
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
									style="color: white; font-weight: bold; width: 320px;">
									<option value="true" style="color: white; font-weight: bold;">Available</option>
									<option value="false" style="color: white; font-weight: bold;">Unavailable</option>
								</select>
							</div>
						</div>

						<div class="col-12">
							<button type="submit" class="sign__btn sign__btn--small" style="width: 320px;">
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
	
	
	// Lắng nghe sự kiện khi mở Modal
	document.addEventListener("DOMContentLoaded", function () {
	    const deleteButtons = document.querySelectorAll(".catalog__btn--delete"); // Nút mở modal xóa
	    const modalForm = document.querySelector(".modal__form_delete"); // Form trong modal
	    deleteButtons.forEach(button => {
	        button.addEventListener("click", function () {
	            const popcornID = this.getAttribute("data-id"); // Lấy userId từ attribute
	            const baseFormAction = modalForm.getAttribute("action"); // URL ban đầu của form
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
	        // Lấy giá trị của popcornID
	        var popcornID = popcornIDField.value;
	        
	        const baseFormAction = form.getAttribute("action"); // URL ban đầu của form
            const link = baseFormAction+'?popcornID='+popcornID;
	        // Gán giá trị vào URL của action
	        form.action = link
	        console.log("url : " + form.action )
	    });
	});
	
	
	
	document.addEventListener('DOMContentLoaded', function () {
	    // Lắng nghe sự kiện khi modal được hiển thị
	    var editModal = document.getElementById('modal-edit');
	    editModal.addEventListener('show.bs.modal', function (event) {
	        // Nút kích hoạt modal
	        var button = event.relatedTarget;
	        
	        // Lấy thông tin từ data-attribute
	        var popcornID = button.getAttribute('data-id');
	        var popcornType = button.getAttribute('data-type');
	        var popcornName = button.getAttribute('data-name');
	        var popcornPrice = button.getAttribute('data-price');
	        var popcornStatus = button.getAttribute('data-status');
	        
	        // Điền thông tin vào các trường trong modal
	        var modalPopcornType = editModal.querySelector('#typePopCorn');
	        var modalPopcornPrice = editModal.querySelector('#price');
	        var modalPopcornName = editModal.querySelector('#namePopCorn');
	        var modalPopcornStatus = editModal.querySelector('#status');
	        var modalPopcornID = editModal.querySelector('#popcornID-edit');
	        
	        modalPopcornID.value = popcornID;
	        modalPopcornType.value = popcornType;
	        modalPopcornPrice.value = popcornPrice;
	        modalPopcornName.value = popcornName;
	        modalPopcornStatus.value = popcornStatus;
	      console.log("popcornID" + popcornID);
	      console.log("popcornType" + popcornType);
	      console.log("popcornName" + popcornName);
	      console.log("popcornPrice" + popcornPrice);
	      console.log("popcornStatus" + popcornStatus);
	      
	      

	    });
	});

</script>