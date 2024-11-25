<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<body>



    <!-- main content -->
    <main class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <!-- main title -->
                <div class="col-12">
                    <div class="main__title">
                        <h2>Edit Movie Screening</h2>
                    </div>
                </div>
                <!-- end main title -->

                <!-- form -->
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/admin/editMovieScreening" method="POST" class="sign__form sign__form--add">
                        <input type="hidden" name="msID" value="${movieScreening.msID}">
    					<input type="hidden" name="roomID" value="${movieScreening.room.roomID}">
    					<input type="hidden" name="cinemaId" value="${movieScreening.room.cinema.cinemaID}">
                        <div class="row">
						<div class="sign__group">
						    <label class="sign__label" for="movieID">Movie</label>
						    <select name="movieID" id="movieID" class="sign__select" required>
						        <c:forEach var="movie" items="${movies}">
						            <option value="${movie.movieID}" 
						                ${movieScreening.movie.movieID == movie.movieID ? 'selected' : ''}>
						                ${movie.movieName}
						            </option>
						        </c:forEach>
						    </select>
						</div>


                            <div class="col-12">
                                <label class="sign__label" for="roomName">Room</label>
                                <div class="sign__group">
                                    <input type="text" class="sign__input" name="roomName" value="${movieScreening.room.roomName}" placeholder="Room Name" readonly>
                                </div>
                            </div>

							<div class="col-12">
							    <label class="sign__label" for="screeningDate">Screening Date</label>
							    <div class="sign__group">
							        <input type="date" class="sign__input" name="screeningDate" 
							               value="${formattedDate}" required>
							    </div>
							</div>
							
							<div class="col-12 col-md-6">
							    <label class="sign__label" for="startHour">Start Hour</label>
							    <div class="sign__group">
							        <input type="time" class="sign__input" name="startHour" 
							               value="${formattedStartHour}" placeholder="Start Hour" required>
							    </div>
							</div>
							
							<div class="col-12 col-md-6">
							    <label class="sign__label" for="endHour">End Hour</label>
							    <div class="sign__group">
							        <input type="time" class="sign__input" name="endHour" 
							               value="${formattedEndHour}" placeholder="End Hour" required>
							    </div>
							</div>

                            <div class="col-12">
                                <label class="sign__label" for="movieScreening_status">Status</label>
                                <div class="sign__group">
                                 <select class="sign__select" name="status" id="status" required>
                                	
                                        <c:choose>
                                            <c:when test="${movieScreening.status}">
                                                <option value="true" selected>Active</option>
                                                <option value="false">Inactive</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="true">Active</option>
                                                <option value="false" selected>Inactive</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-start align-items-center" style="gap: 15px;">
                            	<a href="${pageContext.request.contextPath}/admin/moviescreenings?id=${movieScreening.room.roomID}&cinemaId=${movieScreening.room.cinema.cinemaID}
                            	" class="sign__btn sign__btn--small sign__btn--outline"><span>Back to List</span></a>
                                <button type="submit" class="sign__btn sign__btn--small"><span>Apply Changes</span></button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- end form -->
            </div>
        </div>
    </main>
    <!-- end main content -->

   
</body>