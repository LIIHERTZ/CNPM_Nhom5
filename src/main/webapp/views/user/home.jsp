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
    <title>Movie Home</title>
    <!-- Add Owl Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <style>
        .movie-slider-container {
            position: relative;
            width: 100%;
            overflow: hidden;
        }

        /* Nút Prev/Next */
        .carousel-btn {
            position: absolute;
            top: 50%; /* Canh giữa theo chiều dọc */
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.6); /* Màu nền */
            color: white;
            font-size: 20px;
            font-weight: bold;
            width: 50px; /* Kích thước nút */
            height: 50px;
            line-height: 50px; /* Căn giữa nội dung */
            text-align: center;
            border-radius: 50%; /* Hình tròn */
            cursor: pointer;
            z-index: 10;
            user-select: none; /* Ngăn chọn text */
        }

        .prev-btn {
            left: 0; /* Đưa nút Prev ra sát bên trái */
        }

        .next-btn {
            right: 0; /* Đưa nút Next ra sát bên phải */
        }

        .movie-slider {
            display: flex;
            gap: 15px;
            overflow: hidden;
            scroll-behavior: smooth;
        }

        .movie-grid {
            min-width: 300px;
            text-align: center;
        }

        .movie-thumb img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .movie-content {
            margin-top: 10px;
        }

        .movie-content h5 {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }

        .movie-content ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .movie-content ul li {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 5px;
        }

        .movie-content ul li img {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <section class="movie-section padding-top padding-bottom bg-two">
        <div class="container">
            <div class="section-header-1">
                <h2 class="title">Latest Movies</h2>
                <a class="view-all" href="${pageContext.request.contextPath}/userHome">View All</a>
            </div>
            <div class="movie-slider-container">
                <!-- Nút Prev -->
                <span class="carousel-btn prev-btn">&lt;&lt;</span>

                <!-- Slider -->
                <div class="movie-slider owl-carousel owl-theme">
                    <c:forEach var="movie" items="${movies}">
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
                </div>

                <!-- Nút Next -->
                <span class="carousel-btn next-btn">&gt;&gt;</span>
            </div>
        </div>
    </section>

    <!-- Add jQuery and Owl Carousel JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.movie-slider').owlCarousel({
                loop: true,
                margin: 10,
                nav: false, // Không dùng nav mặc định
                responsive: {
                    0: { items: 1 },
                    600: { items: 2 },
                    1000: { items: 3 },
                    1600: { items: 4 }
                }
            });

            // Xử lý nút Prev/Next
            $('.prev-btn').click(function () {
                $('.movie-slider').trigger('prev.owl.carousel');
            });

            $('.next-btn').click(function () {
                $('.movie-slider').trigger('next.owl.carousel');
            });
        });
    </script>
</body>
</html>

