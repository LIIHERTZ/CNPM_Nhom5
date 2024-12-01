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
					<h2>Edit Movie</h2>
				</div>
			</div>

			<div class="col-12">
				<a href="${pageContext.request.contextPath}/admin/movies"
					class="sign__btn sign__btn--small"><span>Back to Movie</span></a>
			</div>
			<!-- end main title -->

			<!-- form -->
			<div class="col-12">
				<form action="${pageContext.request.contextPath}/admin/editMovie"
					method="post" enctype="multipart/form-data"
					class="sign__form sign__form--add">
					<input type="hidden" name="movieID" value="${Movie.movieID}">
					<div class="col-12 col-xl-12">
						<label class="sign__label" for="movie_name">Movie Name</label>
						<div class="sign__group">
							<input type="text" class="sign__input" name="movie_name"
								value="${Movie.movieName}" value="${movie_name}"
								placeholder="Movie Name" required>
						</div>
						<div>
							<div class="sign__group">
								<label class="sign__label" for="category">Category</label> <select
									class="sign__selectjs" name="category" id="sign__genre"
									multiple required>
									<option value="Action"
										<c:if test="${fn:contains(Movie.category, 'Action')}">selected</c:if>>Action</option>
									<option value="Animation"
										<c:if test="${fn:contains(Movie.category, 'Animation')}">selected</c:if>>Animation</option>
									<option value="Comedy"
										<c:if test="${fn:contains(Movie.category, 'Comedy')}">selected</c:if>>Comedy</option>
									<option value="Crime"
										<c:if test="${fn:contains(Movie.category, 'Crime')}">selected</c:if>>Crime</option>
									<option value="Drama"
										<c:if test="${fn:contains(Movie.category, 'Drama')}">selected</c:if>>Drama</option>
									<option value="Fantasy"
										<c:if test="${fn:contains(Movie.category, 'Fantasy')}">selected</c:if>>Fantasy</option>
									<option value="Historical"
										<c:if test="${fn:contains(Movie.category, 'Historical')}">selected</c:if>>Historical</option>
									<option value="Horror"
										<c:if test="${fn:contains(Movie.category, 'Horror')}">selected</c:if>>Horror</option>
									<option value="Romance"
										<c:if test="${fn:contains(Movie.category, 'Romance')}">selected</c:if>>Romance</option>
									<option value="Science-fiction"
										<c:if test="${fn:contains(Movie.category, 'Science-fiction')}">selected</c:if>>Science-fiction</option>
									<option value="Thriller"
										<c:if test="${fn:contains(Movie.category, 'Thriller')}">selected</c:if>>Thriller</option>
									<option value="Western"
										<c:if test="${fn:contains(Movie.category, 'Western')}">selected</c:if>>Western</option>
									<option value="Other"
										<c:if test="${fn:contains(Movie.category, 'Other')}">selected</c:if>>Other</option>
								</select>
							</div>

						</div>


						<label class="sign__label" for="movie_name">Movie Duration</label>
						<div class="sign__group">
							<input type="text" class="sign__input" name="movie_duration"
								value="${Movie.movieDuration}" placeholder="Example: 1h 30m"
								required>

						</div>
						<label class="sign__label" for="address">Description</label>
						<div class="sign__group">
							<textarea id="Description" name="description"
								class="sign__textarea" placeholder="Description"
								style="width: 100%; height: 200px;">${Movie.description}</textarea>
						</div>

						<div class="row align-items-center"
							style="display: flex; align-items: center;">
							<!-- Hộp thoại yêu cầu nhập ngày -->
							<div class="col-4">
								<label for="publish-date" class="form-label"
									style="font-weight: bold; color: white;">Enter Release
									Date:</label>
							</div>
							<!-- Ô chọn ngày -->
							<div class="col-8">
								<div class="sign__group">
									<fmt:formatDate value="${Movie.releaseDay}"
										pattern="yyyy-MM-dd" var="formattedDate" />
									<input type="date" id="date" name="release_day"
										class="sign__input" placeholder="Select date"
										value="${formattedDate}">
								</div>
							</div>
						</div>

						<label class="sign__label" for="status">Status</label>
						<div class="sign__group">
							<select class="sign__select" name="status" id="status" required>

								<option value="true" ${Movie.status ? 'selected' : ''}>Active</option>
								<option value="false" ${!Movie.status ? 'selected' : ''}>Inactive</option>
							</select>
						</div>
						<div class="col-6">
							<label class="sign__label" for="status">Image</label>
							<div class="sign__gallery">
								<label id="gallery1" for="sign__gallery-upload">Upload
									cover (240x340)</label> <input data-name="#gallery1"
									id="sign__gallery-upload" name="images"
									class="sign__gallery-upload" type="file"
									accept=".png, .jpg, .jpeg" style="display: none;"
									onchange="chooseFile(this)" value="${Movies.image}"> <input
									type="hidden" name="oldImage" value="${Movie.image}">
							</div>
						</div>
						<div id="image-preview-container" style="margin-left: 200px;">
							<c:choose>
								<c:when test="${Movie.image.substring(0,5) != 'https'}">
									<c:url value="/image?fname=${Movie.image}" var="imgUrl"></c:url>
								</c:when>
								<c:otherwise>
									<c:set var="imgUrl" value="${Movie.image}" />
								</c:otherwise>
							</c:choose>
							<img id="preview-image" src="${imgUrl}"
								style="width: 400px; height: 400px;" />
						</div>
						<label class="sign__label" for="address">Movie Trailer Link:</label>
						<div class="sign__group">
						 <input type="text" class="sign__input" name="movie_trailer"
								value="${Movie.movieTrailer}" placeholder="Trailer Link"
								required>			
						</div>
					</div>
					<button type="submit" class="sign__btn sign__btn--small">
						<span>Update</span>
					</button>

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
		document.querySelector('.sign__form').addEventListener('submit', function (e) {
			// Lấy giá trị từ thẻ select category
			const selectElement = document.getElementById('sign__genre');
			const selectedOptions = Array.from(selectElement.selectedOptions).map(option => option.value);
			const concatenatedCategories = selectedOptions.join(", "); // Nối các thể loại đã chọn bằng dấu phẩy

			// Tạo input ẩn để lưu chuỗi thể loại đã nối
			const hiddenInput = document.createElement('input');
			hiddenInput.type = 'hidden';
			hiddenInput.name = 'category'; // Tên này phải khớp với tên trường trong Controller
			hiddenInput.value = concatenatedCategories;

			// Thêm input ẩn vào form
			this.appendChild(hiddenInput);

			// Vô hiệu hóa thẻ select để không gửi thông tin của nó
			selectElement.disabled = true;
			});


	</script>
	
	

	<!-- JS -->
	<script src="assets2/js/bootstrap.bundle.min.js"></script>
	<script src="assets2/js/slimselect.min.js"></script>
	<script src="assets2/js/smooth-scrollbar.js"></script>
	<script src="assets2/js/admin.js"></script>
</body>
</html>