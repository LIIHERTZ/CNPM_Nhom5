<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Ticket</title>
</head>
<body>

	<!-- ==========Window-Warning-Section========== -->
	<section class="window-warning inActive">
		<div class="lay"></div>
		<div class="warning-item">
			<h6 class="subtitle">Welcome!</h6>
			<h4 class="title">Select Your Seats</h4>
			<div class="thumb">
				<img src="assets/images/movie/seat-plan.png" alt="movie">
			</div>
			<!-- Form với phương thức POST -->
			<form action="${pageContext.request.contextPath}/userBookTickets"
				method="post" onsubmit="transferDataAndSubmit(); return false;">
				<input type="hidden" name="movieId" value="${movie.movieID}">
				<input type="hidden" id="startHourInput" name="startHour" value="">
				<input type="hidden" id="screeningIdInput" name="screeningId"
					value="">
				<button type="submit" class="custom-button seatPlanButton">
					Seat Plans <i class="fas fa-angle-right"></i>
				</button>
			</form>

		</div>
	</section>

	<!-- ==========Window-Warning-Section========== -->

	<!-- ==========Banner-Section========== -->
	<c:url value="/image?fname=${movie.image}" var="movieImgUrl"></c:url>
	<section class="details-banner hero-area bg_img"
		data-background="${movieImgUrl}" id="data-background-MV">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-content">
					<!-- Display movie title -->
					<h3 class="title">${movie.movieName}</h3>

					<!-- Optional: Add additional movie information here -->
					<div class="movie-info">
						<!-- Example: Movie duration -->
						<p>
							<strong>Duration:</strong> ${movie.movieDuration}
						</p>

						<!-- Example: Movie release date -->
						<p>
							<strong>Category:</strong> ${movie.category}
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ==========Banner-Section========== -->
	<!-- ==========Book-Section========== -->
	<section class="book-section bg-one">
		<div class="container">
			<form class="ticket-search-form two">
				<input type="hidden" name="movieId" value="${movie.movieID}">
				<div class="form-group">
					<div class="thumb">
						<img src="assets/images/ticket/date.png" alt="ticket">
					</div>
					<span class="type">date</span> <select class="select-bar"
						name="date" onchange="this.form.submit()">
						<%
						// Lấy ngày hiện tại
						Calendar calendar = Calendar.getInstance();
						SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

						// Ngày được chọn từ request hoặc mặc định là ngày hiện tại
						String selectedDateFromRequest = request.getParameter("date");
						String selectedDate = selectedDateFromRequest != null ? selectedDateFromRequest : sdf.format(calendar.getTime());

						// Hiển thị 30 ngày kể từ hôm nay
						for (int i = 0; i < 30; i++) {
							String date = sdf.format(calendar.getTime());
						%>
						<option value="<%=date%>"
							<%=date.equals(selectedDate) ? "selected" : ""%>>
							<%=date%>
						</option>
						<%
						calendar.add(Calendar.DAY_OF_MONTH, 1); // Tăng thêm một ngày
						}
						%>
					</select>
				</div>


				<div class="form-group">
					<div class="thumb">
						<img src="assets/images/ticket/city.png" alt="ticket">
					</div>
					<span class="type">location</span> <select class="select-bar"
						name="location" onchange="this.form.submit()">
						<!-- Chỉ hiển thị "Select Location" nếu chưa chọn giá trị -->
						<c:if test="${empty selectedLocation}">
							<option value="">Select Location</option>
						</c:if>
						<c:forEach var="location" items="${locations}">
							<option value="${location}"
								${location == selectedLocation ? "selected" : ""}>
								${location}</option>
						</c:forEach>
					</select>

				</div>
				<div class="form-group">
					<div class="thumb">
						<img src="assets/images/ticket/exp.png" alt="ticket">
					</div>
					<span class="type">Experience</span> <select class="select-bar"
						name="experience">
						<option value="2D">2D</option>
						<option value="3D">3D</option>
						<option value="Imax">Imax</option>
					</select>
				</div>
				<div class="form-group">
					<div class="thumb">
						<img src="assets/images/ticket/cinema.png" alt="ticket">
					</div>
					<span class="type">version</span> <select class="select-bar"
						name="version">
						<option value="Vietsub">Vietsub</option>
						<option value="Voiceover">Voiceover</option>
					</select>
				</div>
			</form>
		</div>
	</section>

	<!-- ==========Book-Section========== -->

	<!-- ==========Movie-Section========== -->
	<div class="ticket-plan-section padding-bottom padding-top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-9 mb-5 mb-lg-0">
					<ul class="seat-plan-wrapper bg-five">
						<c:forEach var="cinema" items="${listCinema}">
							<li>
								<div class="movie-name">
									<div class="icons">
										<i class="far fa-heart"></i> <i class="fas fa-heart"></i>
									</div>
									<a href="#0" class="name">${cinema.cinemaName}</a>
									<div class="location-icon">
										<i class="fas fa-map-marker-alt"></i>
									</div>
								</div>
								<div class="movie-schedule">
									<!-- Lấy danh sách suất chiếu từ cinemaScreeningsMap -->
									<c:forEach var="screening"
										items="${cinemaScreeningsMap[cinema.cinemaID]}">
										<div class="item" style="cursor: pointer;"
											onclick="setScreeningData('${screening.startHour}', '${screening.msID}', '${cinema.cinemaName}')">
											<!-- Hiển thị giờ chiếu -->
											<fmt:formatDate value="${screening.startHour}"
												pattern="HH:mm" />
										</div>
									</c:forEach>
								</div>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- ==========Movie-Section========== -->
	<script>
    // Hàm để cập nhật giá trị startHour và screeningId vào form
    function setScreeningData(startHour, screeningId, cinemaName) {
        document.getElementById('startHourInput').value = startHour; // Gán giá trị startHour
        document.getElementById('screeningIdInput').value = screeningId; // Gán giá trị screeningId


        // Tạo hoặc cập nhật input ẩn cho cinemaName
        let cinemaNameInput = document.getElementById('cinemaNameInput');
        if (!cinemaNameInput) {
            cinemaNameInput = document.createElement('input');
            cinemaNameInput.type = 'hidden';
            cinemaNameInput.id = 'cinemaNameInput';
            cinemaNameInput.name = 'cinemaName';
            document.querySelector('form[action="${pageContext.request.contextPath}/userBookTickets"]').appendChild(cinemaNameInput);
        }
        cinemaNameInput.value = cinemaName; // Gán giá trị cinemaName
    }

    // Hàm chuyển dữ liệu từ form tìm kiếm sang form cần submit
    function transferDataAndSubmit() {
        const formToSubmit = document.querySelector('form[action="${pageContext.request.contextPath}/userBookTickets"]'); // Form chính
        const searchForm = document.querySelector('form.ticket-search-form'); // Form tìm kiếm
        const startHourInput = document.getElementById('startHourInput');
        const screeningIdInput = document.getElementById('screeningIdInput');

        // Kiểm tra nếu người dùng chưa chọn startHour hoặc screeningId
        if (!startHourInput.value || !screeningIdInput.value) {
            alert('Please select a showtime before proceeding.');
            return false;
        }

        // Lấy dữ liệu từ form tìm kiếm
        const data = {
            date: searchForm.querySelector('select[name="date"]').value,
            location: searchForm.querySelector('select[name="location"]').value,
            experience: searchForm.querySelector('select[name="experience"]').value,
            version: searchForm.querySelector('select[name="version"]').value,
        };

        // Tạo các input ẩn để thêm dữ liệu vào form cần submit
        Object.entries(data).forEach(([name, value]) => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = name;
            input.value = value;
            formToSubmit.appendChild(input);
        });

        // Submit form
        formToSubmit.submit();
    }
 // Lấy phần tử bằng id
	const element = document.getElementById('data-background-MV');

	// Kiểm tra và gán background image nếu element tồn tại
	if (element) {
	    const bgImage = element.getAttribute('data-background');
	    //const image = 'url('+ '"' + bgImage + '"' + ')';
	    if (bgImage) {
	        element.style.backgroundImage = 'url('+ '"' + bgImage + '"' + ')';;
	        element.style.backgroundSize = 'cover'; // Phủ đầy
	        element.style.backgroundPosition = 'center'; // Canh giữa
	        element.style.backgroundRepeat = 'no-repeat'; // Không lặp lại
	    }
	}
	</script>
</body>
</html>