<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<body>


	<!-- main content -->
	<main class="container-fluid">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
					    <h2 class="main__title-heading">Movie Screenings</h2>
					    
					    <span class="main__title-stat">Total: ${noOfRecords}</span>
					    
					    <div class="main__title-stat">
					    	<div class="catalog__text">
					        <a href="${pageContext.request.contextPath}/admin/rooms?id=${cinemaId}">Back to Room List</a>
					   		 </div>
						</div>
						<div class="main__title-wrap">
							<button type="button" data-bs-toggle="modal" class="main__title-link main__title-link--wrap" data-bs-target="#modal-add-movieScreen">Add MovieScreen</button>
							<!-- search -->
							<!-- search -->
							<form action="${pageContext.request.contextPath}/admin/moviescreenings" method="GET" class="main__title-form">
								    <!-- Input để tìm theo ngày chiếu -->
								    <input type="date" name="screeningDate" placeholder="Find by screening date.." class="sign__input">
								    
								    <!-- Hidden Input để giữ lại các thông tin cần thiết khác trong URL -->
								    <input type="hidden" name="id" value="${room.roomID}">
								    <input type="hidden" name="cinemaId" value="${cinemaId}">
								    <input type="hidden" name="page" value="1"> <!-- Đặt mặc định là trang 1 khi tìm kiếm -->
								
								    <!-- Nút lọc -->
								    <button type="submit">
								        <i class="ti ti-search"></i>
								    </button>
								</form>
							
							<!-- end search -->

							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->
                <!-- <div>
                    <label style="color: white; font-weight: bold;">ROOM NAME: </label>
                    <input id="" type="text" name="" class="" value = "ROOM 1" readonly>
                </div> -->
<!-- movie screenings -->
<div class="col-12">
    <div class="catalog catalog--1">
        <table class="catalog__table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>MOVIE NAME</th>
                    <th>ROOM</th>
                    <th>SCREENING DATE</th>
                    <th>START HOUR</th>
                    <th>END HOUR</th>
                    <th>STATUS</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="screening" items="${movieScreenings}">
                    <tr>
                        <td>
                            <div class="catalog__text">${screening.msID}</div>
                        </td>
                        <td> 
                                <div class="catalog__text">
							    <a href="${pageContext.request.contextPath}/admin/seatrooms?msID=${screening.msID}&roomID=${screening.room.roomID}&cinemaId=${cinemaId}">
							        ${screening.movie.movieName}
							    </a>
						</div>
                        
                        </td>

                        <td>
                            <!--<div class="catalog__text">${screening.room.roomName}</div> -->
                            <div class="catalog__text">${screening.room.roomName}</div>
                        </td>
                        <td>
                            <div class="catalog__text">
                                <fmt:formatDate value="${screening.screeningDate}" pattern="MM-dd-yyyy"/>
                            </div>
                        </td>
                        <td>
                            <div class="catalog__text">
                                <fmt:formatDate value="${screening.startHour}" pattern="HH:mm"/>
                            </div>
                        </td>
                        <td>
                            <div class="catalog__text">
                                <fmt:formatDate value="${screening.endHour}" pattern="HH:mm"/>
                            </div>
                        </td>
                        <td>
                            <div class="catalog__text ${screening.status ? 'catalog__text--green' : 'catalog__text--red'}">
                                ${screening.status ? 'Active' : 'Inactive'}
                            </div>
                        </td>
                        <td>
                            <div class="catalog__btns">
								<a href="${pageContext.request.contextPath}/admin/editMovieScreening?msID=${screening.msID}&roomID=${screening.room.roomID}&cinemaId=${cinemaId}" class="catalog__btn catalog__btn--edit">
								    <i class="ti ti-edit"></i>
								</a>


									<button type="button" class="catalog__btn catalog__btn--delete" data-bs-toggle="modal" data-bs-target="#modal-delete" 
									data-ms-id="${screening.msID}" data-room-id="${screening.room.roomID}" data-cinema-id = "${screening.room.cinema.cinemaID}">
									    <i class="ti ti-trash"></i>
									</button>

                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- end movie screenings -->



									<!-- pagination -->
					<div class="col-12">
					    <div class="main__paginator">
					        <!-- amount -->
					        <span class="main__paginator-pages">${currentPage} of ${noOfPages}</span>
					        <!-- end amount -->
					
					        <ul class="main__paginator-list">
					            <!-- Previous Page Link -->
					            <li>
					                <a href="<c:url value='/admin/moviescreenings'>
					                    <c:param name='id' value='${room.roomID}'/>
					                    <c:param name='cinemaId' value='${cinemaId}'/>
					                    <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
					                </c:url>">
					                    <i class="ti ti-chevron-left"></i>
					                    <span>Prev</span>
					                </a>
					            </li>
					
					            <!-- Next Page Link -->
					            <li>
					                <a href="<c:url value='/admin/moviescreenings'>
					                    <c:param name='id' value='${room.roomID}'/>
					                    <c:param name='cinemaId' value='${cinemaId}'/>
					                    <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
					                </c:url>">
					                    <span>Next</span>
					                    <i class="ti ti-chevron-right"></i>
					                </a>
					            </li>
					        </ul>
					
					        <ul class="paginator">
					            <!-- Previous Page Link -->
					            <li class="paginator__item paginator__item--prev">
					                <a href="<c:url value='/admin/moviescreenings'>
					                    <c:param name='id' value='${room.roomID}'/>
					                    <c:param name='cinemaId' value='${cinemaId}'/>
					                    <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
					                </c:url>">
					                    <i class="ti ti-chevron-left"></i>
					                </a>
					            </li>
					
					            <!-- Page Numbers -->
					            <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
					                <li class="paginator__item ${pageNumber == currentPage ? 'paginator__item--active' : ''}">
					                    <a href="<c:url value='/admin/moviescreenings'>					                    	
					                        <c:param name='id' value='${room.roomID}'/>
					                        <c:param name='cinemaId' value='${cinemaId}'/>
					                        <c:param name='page' value='${pageNumber}'/>
					                    </c:url>">${pageNumber}</a>
					                </li>
					            </c:forEach>
					
					            <!-- Next Page Link -->
					            <li class="paginator__item paginator__item--next">
					                <a href="<c:url value='/admin/moviescreenings'>
					                	<c:param name='cinemaId' value='${cinemaId}'/>
					                    <c:param name='id' value='${room.roomID}'/>
					                    <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
					                </c:url>">
					                    <i class="ti ti-chevron-right"></i>
					                </a>
					            </li>
					        </ul>
					    </div>
					</div>
					<!-- end pagination -->

			</div>
		</div>
	</main>
	<!-- end main content -->

	<!-- add modal -->
<div class="modal fade" id="modal-add-movieScreen" tabindex="-1" aria-labelledby="modal-add-movieScreen" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal__content">
                <form action="${pageContext.request.contextPath}/admin/addMovieScreening" method="POST" class="modal__form">
                    <h4 class="modal__title">Add MovieScreen</h4>
					<input type="hidden" name="cinemaId" value="${cinemaId}">
					<input type="hidden" name="roomID" value="${room.roomID}">
                    <div class="row">
                        <div class="sign__group">
                            <label class="sign__label" for="movieID">Movie</label>
                            <select name="movieID" id="movieID" class="sign__select" required>
                                <c:forEach var="movie" items="${movies}">
                                    <option value="${movie.movieID}">${movie.movieName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-12">
                            <div class="sign__group">
									<label class="sign__label" for="roomID">Room</label>
							        <input type="text" id="roomName" name="roomName" class="sign__input" value="${room.roomName}" readonly>

                            </div>
                        </div>
                        
                        <!-- Date Screening -->
                        <div class="col-12">
                            <div class="sign__group">
                                <label class="sign__label" for="dateScreening">Date of Screening</label>
                                <input id="dateScreening" type="date" name="dateScreening" class="sign__input" required>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="sign__group">
                                <label class="sign__label" for="startHour">Start Hour</label>
                                <input id="startHour" type="time" name="startHour" class="sign__input" required>
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <div class="sign__group">
                                <label class="sign__label" for="endHour">End Hour</label>
                                <input id="endHour" type="time" name="endHour" class="sign__input" required>
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <div class="sign__group">
                                <label class="sign__label" for="status">Status</label>
                                <select name="status" id="status" class="sign__select" required>
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="col-12 col-lg-6 offset-lg-3">
                            <button type="submit" class="sign__btn sign__btn--modal">Add</button>
                        </div>    
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end add modal -->


	<!-- Delete Modal -->
<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="modal-delete" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal__content">
                <form action="${pageContext.request.contextPath}/admin/deleteMovieScreening" method="POST">
                    <h4 class="modal__title">Delete MovieScreening</h4>
                    <p class="modal__text">Are you sure you want to delete this movie screening?</p>
                    <input type="hidden" name="id" id="deleteMovieScreeningId">
                    <input type="hidden" name="roomID" id="deleteRoomId">
                    <input type="hidden" name="cinemaID" id="deleteCinemaId">
                    <div class="modal__btns">
                        <button type="submit" class="modal__btn modal__btn--apply">Delete</button>
                        <button type="button" class="modal__btn modal__btn--dismiss" data-bs-dismiss="modal">Dismiss</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

	<script>
	document.querySelectorAll('.catalog__btn--delete').forEach(button => {
	    button.addEventListener('click', function() {
	        const msID = this.getAttribute('data-ms-id');
	        const roomID = this.getAttribute('data-room-id');
	        const cinemaID = this.getAttribute('data-cinema-id');
	        document.getElementById('deleteMovieScreeningId').value = msID;
	        document.getElementById('deleteRoomId').value = roomID;
	        document.getElementById('deleteCinemaId').value = cinemaID;
	    });
	});

	</script>
</body>