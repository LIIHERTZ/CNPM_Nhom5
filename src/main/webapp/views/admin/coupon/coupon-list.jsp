<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Mirrored from hotflix.volkovdesign.com/admin/users.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:40 GMT -->


<!-- main content -->
<main class="container-fluid"> 
 	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>Coupons</h2>
					<span class="main__title-stat">${couponTotal } Total</span>
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
											<a href="#" class="catalog__btn catalog__btn--edit"
												data-bs-toggle="modal" data-bs-target="#modal-edit"
												data-id="${coupon.couponID}"
												data-name="${coupon.couponName}"
												data-type="${coupon.couponType}"
												data-value="${coupon.couponValue}"
												data-startDate="${coupon.startDate}"
												data-endDate="${coupon.endDate}"> <i class="ti ti-edit"></i>
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
						<label class="sign__label" for="pageSize" >Page Size: </label> 
						<select  class="sign__select" id="pageSize" name="pageSize"
							onchange="updatePageSize(this)">
							<option value="5" <c:if test="${pageSize == 5}">selected</c:if>>5 items</option>
							<option value="10" <c:if test="${pageSize == 10}">selected</c:if>>10 items</option>
							<option value="15" <c:if test="${pageSize == 15}">selected</c:if>>15 items</option>
							<option value="20" <c:if test="${pageSize == 20}">selected</c:if>>20 items</option>
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
							href="<c:if test='${pageNumber > 1}'>${pageContext.request.contextPath}/admin/coupons?pageNumber=${pageNumber - 1}&pageSize=${pageSize}&searchQuery=${searchQuery}</c:if>">
								<i class="ti ti-chevron-left"></i>
						</a></li>
						<!-- Page numbers -->
						<c:if test="${totalPages > 0}">
							<c:forEach var="i" begin="0" end="${totalPages - 1}">
								<li
									class="paginator__item  ${i+1 == currentPage ? 'paginator__item--active' : ''}">
									<a
									href="${pageContext.request.contextPath}/admin/coupons?pageNumber=${i + 1}&pageSize=${pageSize}&searchQuery=${searchQuery}">
										${i + 1} </a>
								</li>
							</c:forEach>
						</c:if>
						<!-- Next button -->
						<li class="paginator__item paginator__item--next"><a
							href="<c:if test='${pageNumber < totalPages}'>${pageContext.request.contextPath}/admin/coupons?pageNumber=${pageNumber + 1}&pageSize=${pageSize}&searchQuery=${searchQuery}</c:if>">
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
									required style="color: white; width: 320px;">
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
									Value</label> <input type="number" class="sign__input"
									name="couponValue" id="couponValue" placeholder="Coupon Value"
									required>
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
							<button type="submit" class="sign__btn sign__btn--small"  style="width: 320px;">
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
<!-- edit coupon modal -->
<div class="modal fade" id="modal-edit" tabindex="-1"
	aria-labelledby="modal-user" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal__content">
				<form
					action="${pageContext.request.contextPath}/admin/coupons/update"
					method="post" class="modal__form" id="edit-coupon-form">
					<h4 class="modal__title">Edit Coupon</h4>

					<div class="row">
						<div class="col-12">
							<div class="sign__group">
								<input type="hidden" class="sign__input" name="couponID-edit"
									id="couponID-edit"> <label class="sign__label"
									for="couponName">Coupon Name</label> <input type="text"
									class="sign__input" name="couponName" id="couponName"
									placeholder="Coupon Name" required
									value="${coupon.couponName }">
							</div>
						</div>
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="couponType">Type</label> <select
									class="sign__selectjs" name="couponType" id="couponType"
									required value="${coupon.couponType }" style="color: white; width: 320px;">
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
									Value</label> <input type="text" class="sign__input" name="couponValue"
									id="couponValue" placeholder="Coupon Value" required
									value="${coupon.couponValue }">
							</div>
							<!-- Định dạng ngày sử dụng JSTL -->
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
						<div class="col-12">
							<div class="sign__group">
								<label class="sign__label" for="endDate">End Date</label> <input
									type="Date" class="sign__input" name="endDate" id="endDate"
									required>
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
	
	
	//edit coupon modal
	document.addEventListener('DOMContentLoaded', function () {
	    var form = document.getElementById('edit-coupon-form');
	    var popcornIDField = document.getElementById('couponID-edit');

	    form.addEventListener('submit', function (event) {
	        // Lấy giá trị của popcornID
	        var couponID = popcornIDField.value;
	        
	        const baseFormAction = form.getAttribute("action"); // URL ban đầu của form
            const link = baseFormAction+'?couponID='+couponID;
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
	        var couponID = button.getAttribute('data-id');
	        var couponType = button.getAttribute('data-type');
	        var couponName = button.getAttribute('data-name');
	        var couponValue = button.getAttribute('data-value');
	        var startDate = button.getAttribute('data-startDate');
	        var endDate = button.getAttribute('data-endDate');
	        
	        // Điền thông tin vào các trường trong modal
	        var modalCouponID = editModal.querySelector('#couponID-edit');
	        var modalCouponType = editModal.querySelector('#couponType');
	        var modalCouponValue = editModal.querySelector('#couponValue');
	        var modalCouponName = editModal.querySelector('#couponName');
	        var modalStartDate = editModal.querySelector('#startDate');
	        var modalEndDate = editModal.querySelector('#endDate');
	        
	        modalCouponID.value = couponID
	        modalCouponType.value = couponType;
	        modalCouponValue.value = couponValue;
	        modalCouponName.value = couponName;
	        // Chuyển định dạng ngày trước khi gán
	        modalStartDate.value =formatDateToInput(startDate);
	        modalEndDate.value = formatDateToInput(endDate);
	        console.log("startDate : " + formatDateToInput(startDate));
	        console.log("endDate : " + formatDateToInput(endDate));
	    });
	});
	
	// Hàm định dạng ngày
	function formatDateToInput(dateString) {
		const datePart = dateString.split(' ')[0];
	    return datePart; // Trả về phần ngày (yyyy-MM-dd)
	}
</script>
