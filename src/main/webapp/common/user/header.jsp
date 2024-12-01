<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ValCT</title>
</head>
<body>

	<!-- ==========Overlay========== -->
	<div class="overlay"></div>
	<a href="#0" class="scrollToTop"> <i class="fas fa-angle-up"></i>
	</a>
	<!-- ==========Overlay========== -->

	<!-- ==========Header-Section========== -->
	<header class="header-section">
		<div class="container">
			<div class="header-wrapper">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/userHome"> <img
						src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="logo">
					</a>
				</div>
				<ul class="menu">
					<li><a href="${pageContext.request.contextPath}/userHome" class="active">Home</a></li>
					<li><a href="#0">movies</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/userMovieList">List Movie</a></li>
						</ul></li>
					<li><a href="#0">Others</a>
						<ul class="submenu">
							<li><a
								href="${pageContext.request.contextPath}/usernewsOrDiscounts">NewsAndDiscount</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath}/userMessage">Chats</a>
							</li>
						</ul></li>
					<li><a href="#0">Welcome, ${person.fullName}</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/userProfile">Profile
									Information</a></li>
							<li><a
								href="${pageContext.request.contextPath}/userTransaction?personId=${person.perID}">Booking
									History</a></li>
							<li><a href="${pageContext.request.contextPath}/logout">Log
									Out</a></li>
						</ul></li>

					<li>
					<li class="header-button pr-0"><a href="${pageContext.request.contextPath}/userMovieList">Book Ticket</a></li>
				</ul>
				<div class="header-bar d-lg-none">
					<span></span> <span></span> <span></span>
				</div>
			</div>
		</div>
	</header>
	<!-- ==========Header-Section========== -->

</body>
</html>