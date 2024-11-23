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
                <img src="/ValCT_Nhom5/assets2/img/logo.svg" alt="">
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
                    <a href="cinema.html" class="sidebar__nav-link  sidebar__nav-link--active "><i class="ti ti-building"></i> <span>Cinema</span></a>
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
                <!-- dropdown -->
                <li class="sidebar__nav-item">
                    <a class="sidebar__nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="ti ti-files"></i> <span>Pages</span> <i class="ti ti-chevron-down"></i></a>

                    <ul class="dropdown-menu sidebar__dropdown-menu">
                        <li><a href="add-cinema.html">Add Cinema</a></li>
                        <li><a href="add-popcorn.html">Add Service</a></li>
                        <li><a href="add-item.html">Add Movie</a></li>
                        <li><a href="edit-user.html">Edit user</a></li>
                        <li><a href="signin.html">Sign In</a></li>
                        <li><a href="signup.html">Sign Up</a></li>
                        <li><a href="forgot.html">Forgot password</a></li>
                        <li><a href="404.html">404 Page</a></li>
                    </ul>
                </li>
               
                <!-- end dropdown -->

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
            <input type="number" class="sign__input" name="seating_capacity" value="${room.chairNumber}" placeholder="Seating Capacity" required>
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
            <select class="sign__selectjs" name="status" id="sign__status" required>
                <option value="true" ${room.status ? 'selected' : ''}>Active</option>
                <option value="false" ${!room.status ? 'selected' : ''}>Inactive</option>
            </select>
        </div>
    </div>

    <div class="col-12">
        <button type="submit" class="sign__btn sign__btn--small"><span>Apply Changes</span></button>
    </div>
</form>

                <!-- end form -->
            </div>
        </div>
    </main>
    <!-- end main content -->
</body>