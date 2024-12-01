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
                    <a href="${pageContext.request.contextPath}/home">
                        <img src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="logo">
                    </a>
                </div>
                <ul class="menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/home" class="active">Home</a>
                    </li>
                    <li>
                        <a href="#0">movies</a>
                        <ul class="submenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/movieList">Movie List</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="">Other</a>
                        <ul class="submenu">
                            <li><a
								href="${pageContext.request.contextPath}/newsOrDiscounts">NewsOrDiscount</a>
							</li>
                        </ul>
                    </li>
                    <li class="header-button pr-0">
                        <a href="${pageContext.request.contextPath}/signin">Sign In</a>
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