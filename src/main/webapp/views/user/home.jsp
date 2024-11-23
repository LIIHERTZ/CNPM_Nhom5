<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie List</title>
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</head>
<body>
 <style>
        /* Wrapper for the carousel */
        .owl-carousel-wrapper {
            position: relative;
        }

        /* Owl navigation buttons */
   

        .owl-controls .owl-buttons .owl-prev {
            left: -50px;
            top :250px;
        }

        .owl-controls .owl-buttons .owl-next {
            right: -50px;
               top :250px;
        }

        /* Hover effects for navigation buttons */
        .owl-controls .owl-buttons div:hover {
            background-color: rgba(255, 0, 0, 0.8);
        }

        /* Movie item styles */
        .movie-item {
            text-align: center;
            padding: 10px;
        }

        .movie-item img {
            width: 100%;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .movie-item img:hover {
            transform: scale(1.05);
        }

        .movie-title {
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }

        .movie-category,
        .movie-duration {
            font-size: 14px;
            color: #555;
        }
   .owl-buttons .fa-caret-left {
   font-size: 50px !important;
    position: absolute;
    top: 37%; /* Canh giữa theo chiều dọc */
    left: -30px; /* Đẩy biểu tượng ra bên trái container */
    transform: translateY(-50%); /* Căn chỉnh chính xác theo chiều dọc */
}

.owl-buttons .fa-caret-right {
	font-size: 50px !important;
    position: absolute;
    top: 40%; /* Canh giữa theo chiều dọc */
    right: -30px; /* Đẩy biểu tượng ra bên phải container */
    transform: translateY(-50%); /* Căn chỉnh chính xác theo chiều dọc */
}
 .owl-buttons .fa-caret-left:hover,
.owl-buttons .fa-caret-right:hover {
    color: #ff0000; /* Màu đỏ khi hover */
    background-color: rgba(0, 0, 0, 0.8); /* Nền đen đậm hơn khi hover */
}
/* Movies Showing Navigation */
.movies-showing-prev {
    position: absolute;
    left: -50px;
    top: 50%;
    transform: translateY(-50%);
}

.movies-showing-next {
    position: absolute;
    right: -50px;
    top: 50%;
    transform: translateY(-50%);
}

/* Movies Coming Soon Navigation */
.movies-coming-prev {
    position: absolute;
    left: -50px;
    top: 50%;
    transform: translateY(-50%);
}

.movies-coming-next {
    position: absolute;
    right: -50px;
    top: 50%;
    transform: translateY(-50%);
}

    </style>
<section class="banner-section">
        <div class="banner-bg bg_img bg-fixed" data-background="assets/images/banner/banner01.jpg"></div>
        <div class="container">
            <div class="banner-content">
                <h1 class="title  cd-headline clip"><span class="d-block">book your</span> tickets for 
                    <span class="color-theme cd-words-wrapper p-0 m-0">
                        <b class="is-visible">Movie</b>
                    </span>
                </h1>
                <p>Safe, secure, reliable ticketing.Your ticket to live entertainment!</p>
            </div>
        </div>
    </section>


    <section class="movie-section padding-top padding-bottom">
        <div class="container">
            <div class="section-header">
                <h2 class="title">Movies Showing</h2>
            </div>
 			<a class="view-all" href="${pageContext.request.contextPath}/userHome">View All</a>
            <div class="owl-carousel-wrapper">
                <!-- Movie list -->
                <ul id="movies-showing-carousel" class="owl-carousel owl-theme">
                     <c:forEach var="movie" items="${moviesShowing}">
                        <div class="movie-grid">
                            <div class="movie-thumb c-thumb">
                                <a href="#0">
                                    <c:if test="${movie.image != null}">
                                        <c:choose>
                                            <c:when test="${movie.image.substring(0, 5) == 'https'}">
                                                <img src="${movie.image}" class="card-img-top" alt="${movie.movieName}">
                                            </c:when>
                                            <c:otherwise>
                                                <c:url value="/image?fname=${movie.image}" var="movieImgUrl"></c:url>
                                                <img src="${movieImgUrl}" class="card-img-top" alt="${movie.movieName}">
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </a>
                            </div>
                            <div class="movie-content bg-one">
                                <h5 class="title m-0">
                                    <a href="#0">${movie.movieName}</a>
                                </h5>
                                <ul class="movie-rating-percent">
                                    <li>
                                        <div class="thumb">
                                            <img src="assets/images/movie/tomato.png" alt="rating">
                                        </div>
                                        <span class="content">Category: ${movie.category}</span>
                                    </li>
                                    <li>
                                        <div class="thumb">
                                            <img src="assets/images/movie/cake.png" alt="duration">
                                        </div>
                                        <span class="content">Duration: ${movie.movieDuration}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </ul>

                <!-- Owl navigation -->
                <div class="owl-controls clickable">
                    <div class="owl-buttons">
                  <div class="owl-prev movies-showing-prev"><i class="fa fa-caret-left"></i></div>
        		<div class="owl-next movies-showing-next"><i class="fa fa-caret-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </section>


<section class="movie-section padding-top padding-bottom">
        <div class="container">
            <div class="section-header">
                <h2 class="title">Movies Coming Soon</h2>
            </div>
            <div class="owl-carousel-wrapper">
                <!-- Movie list -->
                <ul id="movies-coming-carousel" class="owl-carousel owl-theme">
                     <c:forEach var="movie" items="${moviesComingSoon}">
                        <div class="movie-grid">
                            <div class="movie-thumb c-thumb">
                                <a href="#0">
                                    <c:if test="${movie.image != null}">
                                        <c:choose>
                                            <c:when test="${movie.image.substring(0, 5) == 'https'}">
                                                <img src="${movie.image}" class="card-img-top" alt="${movie.movieName}">
                                            </c:when>
                                            <c:otherwise>
                                                <c:url value="/image?fname=${movie.image}" var="movieImgUrl"></c:url>
                                                <img src="${movieImgUrl}" class="card-img-top" alt="${movie.movieName}">
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </a>
                            </div>
                            <div class="movie-content bg-one">
                                <h5 class="title m-0">
                                    <a href="#0">${movie.movieName}</a>
                                </h5>
                                <ul class="movie-rating-percent">
                                    <li>
                                        <div class="thumb">
                                            <img src="assets/images/movie/tomato.png" alt="rating">
                                        </div>
                                        <span class="content">Category: ${movie.category}</span>
                                    </li>
                                    <li>
                                        <div class="thumb">
                                            <img src="assets/images/movie/cake.png" alt="duration">
                                        </div>
                                        <span class="content">Duration: ${movie.movieDuration}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </ul>

                <!-- Owl navigation -->
                <div class="owl-controls clickable">
                    <div class="owl-buttons">
                    <div class="owl-prev movies-coming-prev"><i class="fa fa-caret-left"></i></div>
        			<div class="owl-next movies-coming-next"><i class="fa fa-caret-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Owl Carousel JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script>
    $(document).ready(function() {
        // Movies Showing Carousel
        $('#movies-showing-carousel').owlCarousel({
            items: 4,
            loop: true,
            margin: 20,
            nav: false,
            dots: false
        });

        $('.movies-showing-prev').click(function() {
            $('#movies-showing-carousel').trigger('prev.owl.carousel');
        });

        $('.movies-showing-next').click(function() {
            $('#movies-showing-carousel').trigger('next.owl.carousel');
        });

        // Movies Coming Soon Carousel
        $('#movies-coming-carousel').owlCarousel({
            items: 4,
            loop: true,
            margin: 20,
            nav: false,
            dots: false
        });

        $('.movies-coming-prev').click(function() {
            $('#movies-coming-carousel').trigger('prev.owl.carousel');
        });

        $('.movies-coming-next').click(function() {
            $('#movies-coming-carousel').trigger('next.owl.carousel');
        });
    });
    </script>
</body>
</html>
