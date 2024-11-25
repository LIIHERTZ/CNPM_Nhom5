<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<body>
   
    <!-- main content -->
    <main class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <!-- main title -->
                <div class="col-12">
                    <div class="main__title">
                        <h2>Rooms in ${cinemaName}</h2>

                        <span class="main__title-stat">Total Rooms: ${rooms.size()}</span>
                        
                        <div class="main__title-stat">
					    	<div class="catalog__text">
					        <a href="${pageContext.request.contextPath}/admin/cinemas">Back to Cinema List</a>
					   		 </div>
						</div>
                        

                        <div class="main__title-wrap">
                            <button type="button" data-bs-toggle="modal" class="main__title-link main__title-link--wrap" data-bs-target="#modal-add-room">Add Room</button>

                            <!-- search -->
							<form action="${pageContext.request.contextPath}/admin/searchRoom" method="get" class="main__title-form">
								
								<input type="hidden" name="cinemaId" value="${cinemaId}">
								
							    <select name="screenType" class="sign__select" required>
							        <option value="All" ${screenType == 'All' ? 'selected' : ''}>All Screen Types</option>
							        <option value="2D" ${screenType == '2D' ? 'selected' : ''}>2D</option>
							        <option value="3D" ${screenType == '3D' ? 'selected' : ''}>3D</option>
							        <option value="IMAX" ${screenType == 'IMAX' ? 'selected' : ''}>IMAX</option>
							    </select>
							    <button type="submit">
							        <i class="ti ti-search"></i>
							    </button>
							</form>
							<!-- end search -->

                        </div>
                    </div>
                </div>
                <!-- end main title -->

                <!-- items -->
                <div class="col-12">
                    <div class="catalog catalog--1">
                        <table class="catalog__table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>ROOM NAME</th>
                                    <th>CINEMA NAME</th>
                                    <th>SCREEN TYPE</th>
                                    <th>CAPACITY</th>
                                    <th>STATUS</th>
                                    <th>ACTIONS</th>
                                </tr>
                            </thead>
		
        <tbody>
    		<c:forEach var="room" items="${rooms}">
        <tr>
            <td><div class="catalog__text">${room.roomID}</div></td> 
            <td><div class="catalog__text"><a href="${pageContext.request.contextPath}/admin/moviescreenings?id=${room.roomID}&cinemaId=${cinemaId}">${room.roomName}</a></div></td> 
            <td><div class="catalog__text">${cinemaName}</div> </td>
            <td><div class="catalog__text">${room.screenType}</div> </td>                        
            <td><div class="catalog__text">${room.chairNumber}</div> </td>
            <td><div class="catalog__text ${room.status ? 'catalog__text--green' : 'catalog__text--red'}">${room.status ? 'Active' : 'Inactive'}</div></td>
            <td>
                <div class="catalog__btns">
                    <a href="${pageContext.request.contextPath}/admin/editRoom?roomId=${room.roomID}&cinemaId=${cinemaId}" class="catalog__btn catalog__btn--edit">
                        <i class="ti ti-edit"></i>
                    </a>
                    <button type="button" class="catalog__btn catalog__btn--delete delete-room-btn" data-bs-toggle="modal" data-bs-target="#modal-delete" data-room-id="${room.roomID}" data-cinema-id="${cinemaId}">
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
                <!-- end items -->

 				
            </div>
        </div>
    </main>
    <!-- end main content -->

    <!-- Add Room modal -->
    <div class="modal fade" id="modal-add-room" tabindex="-1" aria-labelledby="modal-add-room" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal__content">
                    <form action="${pageContext.request.contextPath}/admin/addRoom" method="POST" class="modal__form">
                        <h4 class="modal__title">Add Room</h4>
                        
                        <input type="hidden" name="cinemaId" value="${cinemaId}">

                        <div class="row">
                            <div class="col-12">
                                <div class="sign__group">
                                    <label class="sign__label" for="cinema_name">Cinema Name</label>
                                    <input id="cinema_name" type="text" name="cinema_name" class="sign__input" value="${cinemaName}" readonly>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="sign__group">
                                    <label class="sign__label" for="room_name">Room Name</label>
                                    <input id="room_name" type="text" name="room_name" class="sign__input" placeholder="Room Name" required>
                                </div>
                            </div>

							<div class="col-12">
							    <div class="sign__group">
							        <label class="sign__label" for="capacity">Capacity</label>
							        <input id="capacity" type="number" name="capacity" class="sign__input" placeholder="Capacity" value="70" readonly>
							    </div>
							</div>


                            <div class="col-12">
                                <div class="sign__group">
                                    <label class="sign__label" for="room_type">Room Type</label>
                                    <select class="sign__select" id="room_type" name="room_type" required>
                                        <option value="2D">2D</option>
                                        <option value="3D">3D</option>
                                        <option value="IMAX">IMAX</option>
                                        <!-- Add other room types as needed -->
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-12">
                        <label class="sign__label" for="status">Status</label>
                        <div class="sign__group">
                        	
                            <select class="sign__select" name="status" id="status" required>
                                <option value="true">Active</option>
                                <option value="false">Inactive</option>
                            </select>
                        </div>
                    	</div>

                            <div class="col-12 col-lg-6 offset-lg-3">
                                <button type="submit" class="sign__btn sign__btn--modal">Add Room</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- end Add Room modal -->
<!-- Delete Modal -->
<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="modal-delete" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal__content">
                <form action="${pageContext.request.contextPath}/admin/deleteRoom" method="POST" id="deleteRoomForm" class="modal__form">
                    <h4 class="modal__title">Delete Room</h4>
                    <p class="modal__text">Are you sure you want to permanently delete this room?</p>
                    <input type="hidden" name="id" id="deleteRoomId">
                    <input type="hidden" name="cinemaId" id="deleteCinemaId"> <!-- Hidden input for cinemaId -->
                    <div class="modal__btns">
                        <button class="modal__btn modal__btn--apply" type="submit"><span>Delete</span></button>
                        <button class="modal__btn modal__btn--dismiss" type="button" data-bs-dismiss="modal" aria-label="Close"><span>Dismiss</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end delete modal -->


<script>
document.querySelectorAll('.catalog__btn--delete').forEach(button => {
    button.addEventListener('click', function () {
        const roomId = this.getAttribute('data-room-id');
        const cinemaId = this.getAttribute('data-cinema-id');
        document.getElementById('deleteRoomId').value = roomId; // Gắn roomId vào hidden input
        document.getElementById('deleteCinemaId').value = cinemaId; // Gắn cinemaId vào hidden input
    });
});

</script>

</body>