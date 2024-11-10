<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
			<a href="/ValCT_Nhom5/selectSeats"
				class="custom-button seatPlanButton">Seat Plans<i
				class="fas fa-angle-right"></i>
			</a>
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
					<span class="type">date</span> <select class="select-bar">
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
						<option value="">Select Location</option>
						<c:forEach var="location" items="${locations}">
							<option value="${location}"
								>${location}</option>
						</c:forEach>
					</select>

				</div>
				<div class="form-group">
					<div class="thumb">
						<img src="assets/images/ticket/exp.png" alt="ticket">
					</div>
					<span class="type">Experience</span> <select class="select-bar">
						<option value="English-2D">English-2D</option>
						<option value="English-3D">English-3D</option>
						<option value="Hindi-2D">Hindi-2D</option>
						<option value="Hindi-3D">Hindi-3D</option>
						<option value="Telegu-2D">Telegu-2D</option>
						<option value="Telegu-3D">Telegu-3D</option>
					</select>
				</div>
				<div class="form-group">
					<div class="thumb">
						<img src="assets/images/ticket/cinema.png" alt="ticket">
					</div>
					<span class="type">version</span> <select class="select-bar">
						<option value="Awaken">Awaken</option>
						<option value="Venus">Venus</option>
						<option value="wanted">wanted</option>
						<option value="joker">joker</option>
						<option value="fid">fid</option>
						<option value="kidio">kidio</option>
						<option value="mottus">mottus</option>
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
						<li>
							<div class="movie-name">
								<div class="icons">
									<i class="far fa-heart"></i> <i class="fas fa-heart"></i>
								</div>
								<a href="#0" class="name">Genesis Cinema</a>
								<div class="location-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
							</div>
							<div class="movie-schedule">
								<div class="item">09:40</div>
								<div class="item">13:45</div>
								<div class="item">15:45</div>
								<div class="item">19:50</div>

								<div class="item">21:50</div>

								<div class="item">22:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

								<div class="item">23:50</div>

							</div>
						</li>
						<li>
							<div class="movie-name">
								<div class="icons">
									<i class="far fa-heart"></i> <i class="fas fa-heart"></i>
								</div>
								<a href="#0" class="name">the beach</a>
								<div class="location-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
							</div>
							<div class="movie-schedule">
								<div class="item">09:40</div>
								<div class="item">13:45</div>
								<div class="item">15:45</div>
								<div class="item">19:50</div>

								<div class="item">19:50</div>
							</div>
						</li>
						<li class="active">
							<div class="movie-name">
								<div class="icons">
									<i class="far fa-heart"></i> <i class="fas fa-heart"></i>
								</div>
								<a href="#0" class="name">city work</a>
								<div class="location-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
							</div>
							<div class="movie-schedule">
								<div class="item">09:40</div>
								<div class="item active">13:45</div>
								<div class="item">15:45</div>
								<div class="item">19:50</div>
							</div>
						</li>
						<li>
							<div class="movie-name">
								<div class="icons">
									<i class="far fa-heart"></i> <i class="fas fa-heart"></i>
								</div>
								<a href="#0" class="name">box park</a>
								<div class="location-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
							</div>
							<div class="movie-schedule">
								<div class="item">09:40</div>
								<div class="item">13:45</div>
								<div class="item">15:45</div>
								<div class="item">19:50</div>
							</div>
						</li>
						<li>
							<div class="movie-name">
								<div class="icons">
									<i class="far fa-heart"></i> <i class="fas fa-heart"></i>
								</div>
								<a href="#0" class="name">la mer</a>
								<div class="location-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
							</div>
							<div class="movie-schedule">
								<div class="item">09:40</div>
								<div class="item">13:45</div>
								<div class="item">15:45</div>
								<div class="item">19:50</div>
							</div>
						</li>
						<li>
							<div class="movie-name">
								<div class="icons">
									<i class="far fa-heart"></i> <i class="fas fa-heart"></i>
								</div>
								<a href="#0" class="name">wanted</a>
								<div class="location-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
							</div>
							<div class="movie-schedule">
								<div class="item">09:40</div>
								<div class="item">13:45</div>
								<div class="item">15:45</div>
								<div class="item">19:50</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- ==========Movie-Section========== -->
</body>
</html>