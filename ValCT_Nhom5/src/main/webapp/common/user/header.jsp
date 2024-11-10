<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ValCT</title>
</head>
<body>

    <!-- ==========Overlay========== -->
    <div class="overlay"></div>
    <a href="#0" class="scrollToTop">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- ==========Overlay========== -->

    <!-- ==========Header-Section========== -->
    <header class="header-section">
        <div class="container">
            <div class="header-wrapper">
                <div class="logo">
                    <a href="index.html">
                        <img src="assets/images/logo/logo.png" alt="logo">
                    </a>
                </div>
                <ul class="menu">
                    <li>
                        <a href="/ValCT_Nhom5/home" class="active">Home</a>
                    </li>
                    <li>
                        <a href="#0">movies</a>
                        <ul class="submenu">
                            <li>
                                <a href="movie-grid.html">Movie Grid</a>
                            </li>
                            <li>
                                <a href="movie-list.html">Danh sách phim</a>
                            </li>
                            <li>
                                <a href="movie-details-2.html">Movie Details 2</a>
                            </li>
                            <li>
                                <a href="movie-ticket-plan.html">Movie Ticket Plan</a>
                            </li>
                            <li>
                                <a href="movie-seat-plan.html">Movie Seat Plan</a>
                            </li>
                            <li>
                                <a href="movie-checkout.html">Movie Checkout</a>
                            </li>
                            <li>
                                <a href="popcorn.html">Movie Food</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#0">events</a>
                        <ul class="submenu">
                            <li>
                                <a href="events.html">Events</a>
                            </li>
                            <li>
                                <a href="event-details.html">Event Details</a>
                            </li>
                            <li>
                                <a href="event-speaker.html">Event Speaker</a>
                            </li>
                            <li>
                                <a href="event-ticket.html">Event Ticket</a>
                            </li>
                            <li>
                                <a href="event-checkout.html">Event Checkout</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#0">pages</a>
                        <ul class="submenu">
                            <li>
                                <a href="about.html">About Us</a>
                            </li>
                            <li>
                                <a href="apps-download.html">Apps Download</a>
                            </li>
                            <li>
                                <a href="sign-in.html">Sign In</a>
                            </li>
                            <li>
                                <a href="sign-up.html">Sign Up</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#0">Others</a>
                        <ul class="submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/usernewsOrDiscounts">NewsOrDiscount</a>
                            </li>
<!--                             <li> -->
<!--                                 <a href="blog-details.html">Blog Single</a> -->
<!--                             </li> -->
                        </ul>
                    </li>
                    <li>
                        <a href="contact.html">contact</a>
                    </li>
                    <li class="header-button pr-0">
                        <a href="/ValCT_Nhom5/signin">Sign In</a>
                    </li>
                </ul>
                <div class="header-bar d-lg-none">
					<span></span>
					<span></span>
					<span></span>
				</div>
            </div>
        </div>
    </header>
    <!-- ==========Header-Section========== -->

</body>
</html>