<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h2>Add New Movie</h2>
				</div>
			</div>

			
			<!-- end main title -->

			<!-- form -->
			<div class="col-12">
				<form action="${pageContext.request.contextPath}/admin/addMovie"
					method="post" enctype="multipart/form-data"
					class="sign__form sign__form--add">
					<div class="col-12 col-xl-12">
						<label class="sign__label" for="movie_name">Movie Name</label>
						<div class="sign__group">
							<input type="text" class="sign__input" name="movie_name"
								value="${movie_name}" placeholder="Movie Name" required>
						</div>
						<div class="col-12">
						    <div class="sign__group">
						        <label class="sign__label" for="category">Category</label>
						        <select class="sign__selectjs" name="category" id="sign__genre" multiple required>
						            <option value="Action">Action</option>
						            <option value="Animation">Animation</option>
						            <option value="Comedy">Comedy</option>
						            <option value="Crime">Crime</option>
						            <option value="Drama">Drama</option>
						            <option value="Fantasy">Fantasy</option>
						            <option value="Historical">Historical</option>
						            <option value="Horror">Horror</option>
						            <option value="Romance">Romance</option>
						            <option value="Science-fiction">Science-fiction</option>
						            <option value="Thriller">Thriller</option>
						            <option value="Western">Western</option>
						            <option value="Other">Other</option>
						        </select>
						    </div>
						</div>


					

						<label class="sign__label" for="movie_name">Movie Duration</label>
						<div class="sign__group">
							<input type="text" class="sign__input" name="movie_duration"
								placeholder="Example: 1h 30m" required>

						</div>
						<label class="sign__label" for="address">Description</label>
						<div class="sign__group">
							<textarea id="Description" name="description"
								class="sign__textarea" placeholder="Description"
								style="width: 100%; height: 200px;"></textarea>
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
									<input type="date" id="date" name="release_day"
										class="sign__input" placeholder="Select date">
								</div>
							</div>
						</div>

						<label class="sign__label" for="status">Status</label>
						<div class="sign__group">
							<select class="sign__selectjs" name="status" id="sign__status"
								required>
								<option value="true">Active</option>
								<option value="false">Inactive</option>
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
									onchange="chooseFile(this)">
							</div>
						</div>
						<div id="image-preview-container" style="margin-left: 200px;">
							<img id="preview-image"
								style="display: none; width: 300px; height: 300px;" />
						</div>
					</div>
					<div class="col-12 d-flex justify-content-start align-items-center" style="gap: 15px;">
									<a href="${pageContext.request.contextPath}/admin/movies"
					class="sign__btn sign__btn--small"><span>Back to List</span></a>
					<button type="submit" class="sign__btn sign__btn--small">
						
						<span>Save</span>
					</button>
						</div>
				</form>
			</div>
			<!-- end form -->
		</div>
	</div>
	<!-- end main content -->
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

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Lấy phần tử input chọn ngày
			const dateInput = document.getElementById('publish-date');

			// Lấy ngày hiện tại
			const today = new Date();
			const year = today.getFullYear();
			const month = String(today.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0 nên cần cộng thêm 1
			const day = String(today.getDate()).padStart(2, '0');

			// Định dạng ngày theo chuẩn "yyyy-mm-dd" và gán vào input
			dateInput.value = `${year}-${month}-${day}`;
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