<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">


<!DOCTYPE html>

<body>


    <!-- main content -->
    <main class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <!-- main title -->
                <div class="col-12">
                    <div class="main__title">
						<h2>
						  <a href="${pageContext.request.contextPath}/admin/cinemas" style="text-decoration: none; color: inherit;">
						    Cinemas
						  </a>
						</h2>
                        <span class="main__title-stat">Total Cinemas : ${noOfRecords}</span>
                        <div class="main__title-wrap">
                            <button class="main__title-link main__title-link--wrap" data-bs-toggle="modal" data-bs-target="#modal-add-cinema">Add Cinema</button>
                            
							<!-- search -->
							<form action="${pageContext.request.contextPath}/admin/searchCinema" method="get" class="main__title-form">
							    <select name="location" class="sign__select" required>
							        <option value="All" <c:if test="${location == 'All'}">selected</c:if>>All Locations</option>
							        <option value="Hồ Chí Minh" <c:if test="${location == 'Hồ Chí Minh'}">selected</c:if>>Hồ Chí Minh</option>
							        <option value="Hà Nội" <c:if test="${location == 'Hà Nội'}">selected</c:if>>Hà Nội</option>
							        <option value="Đà Nẵng" <c:if test="${location == 'Đà Nẵng'}">selected</c:if>>Đà Nẵng</option>
							        <option value="Hải Phòng" <c:if test="${location == 'Hải Phòng'}">selected</c:if>>Hải Phòng</option>
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
                                    <th>CINEMA NAME</th>
                                    <th>ADDRESS</th>
                                    <th>Location</th>
                                    <th>NUMBER OF ROOMS</th>
                                    <th>STATUS</th>
                                    <th>ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cinema" items="${cinemas}">
                                    <tr>
                                        <td><div class="catalog__text">${cinema.cinemaID}</div></td>
                                        <td><div class="catalog__text"><a href="${pageContext.request.contextPath}/admin/rooms?id=${cinema.cinemaID}">${cinema.cinemaName}</a></div></td>
                                        <td><div class="catalog__text">${cinema.address}</div></td>
                                        <td><div class="catalog__text">${cinema.location}</div></td>
                                        <td><div class="catalog__text">${cinema.roomCount}</div></td>
                                        <td><div class="catalog__text ${cinema.status ? 'catalog__text--green' : 'catalog__text--red'}">${cinema.status ? 'Active' : 'Inactive'}</div></td>
                                        <td>
                                            <div class="catalog__btns">
                                                <a href="${pageContext.request.contextPath}/admin/editCinema?id=${cinema.cinemaID}" class="catalog__btn catalog__btn--edit">
                                                    <i class="ti ti-edit"></i>
                                                </a>
                                                <button type="button" data-bs-toggle="modal" class="catalog__btn catalog__btn--delete" data-bs-target="#modal-delete" data-cinema-id="${cinema.cinemaID}">
                                                    <i class="ti ti-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
<!-- pagination -->
<div class="col-12">
    <div class="main__paginator">
        <!-- amount -->
        <span class="main__paginator-pages">${currentPage} of ${noOfPages}</span>
        <!-- end amount -->

        <ul class="main__paginator-list">
            <!-- Previous Page Link -->
            <li>
                <c:choose>
                    <c:when test="${not empty location && location != 'All'}">
                        <a href="<c:url value='/admin/searchCinema'>
                            <c:param name='location' value='${location}'/>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                            <span>Prev</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/cinemas'>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                            <span>Prev</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>

            <!-- Next Page Link -->
            <li>
                <c:choose>
                    <c:when test="${not empty location && location != 'All'}">
                        <a href="<c:url value='/admin/searchCinema'>
                            <c:param name='location' value='${location}'/>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <span>Next</span>
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/cinemas'>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <span>Next</span>
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>

        <ul class="paginator">
            <!-- Previous Page Link -->
            <li class="paginator__item paginator__item--prev">
                <c:choose>
                    <c:when test="${not empty location && location != 'All'}">
                        <a href="<c:url value='/admin/searchCinema'>
                            <c:param name='location' value='${location}'/>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/cinemas'>
                            <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                        </c:url>">
                            <i class="ti ti-chevron-left"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>

            <!-- Page Numbers -->
            <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
                <li class="paginator__item ${pageNumber == currentPage ? 'paginator__item--active' : ''}">
                    <c:choose>
                        <c:when test="${not empty location && location != 'All'}">
                            <a href="<c:url value='/admin/searchCinema'>
                                <c:param name='location' value='${location}'/>
                                <c:param name='page' value='${pageNumber}'/>
                            </c:url>">${pageNumber}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/admin/cinemas'>
                                <c:param name='page' value='${pageNumber}'/>
                            </c:url>">${pageNumber}</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </c:forEach>

            <!-- Next Page Link -->
            <li class="paginator__item paginator__item--next">
                <c:choose>
                    <c:when test="${not empty location && location != 'All'}">
                        <a href="<c:url value='/admin/searchCinema'>
                            <c:param name='location' value='${location}'/>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/admin/cinemas'>
                            <c:param name='page' value='${currentPage < noOfPages ? currentPage + 1 : noOfPages}'/>
                        </c:url>">
                            <i class="ti ti-chevron-right"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>
</div>
<!-- end pagination -->


                </div>
                <!-- end items -->
            </div>
        </div>
    </main>
    <!-- end main content -->

    <!-- add cinema modal -->
<div class="modal fade" id="modal-add-cinema" tabindex="-1" aria-labelledby="modal-add-cinema" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/addCinema" method="POST" class="sign__form sign__form--add">
                <h4 class="modal__title">Add Cinema</h4>
                <div class="row">
                    <div class="col-12">
                        <label class="sign__label" for="cinema_name">Cinema Name</label>
                        <div class="sign__group">
                            <input type="text" class="sign__input" name="cinema_name" placeholder="Cinema Name" required>
                        </div>
                    </div>

                    <div class="col-12">
                        <label class="sign__label" for="address">Address</label>
                        <div class="sign__group">
                            <input type="text" class="sign__input" name="address" placeholder="Address" required>
                        </div>
                    </div>

					<div class="col-12">
					    <label class="sign__label" for="location">Location</label>
					    <div class="sign__group">
					        <select class="sign__select" name="location" required>
					            <option value="">Select Location</option>
					            <option value="Hồ Chí Minh">Hồ Chí Minh</option>
					            <option value="Hà Nội">Hà Nội</option>
					            <option value="Đà Nẵng">Đà Nẵng</option>
					            <option value="Hải Phòng">Hải Phòng</option>
					        </select>
					    </div>
					</div>


                    <div class="col-12">
                        <label class="sign__label" for="num_rooms">Number of Rooms</label>
                        <div class="sign__group">
                            <input type="number" class="sign__input" name="num_rooms" placeholder="Number of Rooms" required>
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
                    <div class="col-12">
                        <button type="submit" class="sign__btn sign__btn--small"><span>Save</span></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- end add cinema modal -->


   <!-- delete modal -->
<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="modal-delete" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal__content">
                <form action="${pageContext.request.contextPath}/admin/deleteCinema" method="POST" id="deleteCinemaForm" class="modal__form">
                    <h4 class="modal__title">Delete Cinema</h4>
                    <p class="modal__text">Are you sure you want to permanently delete this cinema?</p>
                    <input type="hidden" name="id" id="deleteCinemaId">
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
    // JavaScript to assign the cinema ID to the hidden input field in the delete form
    document.querySelectorAll('.catalog__btn--delete').forEach(button => {
        button.addEventListener('click', function () {
            const cinemaId = this.getAttribute('data-cinema-id');
            document.getElementById('deleteCinemaId').value = cinemaId;
        });
    });
</script>


</body>
