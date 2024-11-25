<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${pageTitle}</title>
   
</head>
<body>
 <style>
        /* CSS cho toàn bộ trang */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0b1121; /* Nền tối */
            color: #ffffff; /* Chữ màu sáng */
            line-height: 1.6;
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            margin: 20px 0;
            color: #ffffff;
        }

        /* Bộ lọc phim */
        .filter-bar {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #172a46;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            max-width: 600px;
        }

        .filter-bar a {
            text-decoration: none;
            padding: 10px 25px;
            color: #fff;
            background-color: #3498db; /* Xanh dương */
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .filter-bar a.active {
            background-color: #f39c12; /* Vàng cam cho nút đang được chọn */
            box-shadow: 0 4px 10px rgba(243, 156, 18, 0.5);
        }

        .filter-bar a:hover {
            background-color: #2980b9; /* Xanh dương đậm hơn khi hover */
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        /* Grid layout cho danh sách phim */
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .movie-card {
            background-color: #172a46;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            text-align: center;
            padding: 10px;
            position: relative;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .movie-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.7);
        }

        .movie-card img {
            width: 100%;
            border-bottom: 3px solid #f39c12;
            height: 320px;
            object-fit: cover;
        }

        .movie-card h2 {
            font-size: 18px;
            margin: 10px 0 5px;
            text-transform: uppercase;
            color: #ffffff;
        }

        .movie-card p {
            margin: 5px 0;
            font-size: 14px;
            color: #d3d3d3;
        }
       .btn-group {
        display: flex;
        justify-content: space-between; /* Căn đều các nút */
        gap: 10px; /* Khoảng cách giữa các nút */
        margin-top: 10px;
    }

    .btn-group button,
    .btn-group a {
        flex: 1; /* Các nút sẽ chia đều khoảng cách */
        display: inline-block;
        text-align: center;
        padding: 10px 20px;
        font-size: 14px;
        font-weight: bold;
        text-transform: uppercase;
        color: #ffffff;
        border-radius: 20px;
        transition: all 0.3s ease;
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        border: none;
    }

    /* Nút Buy Ticket */
    .btn-buy {
        background: linear-gradient(45deg, #e74c3c, #c0392b); /* Gradient đỏ */
    }

    .btn-buy:hover {
        background: linear-gradient(45deg, #c0392b, #a93226);
        transform: translateY(-3px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }

    /* Nút Detail */
    .btn-detail {
        background-color: #f39c12; /* Màu vàng cam */
        color: #fff;
    }

    .btn-detail:hover {
        background-color: #e67e22;
        transform: translateY(-3px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }
    </style>
<section class="movie-section padding-top padding-bottom">
<h1>${pageTitle}</h1>

<!-- Thanh bộ lọc phim -->
<div class="filter-bar">
    <a href="?filter=showing" class="${param.filter == 'showing' ? 'active' : ''}">Phim Đang Chiếu</a>
    <a href="?filter=comingSoon" class="${param.filter == 'comingSoon' ? 'active' : ''}">Phim Sắp Chiếu</a>
    <a href="${pageContext.request.contextPath}/userMovieList" class="${empty param.filter ? 'active' : ''}">Tất Cả Phim</a>
</div>

<!-- Hiển thị danh sách phim -->
<div class="movie-grid">
    <c:forEach var="movie" items="${movies}">
        <div class="movie-card">
            <!-- Hình ảnh -->
            <img src="${movie.image}" alt="${movie.movieName}" />

            <!-- Tên phim -->
            <h2>${movie.movieName}</h2>

            <!-- Thông tin -->
            <p><strong>Thể loại:</strong> ${movie.category}</p>
            <p><strong>Thời lượng:</strong> ${movie.movieDuration}</p>
            <p><strong>Khởi chiếu:</strong> 
                <fmt:formatDate value="${movie.releaseDay}" pattern="dd/MM/yyyy" />
            </p>
            <div class="btn-group">
                <button class="btn-buy">🎟️ Buy Ticket</button>
                <a href="${pageContext.request.contextPath}/movieDetail?id=${movie.movieID}" class="btn-detail">🔍 Detail</a>
            </div>
        </div>
    </c:forEach>
</div>
</section>
</body>
</html>
