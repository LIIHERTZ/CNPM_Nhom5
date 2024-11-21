<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<body>
    <!-- header -->
    <header class="header">
        <div class="header__content">
            <!-- header logo -->
            <a href="index.html" class="header__logo">
                <img src="/ValCT_Nhom5/assets2/img/logo.svg" alt="Logo">

            </a>
            <!-- end header logo -->

            <!-- header menu btn -->
            <button class="header__btn" type="button">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <!-- end header menu btn -->
        </div>
    </header>
    <!-- end header -->

    <!-- sidebar -->
    <div class="sidebar">
        <!-- sidebar logo -->
        <a href="index.html" class="sidebar__logo">
            <img src="/ValCT_Nhom5/assets2/img/logo.svg" alt="">
        </a>
        <!-- end sidebar logo -->

        <!-- sidebar user -->
        <div class="sidebar__user">
            <div class="sidebar__user-img">
                <img src="/ValCT_Nhom5/assets2/img/user.svg" alt="">
            </div>

            <div class="sidebar__user-title">
                <span>Admin</span>
                <p>John Doe</p>
            </div>

            <button class="sidebar__user-btn" type="button">
                <i class="ti ti-logout"></i>
            </button>
        </div>
        <!-- end sidebar user -->

        <!-- sidebar nav -->
        <div class="sidebar__nav-wrap">
            <ul class="sidebar__nav">
                <li class="sidebar__nav-item">
                    <a href="index.html" class="sidebar__nav-link"><i class="ti ti-layout-grid"></i> <span>Dashboard</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="Services.html" class="sidebar__nav-link"><i class="ti ti-candy"></i> <span>Services</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="/admin/cinemas" class="sidebar__nav-link sidebar__nav-link--active"><i class="ti ti-building"></i> <span>Cinema</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="catalog.html" class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Catalog</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="users.html" class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="comments.html" class="sidebar__nav-link"><i class="ti ti-message"></i> <span>Comments</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="revenues.html" class="sidebar__nav-link"><i class="ti ti-revenues"></i> <span>Revenues</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="discounts.html" class="sidebar__nav-link"><i class="ti ti-discounts"></i> <span>Discounts</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="reviews.html" class="sidebar__nav-link"><i class="ti ti-star-half-filled"></i> <span>Reviews</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a href="settings.html" class="sidebar__nav-link"><i class="ti ti-settings"></i> <span>Settings</span></a>
                </li>
                <li class="sidebar__nav-item">
                    <a class="sidebar__nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="ti ti-files"></i> <span>Pages</span> <i class="ti ti-chevron-down"></i></a>
                    <ul class="dropdown-menu sidebar__dropdown-menu">
                        <li><a href="#" data-bs-toggle="modal" data-bs-target="#modal-add-cinema">Add Cinema</a></li>
                        <li><a href="add-popcorn.html">Add Service</a></li>
                        <li><a href="add-item.html">Add Movie</a></li>
                        <li><a href="edit-user.html">Edit user</a></li>
                        <li><a href="signin.html">Sign In</a></li>
                        <li><a href="signup.html">Sign Up</a></li>
                        <li><a href="forgot.html">Forgot password</a></li>
                        <li><a href="404.html">404 Page</a></li>
                    </ul>
                </li>
                <li class="sidebar__nav-item">
                    <a href="https://hotflix.volkovdesign.com/main/index.html" class="sidebar__nav-link"><i class="ti ti-arrow-left"></i> <span>Back to HotFlix</span></a>
                </li>
            </ul>
        </div>
        <!-- end sidebar nav -->

        <!-- sidebar copyright -->
        <div class="sidebar__copyright">&copy; HOTFLIX, 2019—2024. <br>Create by <a href="https://themeforest.net/user/dmitryvolkov/portfolio" target="_blank">Dmitry Volkov</a></div>
        <!-- end sidebar copyright -->
    </div>
    <!-- end sidebar -->

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
                                <input type="text" name="keyword" placeholder="Find cinema by location..">
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
                                    <a href="<c:url value='/admin/cinemas'>
                                        <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                                    </c:url>">
                                        <i class="ti ti-chevron-left"></i>
                                        <span>Prev</span>
                                    </a>
                                </li>

                                <!-- Next Page Link -->
                                <li>
                                    <a href="<c:url value='/admin/cinemas'>
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
                                    <a href="<c:url value='/admin/cinemas'>
                                        <c:param name='page' value='${currentPage > 1 ? currentPage - 1 : 1}'/>
                                    </c:url>">
                                        <i class="ti ti-chevron-left"></i>
                                    </a>
                                </li>

                                <!-- Page Numbers -->
                                <c:forEach begin="1" end="${noOfPages}" var="pageNumber">
                                    <li class="paginator__item ${pageNumber == currentPage ? 'paginator__item--active' : ''}">
                                        <a href="<c:url value='/admin/cinemas'>
                                            <c:param name='page' value='${pageNumber}'/>
                                        </c:url>">${pageNumber}</a>
                                    </li>
                                </c:forEach>

                                <!-- Next Page Link -->
                                <li class="paginator__item paginator__item--next">
                                    <a href="<c:url value='/admin/cinemas'>
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
                            <input type="text" class="sign__input" name="location" placeholder="Location" required>
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
                            <select class="sign__selectjs" name="status" id="sign__status" required>
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
