<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- main content -->
	<div class="container-fluid">
		<div class="row">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>News And Discount</h2>

					<!-- <span class="main__title-stat">14,452 Total</span> -->

					<div class="main__title-wrap">
						<a
							href="${pageContext.request.contextPath}/adminnewsOrDiscountadd"
							class="main__title-link main__title-link--wrap">Add item</a>

						<!-- <select class="filter__select" name="sort" id="filter__sort">
								<option value="0">Date created</option>
								<option value="1">Rating</option>
								<option value="2">Views</option>
							</select> -->

						<!-- search -->
						<form action="#" class="main__title-form">
							<input type="text" placeholder="Find...Not Code Yet">
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
								<th>Description</th>
								<th>Images</th>
								<th>Author</th>
								<th>Date</th>
								<th>Actions</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<c:forEach items="${listNewsOrDiscount}" var="newsOrDiscount"
									varStatus="loopStatus">
									<tr>
										<td>
											<div class="catalog__text">${loopStatus.index + 1}</div>
										</td>
										<td>
											<div class="catalog__text">${newsOrDiscount.title}</div>
										</td>
										<td>
											<div class="catalog__text">${newsOrDiscount.description}</div>
										</td>

										<td><c:choose>
												<c:when
													test="${newsOrDiscount.images.substring(0,5) != 'https'}">
													<c:url value="/image?fname=${newsOrDiscount.images}"
														var="imgUrl" />
												</c:when>
												<c:otherwise>
													<c:set var="imgUrl" value="${newsOrDiscount.images}" />
												</c:otherwise>
											</c:choose>
											<div class="catalog__text">
												<img src="${imgUrl}" alt="${newsOrDiscount.title}"
													width="150" height="150" />
											</div></td>
										<td>
											<div class="catalog__text">${newsOrDiscount.author}</div>
										</td>

										<td>
											<div class="catalog__text">
												<fmt:formatDate value="${newsOrDiscount.date}"
													pattern="yyyy-MM-dd" />
											</div>
										</td>

										<c:set var="formattedDetail"
											value="${fn:escapeXml(newsOrDiscount.detail)}" />


										<td>
											<div class="catalog__btns">
												<!-- 												<a href="javascript:void(0);" -->
												<%-- 														onclick="showDescription('${newsOrDiscount.detail}');" --%>
												<!-- 													class="catalog__btn catalog__btn--edit"> <i -->
												<!-- 													class="ti ti-eye"></i> -->
												<!-- 												</a> -->
												<a href="javascript:void(0);"
													onclick="showDescriptionFromElement(this);"
													data-description="<c:out value="${newsOrDiscount.detail}" />"
													class="catalog__btn catalog__btn--edit"> <i
													class="ti ti-eye"></i>
												</a> <a
													href="<c:url value='/adminnewsOrDiscountedit?id=${newsOrDiscount.newsID }'/>"
													class="catalog__btn catalog__btn--edit"> <i
													class="ti ti-edit"></i>
												</a>
												<%-- 												<a href="<c:url value='/adminnewsOrDiscountdelete?id=${newsOrDiscount.newsID}' />"> --%>
												<!-- 													<button type="button" data-bs-toggle="modal" -->
												<!-- 														class="catalog__btn catalog__btn--delete" -->
												<!-- 														data-bs-target="#modal-delete"> -->
												<!-- 														<i class="ti ti-trash"></i> -->
												<!-- 													</button> -->
												<!-- 												</a> -->
												<a href="javascript:void(0);"
													onclick="setDeleteId('${newsOrDiscount.newsID}');"
													data-bs-toggle="modal"
													class="catalog__btn catalog__btn--delete"
													data-bs-target="#modal-delete"> <i class="ti ti-trash"></i>
												</a>
											</div>
										</td>
								</c:forEach>
								<!-- 									<td> -->
								<!-- 										<div class="catalog__text">1</div> -->
								<!-- 									</td> -->
								<!-- 									<td> -->
								<!-- 										<div class="catalog__text"> -->

								<!-- 										</div> -->
								<!-- 									</td> -->
								<!-- 									<td> -->
								<!-- 										<div class="catalog__text">Movie</div> -->
								<!-- 									</td> -->
								<!-- 									<td> -->
								<!-- 										<div class="catalog__text"> -->
								<!-- 											<img -->
								<!-- 												src="https://i.pinimg.com/236x/60/52/7e/60527e7b1168ab96af4bc4a402ec0300--anime-princess-ren.jpg" -->
								<!-- 												alt="Image Description" style="width: 75px; height: 75px;"> -->
								<!-- 										</div> -->
								<!-- 									</td> -->
								<!-- 									<td> -->
								<!-- 										<div class="catalog__text catalog__text--green"> -->
								<!-- 											<img -->
								<!-- 												src="https://th.bing.com/th/id/OIP.TeBA_Y7VB4E3BJiHZdR5mwHaEj?rs=1&pid=ImgDetMain" -->
								<!-- 												alt="Image Description" style="width: 75px; height: 75px;"> -->
								<!-- 										</div> -->
								<!-- 									</td> -->
								<!-- 									<td> -->
								<!-- 										<div class="catalog__text">05.02.2023</div> -->
								<!-- 									</td> -->
								<!-- 								<td> -->
								<!-- 									<div class="catalog__btns"> -->
								<!-- 										<a -->
								<%-- 											href="<c:url value='/admin/newsOrDiscount/edit?id=${newsOrDiscount.newsID }'/>" --%>
								<!-- 											class="catalog__btn catalog__btn--edit"> <i -->
								<!-- 											class="ti ti-edit"></i> -->
								<!-- 										</a> <a> -->
								<!-- 											<button type="button" data-bs-toggle="modal" -->
								<!-- 												class="catalog__btn catalog__btn--delete" -->
								<!-- 												data-bs-target="#modal-delete"> -->
								<!-- 												<i class="ti ti-trash"></i> -->
								<!-- 											</button> -->
								<!-- 										</a> -->
								<!-- 									</div> -->
								<!-- 								</td> -->
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
						<li><a href="#"> <i class="ti ti-chevron-left"></i> <span>Prev</span>
						</a></li>
						<li><a href="#"> <span>Next</span> <i
								class="ti ti-chevron-right"></i>
						</a></li>
					</ul>

					<ul class="paginator">
						<li class="paginator__item paginator__item--prev"><a href="#"><i
								class="ti ti-chevron-left"></i></a></li>
						<li class="paginator__item"><a href="#">1</a></li>
						<li class="paginator__item paginator__item--active"><a
							href="#">2</a></li>
						<li class="paginator__item"><a href="#">3</a></li>
						<li class="paginator__item"><a href="#">4</a></li>
						<li class="paginator__item"><span>...</span></li>
						<li class="paginator__item"><a href="#">29</a></li>
						<li class="paginator__item"><a href="#">30</a></li>
						<li class="paginator__item paginator__item--next"><a href="#"><i
								class="ti ti-chevron-right"></i></a></li>
					</ul>
				</div>
			</div>
			<!-- end paginator -->
		</div>
	</div>
	<!-- end main content -->

	<style>
.modal__btns {
	display: flex;
	justify-content: center;
	margin-top: 20px; /* Khoảng cách phía trên nút */
}

.modal__btn {
	padding: 10px 20px;
	background-color: #333; /* Màu nền cho nút */
	color: #fff; /* Màu chữ cho nút */
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.modal__btn:hover {
	background-color: #555; /* Màu nền khi hover */
}
</style>

	<!-- 		<div class="modal" id="modal-description" tabindex="-1" -->
	<!-- 			aria-labelledby="modal-description" aria-hidden="true"> -->
	<!-- 			<div class="modal__content"> -->
	<!-- 				<h4 class="modal__title">Detail</h4> -->
	<!-- 				<p id="descriptionContent" class="modal__text"></p> -->
	<!-- 				<div class="modal__btns text-center"> -->
	<!-- 					<button class="btn btn-secondary" type="button" -->
	<!-- 						data-bs-dismiss="modal" aria-label="Close"> -->
	<!-- 						<span>Close</span> -->
	<!-- 					</button> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<div class="modal" id="modal-description" tabindex="-1"
		aria-labelledby="modal-description" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal__content">
				<div class="modal-header">
					<h4 class="modal__title">Detail</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p id="descriptionContent" class="modal__text"></p>
				</div>
				<div class="modal-footer text-center">
					<button class="modal__btns text-center" type="button"
						data-bs-dismiss="modal" aria-label="Close">Close</button>
				</div>
			</div>
		</div>
	</div>

	<style>
/* Tùy chỉnh modal */
#modal-description .modal__content {
	background-color: #2c2c2c; /* Nền tối */
	color: #ffffff; /* Màu chữ */
	padding: 20px;
	border-radius: 8px;
}

/* Tùy chỉnh tiêu đề */
#modal-description .modal__title {
	color: #ffffff;
	font-size: 1.5rem;
	font-weight: bold;
	margin-bottom: 15px;
}

/* Tùy chỉnh nội dung văn bản */
#modal-description .modal__text {
	color: #dcdcdc;
	font-size: 1rem;
	line-height: 1.6;
}

/* Tùy chỉnh nút Close */
#modal-description .modal-footer .modal__btns {
	background-color: #444;
	color: #ffffff;
	border: 1px solid #888;
	padding: 10px 20px;
	font-size: 1rem;
	border-radius: 5px;
	cursor: pointer;
}

/* Hiệu ứng khi hover cho nút Close */
#modal-description .modal-footer .modal__btns:hover {
	background-color: #555;
	border-color: #aaa;
}

/* Tùy chỉnh nút đóng (btn-close) ở góc modal */
#modal-description .btn-close {
	color: #ffffff;
	opacity: 1;
}

#modal-description .btn-close:hover {
	color: #ff0000; /* Đổi màu thành đỏ khi hover */
}
</style>

	<!-- 	<!-- delete modal -->
	-->
	<!-- 	<div class="modal fade" id="modal-delete" tabindex="-1" -->
	<!-- 		aria-labelledby="modal-delete" aria-hidden="true"> -->
	<!-- 		<div class="modal-dialog modal-dialog-centered"> -->
	<!-- 			<div class="modal-content"> -->
	<!-- 				<div class="modal__content"> -->
	<!-- 					<form action="#" class="modal__form"> -->
	<!-- 						<h4 class="modal__title">Item delete</h4> -->

	<!-- 						<p class="modal__text">Are you sure to permanently delete this -->
	<!-- 							item?</p> -->

	<!-- 						<div class="modal__btns"> -->
	<!-- 							<button class="modal__btn modal__btn--apply" type="button"> -->
	<!-- 								<span>Delete</span> -->
	<!-- 							</button> -->
	<!-- 							<button class="modal__btn modal__btn--dismiss" type="button" -->
	<!-- 								data-bs-dismiss="modal" aria-label="Close"> -->
	<!-- 								<span>Dismiss</span> -->
	<!-- 							</button> -->
	<!-- 						</div> -->
	<!-- 					</form> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<!-- end delete modal -->
	-->
	<!-- delete modal -->
	<div class="modal fade" id="modal-delete" tabindex="-1"
		aria-labelledby="modal-delete" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal__content">
					<form action="#" class="modal__form">
						<input type="hidden" id="delete-id" name="delete-id">

						<h4 class="modal__title">Item delete</h4>
						<p class="modal__text">Are you sure to permanently delete this
							item?</p>

						<div class="modal__btns">
							<button id="confirm-delete" class="modal__btn modal__btn--apply"
								type="button">
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

	<script>
		// Lấy contextPath để sử dụng trong JavaScript
		const contextPath = '${pageContext.request.contextPath}';

		function setDeleteId(id) {
			// Lưu id của item cần xóa vào input hidden trong modal
			document.getElementById('delete-id').value = id;
		}

		document
				.getElementById('confirm-delete')
				.addEventListener(
						'click',
						function() {
							// Lấy id của item cần xóa từ input hidden
							const deleteId = document
									.getElementById('delete-id').value;

							if (deleteId) {
								// Tạo URL xóa với id
// 								const deleteUrl = `${contextPath}/adminnewsOrDiscountdelete?id=${deleteId}`;
								const deleteUrl = contextPath + '/adminnewsOrDiscountdelete?id=' + deleteId;

								// Điều hướng trình duyệt đến URL xóa
								window.location.href = deleteUrl;
							} else {
								console
										.error('ID không tồn tại, không thể thực hiện xóa.');
							}
						});
	</script>


	<script>
		function showDescriptionFromElement(element) {
			// Lấy dữ liệu description từ thuộc tính data-description
			var description = element.getAttribute("data-description");

			// Thay thế các ký tự xuống dòng trong mô tả thành thẻ <br> để hiển thị đúng trong HTML
			description = description.replace(/(?:\r\n|\r|\n)/g, '<br>');

			// Đặt nội dung đã xử lý vào modal và hiển thị
			document.getElementById('descriptionContent').innerHTML = description;
			var myModal = new bootstrap.Modal(document
					.getElementById('modal-description'));
			myModal.show();
		}
	</script>

	<!-- JS -->
	<script src="/assets2/js/bootstrap.bundle.min.js"></script>
	<script src="/assets2/js/slimselect.min.js"></script>
	<script src="/assets2/js/smooth-scrollbar.js"></script>
	<script src="/assets2/js/admin.js"></script>



	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>