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
                        <h2>Edit Cinema</h2>
                         
                    </div>
                    
                </div>
                <!-- end main title -->

                <!-- form -->
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/admin/editCinema" method="POST" class="sign__form sign__form--add">
                        <div class="row">
                            <div class="col-12">
                                <label class="sign__label" for="cinema_name">Cinema Name</label>
                                <div class="sign__group">
                                    <input type="hidden" name="id" value="${cinema.cinemaID}">
                                    <input type="text" class="sign__input" name="cinema_name" value="${cinema.cinemaName}" placeholder="Cinema Name" required>
                                </div>
                            </div>

                            <div class="col-12">
                            	<label class="sign__label" for="cinema_address">Address</label>
                                <div class="sign__group">
                                    <input type="text" class="sign__input" name="address" value="${cinema.address}" placeholder="Address" required>
                                </div>
                            </div>
                            <div class="col-12">
                            	<label class="sign__label" for="cinema_location">Location</label>
                                <div class="sign__group">
                                    <input type="text" class="sign__input" name="location" value="${cinema.location}" placeholder="Location" required>
                                </div>
                            </div>

                            <div class="col-12">
                            	<label class="sign__label" for="cinema_num_rooms">Number of Room</label>
                                <div class="sign__group">
                                    <input type="number" class="sign__input" name="num_rooms" value="${cinema.roomCount}" placeholder="Number of Rooms" required>
                                </div>
                            </div>

                            <div class="col-12">
                            	<label class="sign__label" for="cinema_status">Status</label>
                                <div class="sign__group">
                            <select class="sign__select" name="status" id="status" required>
                                        <option value="true" ${cinema.status ? 'selected' : ''}>Active</option>
                                        <option value="false" ${!cinema.status ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </div>
                            </div>

							<div class="col-12 d-flex justify-content-start align-items-center" style="gap: 15px;">
							                                               <a href="${pageContext.request.contextPath}/admin/cinemas" class="sign__btn sign__btn--small sign__btn--outline"><span>Back to List</span></a>							    
							    
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