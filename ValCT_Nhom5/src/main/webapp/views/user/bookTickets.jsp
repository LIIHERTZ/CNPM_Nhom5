<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
			<form action="/ValCT_Nhom5/bookTickets" method="post"
				onsubmit="transferDataAndSubmit(); return false;">
				<button type="submit" class="custom-button seatPlanButton">
					Seat Plans<i class="fas fa-angle-right"></i>
				</button>
			</form>

		</div>
	</section>

	<!-- ==========Window-Warning-Section========== -->

	<!-- ==========Banner-Section========== -->
	<section class="details-banner hero-area bg_img"
		data-background="'assets/images/banner/banner03.jpg'">
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
				<div class="form-group">
					<div class="thumb">
						<img src="assets/images/ticket/date.png" alt="ticket">
					</div>
					<span class="type">date</span> <select class="select-bar"
						name="date">
						<%
						Calendar calendar = Calendar.getInstance();
						int year = calendar.get(Calendar.YEAR);
						int month = calendar.get(Calendar.MONTH); // Tháng hiện tại
						int currentDay = calendar.get(Calendar.DAY_OF_MONTH);

						SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
						calendar.set(Calendar.DAY_OF_MONTH, 1); // Đặt về ngày đầu tiên của tháng

						while (calendar.get(Calendar.MONTH) == month) {
							String date = sdf.format(calendar.getTime());
						%>
						<option value="<%=date%>"
							<%=(calendar.get(Calendar.DAY_OF_MONTH) == currentDay) ? "selected" : ""%>>
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
										<div class="item">
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
    function transferDataAndSubmit() {
        // Lấy form cần submit
        const formToSubmit = document.querySelector('form[action="/ValCT_Nhom5/bookTickets"]');
        const searchForm = document.querySelector('form.ticket-search-form');

        // Lấy dữ liệu từ form search
        const date = searchForm.querySelector('select[name="date"]').value;
        const location = searchForm.querySelector('select[name="location"]').value;
        const experience = searchForm.querySelector('select[name="experience"]').value;
        const version = searchForm.querySelector('select[name="version"]').value;

        // Tạo các input ẩn để thêm dữ liệu vào form cần submit
        const inputs = [
            { name: 'date', value: date },
            { name: 'location', value: location },
            { name: 'experience', value: experience },
            { name: 'version', value: version },
        ];

        inputs.forEach(inputData => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = inputData.name;
            input.value = inputData.value;
            formToSubmit.appendChild(input);
        });

        // Gửi form
        formToSubmit.submit();
    }
</script>


</body>


</html>