<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Management</title>
</head>
<body>

    <!-- Hiển thị danh sách ghế -->
    <div class="seat-plan-section padding-bottom padding-top">
        <!-- ==========Page-Title========== -->
        <section class="page-title bg-one">
            <div class="container">
                <div class="page-title-area">
                    <div class="item md-order-1">
                        <a href="${pageContext.request.contextPath}/admin/moviescreenings?id=${room.roomID}&cinemaId=${cinemaID}" class="custom-button back-button">
                            <i class="flaticon-double-right-arrows-angles"></i>Back
                        </a>
                    </div>
                    <div class="item date-item">
                        <span class="date">
                            <!-- Hiển thị ngày chiếu -->
                            <h4 class="title">Date Screening</h4>
                            <h4 class="title"><fmt:formatDate value="${screening.screeningDate}" pattern="dd-MM-yyyy" /></h4>
                        </span>
                    </div>
                    <div class="item date-item">
                        <span class="date">
                            <h4 class="title">Showtime </h4>
                            <h4 class="title">
                            <!-- Hiển thị giờ chiếu, chỉ lấy phần giờ và phút -->
                            <fmt:formatDate value="${screening.startHour}" pattern="HH:mm" /> - 
                            <fmt:formatDate value="${screening.endHour}" pattern="HH:mm" />
                            </h4>
                       </span>
                    </div>
                    <section class="item date-item">
                        <div class="container">
                            <div class="cinema-info-area">
                                <p><strong>Cinema:</strong> ${cinema.cinemaName}</p>
                                <p><strong>Room:</strong> ${room.roomName}</p>
                                <p><strong>Seats:</strong> ${availableSeats} available seats</p>
                            </div>
                        </div>
                    </section>
                              
                </div>
            </div>

        </section>
        <!-- ==========Page-Title========== -->
        <section class="page-title bg-one">
    <div class="container">
        <div class="item md-order-1 legend-container-right">
            <div class="cinema-info-area">
                <img src="${pageContext.request.contextPath}/assets/images/movie/seat01.png" alt="Available Seat" class="legend-icon">
                <span>Seat (Available)</span>
            </div>
            <div class="cinema-info-area">
                <img src="${pageContext.request.contextPath}/assets/images/movie/seat01-free.png" alt="Booked Seat" class="legend-icon">
                <span>Seat (Booked)</span>
            </div>
        </div>
    </div>
</section>

	
        <div class="container">
        	        <!-- Chú thích ghế -->

            
            <div class="screen-area">
                <h4 class="screen">SCREEN</h4>
                <div class="screen-thumb">
                    <img src="${pageContext.request.contextPath}/assets/images/movie/screen-thumb.png" alt="screen">
                </div>
                <div class="screen-wrapper">
                    <form action="${pageContext.request.contextPath}/selectSeats" method="post">
                        <input type="hidden" name="selectedSeats" id="hiddenSelectedSeats" value="">
                        <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="">
                        <input type="hidden" name="screeningId" value="${screeningId}">
                        
                        <h5 class="subtitle">Silver Plus</h5>
                        <!-- Duyệt qua từng hàng -->
                        <ul class="seat-area">
                            <c:if test="${empty seatStatusesGroupedByRow}">
                                <li>No seats available for this screening.</li>
                            </c:if>
                            <c:forEach var="row" items="${seatStatusesGroupedByRow}">
                                <!-- Nếu hàng là D, chèn thẻ Couple Plan -->
                                <c:if test="${row.key == 'D'}">
                                    <h5 class="subtitle">Couple Plan</h5>
                                </c:if>
                                <li class="seat-line" data-row="${row.key}">
                                    <span>${row.key}</span>
                                    <ul class="seat--area">
                                        <c:forEach var="seatStatus" items="${row.value}">
                                            <c:if test="${seatStatus != null && seatStatus.seat != null}">
                                                <li class="single-seat 
                                                    ${seatStatus.status ? 'seat-booked' : 'seat-free'} 
                                                    ${seatCoupleMap[seatStatus.seat.seatID] == 1 ? 'seat-couple' : ''}">
                                                    <label class="seat-label" 
                                                           data-tooltip="${seatStatus.seat.seatNumber != null ? seatStatus.seat.seatNumber : 'Unknown'} - 
                                                           <c:choose>
                                                                <c:when test="${seatCoupleMap[seatStatus.seat.seatID] == 1}">
                                                                    Couple Seat
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Single Seat
                                                                </c:otherwise>
                                                            </c:choose>">
                                                        <img src="${pageContext.request.contextPath}/assets/images/movie/${seatCoupleMap[seatStatus.seat.seatID] == 1 
                                                              ? (seatStatus.status ? 'seat02-free.png' : 'seat02.png') 
                                                              : (seatStatus.status ? 'seat01-free.png' : 'seat01.png')}" 
                                                             alt="seat" class="seat-img">
                                                    </label>
                                                    <!-- Hiển thị số ghế bên dưới -->
                                                    <span class="seat-number">${seatStatus.seat.seatNumber}</span>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
