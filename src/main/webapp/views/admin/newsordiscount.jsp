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
						<!-- search -->
<!-- 												<form action="#" class="main__title-form"> -->
<!-- 													<input type="text" placeholder="Find...Not Code Yet"> -->
<!-- 													<button type="button"> -->
<!-- 														<i class="ti ti-search"></i> -->
<!-- 													</button> -->
<!-- 												</form> -->
						<form action="${pageContext.request.contextPath}/adminnewsOrDiscounts" class="main__title-form" method="get">
							<input type="text" name="search" placeholder="Search by title"
								value="${param.search}">
							<button type="submit">
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
												<a href="javascript:void(0);"
													onclick="showDescriptionFromElement(this);"
													data-description="<c:out value="${newsOrDiscount.detail}" />"
													class="catalog__btn catalog__btn--edit"> <i
													class="ti ti-eye"></i>
												</a> <a
													href="<c:url value='/adminnewsOrDiscountedit?id=${newsOrDiscount.newsID }'/>"
													class="catalog__btn catalog__btn--edit"> <i
													class="ti ti-edit"></i>
												</a> <a href="javascript:void(0);"
													onclick="setDeleteId('${newsOrDiscount.newsID}');"
													data-bs-toggle="modal"
													class="catalog__btn catalog__btn--delete"
													data-bs-target="#modal-delete"> <i class="ti ti-trash"></i>
												</a>
											</div>
										</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- end items -->

			<!-- paginator -->
<!-- 						<div class="col-12"> -->
<!-- 							<div class="main__paginator"> -->
<!-- 								amount <span class="main__paginator-pages">10 of 169</span> end -->
<!-- 								amount -->

<!-- 								<ul class="main__paginator-list"> -->
<!-- 									<li><a href="#"> <i class="ti ti-chevron-left"></i> <span>Prev</span> -->
<!-- 									</a></li> -->
<!-- 									<li><a href="#"> <span>Next</span> <i -->
<!-- 											class="ti ti-chevron-right"></i> -->
<!-- 									</a></li> -->
<!-- 								</ul> -->

<!-- 								<ul class="paginator"> -->
<!-- 									<li class="paginator__item paginator__item--prev"><a href="#"><i -->
<!-- 											class="ti ti-chevron-left"></i></a></li> -->
<!-- 									<li class="paginator__item"><a href="#">1</a></li> -->
<!-- 									<li class="paginator__item paginator__item--active"><a -->
<!-- 										href="#">2</a></li> -->
<!-- 									<li class="paginator__item"><a href="#">3</a></li> -->
<!-- 									<li class="paginator__item"><a href="#">4</a></li> -->
<!-- 									<li class="paginator__item"><span>...</span></li> -->
<!-- 									<li class="paginator__item"><a href="#">29</a></li> -->
<!-- 									<li class="paginator__item"><a href="#">30</a></li> -->
<!-- 									<li class="paginator__item paginator__item--next"><a href="#"><i -->
<!-- 											class="ti ti-chevron-right"></i></a></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
            <!-- paginator -->
            <div class="col-12">
                <div class="main__paginator">
                    <c:if test="${totalPages > 0}">
                        <span class="main__paginator-pages">${currentPage + 1} of ${totalPages}</span>
                        <ul class="main__paginator-list">
                            <li><a href="${pageContext.request.contextPath}/adminnewsOrDiscounts?page=${currentPage - 1 > 0 ? currentPage - 1 : 0}&search=${param.search}">
                                <i class="ti ti-chevron-left"></i> <span>Prev</span>
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/adminnewsOrDiscounts?page=${currentPage + 1 < totalPages ? currentPage + 1 : totalPages - 1}&search=${param.search}">
                                <span>Next</span> <i class="ti ti-chevron-right"></i>
                            </a></li>
                        </ul>
                        <ul class="paginator">
                            <li class="paginator__item paginator__item--prev">
                                <a href="${pageContext.request.contextPath}/adminnewsOrDiscounts?page=${currentPage - 1 > 0 ? currentPage - 1 : 0}&search=${param.search}">
                                    <i class="ti ti-chevron-left"></i>
                                </a>
                            </li>
                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                <li class="paginator__item ${i == currentPage ? 'paginator__item--active' : ''}">
                                    <a href="${pageContext.request.contextPath}/adminnewsOrDiscounts?page=${i}&search=${param.search}">${i + 1}</a>
                                </li>
                            </c:forEach>
                            <li class="paginator__item paginator__item--next">
                                <a href="${pageContext.request.contextPath}/adminnewsOrDiscounts?page=${currentPage + 1 < totalPages ? currentPage + 1 : totalPages - 1}&search=${param.search}">
                                    <i class="ti ti-chevron-right"></i>
                                </a>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${totalPages == 0}">
                        <span class="main__paginator-pages">No pages available....</span>
                    </c:if>
                </div>
            </div>
            <!-- end paginator -->
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
								const deleteUrl = contextPath
										+ '/adminnewsOrDiscountdelete?id='
										+ deleteId;

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