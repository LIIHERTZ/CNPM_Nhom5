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
</head>
<body>
<!-- main content -->
<div class="container-fluid">
	<div class="row">
		<!-- main title -->
		<div class="col-12">
			<div class="main__title">
				<h2>Edit Your News Or Discount Here!</h2>
			</div>
		</div>

		<div class="col-12">
			<a href="${pageContext.request.contextPath}/adminnewsOrDiscounts"
			   class="sign__btn sign__btn--small"
			   style="text-align: center; display: inline-block;"><span>Back to News Or Discount</span></a>
		</div>
		<!-- end main title -->

		<!-- form -->
		<div class="col-12">
			<!-- 				<form action="#" class="sign__form sign__form--add"> -->
			<form
					action="${pageContext.request.contextPath}/adminnewsOrDiscountupdate"
					method="post" enctype="multipart/form-data"
					class="sign__form sign__form--add">
				<input type="hidden" name="newsID" value="${newsOrDiscount.newsID}">
				<div class="row">
					<div class="col-12 col-xl-12">
						<div class="row">
							<div class="col-12">
								<div class="sign__group">
									<!--
                                                                                <input type="text" class="sign__input" placeholder="Title"> -->
									<label class="sign__label">Title</label>
									<input type="text" name="title" class="sign__input"
										   placeholder="Title" value="${newsOrDiscount.title}" required>
								</div>
							</div>

							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label">Description</label>
									<input type="text" name="description" class="sign__input"
										   placeholder="Short Description"
										   value="${newsOrDiscount.description}" required>
								</div>
							</div>

							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label">Author</label>
									<input type="text" name="author" class="sign__input"
										   placeholder="Author" value="${newsOrDiscount.author}" required>
								</div>
							</div>

							<div class="col-12">
								<div class="sign__group">
									<label class="sign__label">Detail</label>
									<textarea name="detail" class="sign__textarea"
											  placeholder="Detail" style="width: 100%; height: 200px;" required>${newsOrDiscount.detail}</textarea>
								</div>
							</div>

							<div class="row align-items-center"
								 style="display: flex; align-items: center;">
								<!-- Hộp thoại yêu cầu nhập ngày -->
								<div class="col-md-4">
									<label for="publish-date" class="form-label"
										   style="font-weight: bold; color: white;">Please enter
										the publish date:</label>
								</div>
								<!-- Ô chọn ngày -->
								<div class="col-md-6">
									<div class="sign__group">
										<fmt:formatDate value="${newsOrDiscount.date}"
														pattern="yyyy-MM-dd" var="formattedDate" />
										<input type="date" id="publish-date" class="sign__input"
											   name="date" placeholder="Select date"
											   value="${formattedDate}" required>

									</div>
								</div>
							</div>

						</div>
					</div>

					<div class="col-6">
						<div class="sign__group">
							<div class="sign__gallery">
								<label id="gallery1" for="sign__gallery-upload">Upload
									cover (240x340)</label> <input data-name="#gallery1"
																   id="sign__gallery-upload" name="images"
																   class="sign__gallery-upload" type="file"
																   accept=".png, .jpg, .jpeg" style="display: none;"
																   onchange="chooseFile(this)" value="${newsOrDiscount.images}">
								<input type="hidden" name="oldImage"
									   value="${newsOrDiscount.images}">
							</div>
							<div class="col-12">
								<button type="submit" class="sign__btn sign__btn--small">
									<span>Update</span>
								</button>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div id="image-preview-container" style="margin-left: 20px;">
							<c:choose>
								<c:when
										test="${newsOrDiscount.images.substring(0,5) != 'https'}">
									<c:url value="/image?fname=${newsOrDiscount.images}"
										   var="imgUrl"></c:url>
								</c:when>
								<c:otherwise>
									<c:set var="imgUrl" value="${newsOrDiscount.images}" />
								</c:otherwise>
							</c:choose>
							<img id="preview-image" src="${imgUrl}"
								 style="width: 400px; height: 400px;" />
						</div>
					</div>


				</div>
			</form>
		</div>
		<!-- end form -->
	</div>
</div>
<!-- end main content -->

<script>
	function chooseFile(input) {
		const preview = document.getElementById('preview-image');
		const file = input.files[0];

		if (file) {
			const reader = new FileReader();
			reader.onload = function(e) {
				preview.src = e.target.result;
				preview.style.display = 'block'; // Hiển thị ảnh xem trước
			};
			reader.readAsDataURL(file);
		} else {
			preview.style.display = 'none'; // Ẩn ảnh xem trước nếu không có file
		}
	}
</script>

<script>
	document.getElementById('sign__gallery-upload').addEventListener(
			'change', function(event) {
				const preview = document.getElementById('preview-image');
				const file = event.target.files[0];

				if (file) {
					const reader = new FileReader();
					reader.onload = function(e) {
						preview.src = e.target.result;
						preview.style.display = 'block'; // Hiển thị ảnh xem trước
					};
					reader.readAsDataURL(file);
				} else {
					preview.style.display = 'none'; // Ẩn ảnh xem trước nếu không có file
				}
			});
</script>

<!-- JS -->
<script src="${pageContext.request.contextPath}/assets2/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/js/slimselect.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/js/smooth-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets2/js/admin.js"></script>

</body>
</html>