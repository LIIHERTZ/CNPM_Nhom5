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
                        <h2>Edit Room</h2>
                    </div>
                    
                </div>
                <!-- end main title -->

                <!-- form -->
                <form action="${pageContext.request.contextPath}/admin/editRoom?roomId=${room.roomID}&cinemaId=${cinemaId}" method="POST" class="sign__form sign__form--add">

    <div class="col-12">
        <label class="sign__label" for="cinema_num_rooms">Cinema Name</label>
        <div class="sign__group">
            <input type="text" class="sign__input" name="cinema_name" value="${cinemaName}" placeholder="Cinema Name" readonly>
        </div>
    </div>

    <div class="col-12">
        <label class="sign__label" for="room_name">Room Name</label>
        <div class="sign__group">
            <input type="text" class="sign__input" name="room_name" value="${room.roomName}" placeholder="Room Name" required>
        </div>
    </div>

    <div class="col-12">
        <label class="sign__label" for="seating_capacity">Number of Seats</label>
        <div class="sign__group">
            <input type="number" class="sign__input" name="seating_capacity" value="${room.chairNumber}" placeholder="Seating Capacity" readonly>
        </div>
    </div>

    <div class="col-12">
        <label class="sign__label" for="room_type">Screen Type</label>
        <div class="sign__group">
            <select class="sign__selectjs" name="room_type" id="sign__roomtype" required>
                <option value="2D" ${room.screenType == '2D' ? 'selected' : ''}>2D</option>
                <option value="3D" ${room.screenType == '3D' ? 'selected' : ''}>3D</option>
                <option value="IMAX" ${room.screenType == 'IMAX' ? 'selected' : ''}>IMAX</option>
            </select>
        </div>
    </div>

    <div class="col-12">
        <label class="sign__label" for="status">Status</label>
        <div class="sign__group">
            <select class="sign__select" name="status" id="status" required>
                <option value="true" ${room.status ? 'selected' : ''}>Active</option>
                <option value="false" ${!room.status ? 'selected' : ''}>Inactive</option>
            </select>
        </div>
    </div>

    <div class="col-12 d-flex justify-content-start align-items-center" style="gap: 15px;">
     <a href="${pageContext.request.contextPath}/admin/rooms?id=${room.cinema.cinemaID}" class="sign__btn sign__btn--small sign__btn--outline"><span>Back to List</span></a>
    <button type="submit" class="sign__btn sign__btn--small"><span>Apply Changes</span></button>
	</div>


</form>

                <!-- end form -->
            </div>
        </div>
    </main>
    <!-- end main content -->
</body>