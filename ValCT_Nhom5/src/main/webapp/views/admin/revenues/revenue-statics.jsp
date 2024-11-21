<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<!-- Mirrored from hotflix.volkovdesign.com/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:30 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Online Movies, TV Shows & Cinema HTML Template">
<meta name="keywords" content="">
<meta name="author" content="Dmitry Volkov">
<title>HotFlix – Online Movies, TV Shows & Cinema HTML Template</title>

<!-- Code Thao -->

<style>
#report {
	background-color: #333;
	padding: 20px;
	border-radius: 8px;
	color: #fff;
	margin-top: 20px;
	display: none;
}

.tab {
	flex: 1; /* Đảm bảo các tab có cùng chiều rộng */
	text-align: center; /* Căn chữ ở giữa nút */
}

.tab button {
	width: 100%; /* Đảm bảo nút chiếm toàn bộ chiều rộng của tab */
	background-color: #4CAF50;
	color: white;
	font-size: 24px;
	padding: 10px;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

.tab button:hover {
	background-color: #45a049; /* Đổi màu khi hover */
}

.tab button.active {
	background-color: #3e8e41; /* Màu nút khi được chọn */
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

.tablinks {
	padding: 10px 20px;
	border: none;
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- header -->
	<header class="header">
		<div class="header__content">
			<!-- header logo -->
			<a href="index.html" class="header__logo"> <img
				src="/ValCT_Nhom5/assets2/img/logo.svg" alt="">
			</a>
			<!-- end header logo -->

			<!-- header menu btn -->
			<button class="header__btn" type="button">
				<span></span> <span></span> <span></span>
			</button>
			<!-- end header menu btn -->
		</div>
	</header>
	<!-- end header -->

	<!-- sidebar -->
	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="index.html" class="sidebar__logo"> <img
			src="/ValCT_Nhom5/assets2/img/logo.svg" alt="">
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
				<li class="sidebar__nav-item"><a href="index.html"
					class="sidebar__nav-link"><i class="ti ti-layout-grid"></i> <span>Dashboard</span></a>
				</li>
				<li class="sidebar__nav-item"><a href="Services.html"
					class="sidebar__nav-link"><i class="ti ti-candy"></i> <span>Services</span></a>
				</li>

				<li class="sidebar__nav-item"><a href="cinema.html"
					class="sidebar__nav-link  "><i class="ti ti-building"></i> <span>Cinema</span></a>
				</li>
				<li class="sidebar__nav-item"><a href="catalog.html"
					class="sidebar__nav-link"><i class="ti ti-movie"></i> <span>Catalog</span></a>
				</li>

				<li class="sidebar__nav-item"><a href="users.html"
					class="sidebar__nav-link"><i class="ti ti-users"></i> <span>Users</span></a>
				</li>

				<li class="sidebar__nav-item"><a href="comments.html"
					class="sidebar__nav-link"><i class="ti ti-message"></i> <span>Comments</span></a>
				</li>
				<li class="sidebar__nav-item"><a href="revenues.html"
					class="sidebar__nav-link  sidebar__nav-link--active"><i
						class="ti ti-revenues"></i> <span>Revenues</span></a></li>
				<li class="sidebar__nav-item"><a href="discounts.html"
					class="sidebar__nav-link"><i class="ti ti-discounts"></i> <span>Discounts</span></a>
				</li>
				<li class="sidebar__nav-item"><a href="reviews.html"
					class="sidebar__nav-link"><i class="ti ti-star-half-filled"></i>
						<span>Reviews</span></a></li>

				<li class="sidebar__nav-item"><a href="settings.html"
					class="sidebar__nav-link"><i class="ti ti-settings"></i> <span>Settings</span></a>
				</li>
				<!-- dropdown -->
				<li class="sidebar__nav-item"><a class="sidebar__nav-link"
					href="#" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"><i class="ti ti-files"></i> <span>Pages</span>
						<i class="ti ti-chevron-down"></i></a>

					<ul class="dropdown-menu sidebar__dropdown-menu">
						<li><a href="add-cinema.html">Add Cinema</a></li>
						<li><a href="add-popcorn.html">Add Service</a></li>
						<li><a href="add-item.html">Add Movie</a></li>
						<li><a href="edit-user.html">Edit user</a></li>
						<li><a href="signin.html">Sign In</a></li>
						<li><a href="signup.html">Sign Up</a></li>
						<li><a href="forgot.html">Forgot password</a></li>
						<li><a href="404.html">404 Page</a></li>
					</ul></li>

				<!-- end dropdown -->

				<li class="sidebar__nav-item"><a
					href="https://hotflix.volkovdesign.com/main/index.html"
					class="sidebar__nav-link"><i class="ti ti-arrow-left"></i> <span>Back
							to HotFlix</span></a></li>
			</ul>
		</div>
		<!-- end sidebar nav -->

		<!-- sidebar copyright -->
		<div class="sidebar__copyright">
			© HOTFLIX, 2019—2024. <br>Create by <a
				href="https://themeforest.net/user/dmitryvolkov/portfolio"
				target="_blank">Dmitry Volkov</a>
		</div>
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
						<h2>Revenue Statistics</h2>
					</div>
				</div>
				<!-- end main title -->
				<div class="tab-container"
					style="display: flex; justify-content: flex-start; align-items: center; gap: 0px; margin-top: 20px;">

					<div class="tab">
						<button class="tablinks" onclick="showOption(event, 'time-group')"
							style="color: white; font-size: 24px;">Time</button>
					</div>
					<div class="tab">
						<button class="tablinks"
							onclick="showOption(event, 'movie-group')"
							style="color: white; font-size: 24px;">Movies</button>
					</div>
					<div class="tab">
						<button class="tablinks"
							onclick="showOption(event, 'region-group')"
							style="color: white; font-size: 24px;">Regions</button>
					</div>
				</div>
			</div>
			<div class="row">
				<select id="time-option" class="form-select  time-group"
					style="display: none;">
					<option value="">Select Time</option>
					<option value="day" selected>Day</option>
					<option value="month">Month</option>
					<option value="year">Year</option>
				</select> <input type="date" id="dateValue" name="dateValue"
					class="form-select  time-group" style="display: none;"
					value="2024-11-21">
			</div>
			<div class="row">
				<select id="movie-option" class="form-select movie-group"
					style="display: none;">
					<option value="">Select Movie</option>
					<option value="movie1">Phim A</option>
					<option value="movie2">Phim B</option>
					<option value="movie3">Phim C</option>
				</select>
			</div>
			<div class="row">
				<select id="region-option" class="form-select  region-group"
					style="display: none;">
					<option value="">Select Region</option>
					<option value="region1">Khu vực 1</option>
					<option value="region2">Khu vực 2</option>
					<option value="region3">Khu vực 3</option>
				</select>
			</div>


			<div class="row form-select-table  time-group"
				style="display: none; backgroud-color: #222028;">
				<!-- Table -->
				<h2 style="text-align: center; color: white;">Doanh Thu Movie</h2>
				<table>
					<thead>
						<tr>
							<th>Bo phim</th>
							<th>Tong tien ve ban</th>
							<th>Tong doanh thu</th>
							<th>Tong so ve ban</th>
							<th>Tong chiet khau</th>
						</tr>
					</thead>
					<tbody>
						<!-- Lặp qua danh sách dữ liệu (ví dụ từ cơ sở dữ liệu) -->
						<c:forEach var="movieRevenue" items="${movieRevenues}">
							<tr>
								<td>${movieRevenue[0]}</td>
								<td>${movieRevenue[1]}</td>
								<td>${movieRevenue[2]}</td>
								<td>${movieRevenue[3]}</td>
								<td><fmt:formatNumber
										value="${movieRevenue[1] - movieRevenue[2]}" type="number"
										maxFractionDigits="2" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<h2 style="text-align: center; color: white;">Doanh Thu Dich Vu</h2>
				<table>
					<thead>
						<tr>
							<th>Ten dich vu</th>
							<th>Tong tien dich vu</th>
							<th>Tong doanh thu</th>
							<th>So luong</th>
							<th>Tong chiet khau</th>
						</tr>
					</thead>
					<tbody>
						<!-- Lặp qua danh sách dữ liệu (ví dụ từ cơ sở dữ liệu) -->
						<c:forEach var="popcornRevenue" items="${popcornRevenues}">
							<tr>
								<td>${popcornRevenue[0]}</td>
								<td>${popcornRevenue[1]}</td>
								<td>${popcornRevenue[2]}</td>
								<td>${popcornRevenue[3]}</td>
								<td><fmt:formatNumber
										value="${popcornRevenue[1] - popcornRevenue[2]}" type="number"
										maxFractionDigits="2" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<!-- Revenue -->
				<div class="wg-box">
					<div class="flex items-center justify-between">
						<h5>Chart</h5>
					</div>
					<div class="flex flex-wrap gap40">
						<div>
							<div class="mb-1">
								<div class="block-legend">
									<div class="dot t3"></div>
									<div class="text-tiny" style = "color :white; font-size: 30px;">Movie</div>
								</div>
							</div>
						</div>
					</div>
					<div id="line-chart-7"></div>
					<div class="flex flex-wrap gap40">
						<div>
							<div class="mb-1">
								<div class="block-legend">
									<div class="dot t5"></div>
									<div class="text-tiny" style = "color :white; font-size: 30px;">PopCorn</div>
								</div>
							</div>
						</div>
					</div>

					<div id="line-chart-popcorn"></div>
				</div>
				<!-- /Revenue -->
			</div>
	</main>
	<!-- end main content -->


	<script>
		function showOption(evt, optionName) {
			console.log("Head" + document.head.innerHTML)
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("form-select");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			
			tabcontent = document.getElementsByClassName("form-select-table");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			const elements = document.getElementsByClassName(optionName)
			Array.from(elements).forEach(element => {
			    element.style.display = 'block'; // Ẩn từng phần tử
			});
			evt.currentTarget.className += " active";
		}
		//gui yeu cau GET toi controller
		document.getElementById('dateValue').addEventListener('change', function () {
		    // Lấy giá trị ngày được chọn
		    const selectedDate = this.value;
			const dateType = document.getElementById('time-option').value;
		    // Kiểm tra nếu giá trị không rỗng
		    if (selectedDate) {
		        // Tạo URL để gửi yêu cầu GET
		        const tmp = `${pageContext.request.contextPath}`;
		        const url = tmp + "/admin/revenues-statics?dateValue="+selectedDate + "&dateType="+dateType;
		        // Gửi yêu cầu GET (chuyển hướng trình duyệt đến URL)
		        window.location.href = url;
		    }
		});
		

		
		
		
		
		
		// Hàm thêm CSS vào thẻ <head>
		function addStylesToHead() {
		    // Tạo thẻ <style>
		    const styleTag = document.createElement('style');
		    styleTag.type = 'text/css';

		    // Nội dung CSS
		    const cssContent = `
		    	#report {
				background-color: #333;
				padding: 20px;
				border-radius: 8px;
				color: #fff;
				margin-top: 20px;
				display: none;
			}
			
			.tab {
				flex: 1; /* Đảm bảo các tab có cùng chiều rộng */
				text-align: center; /* Căn chữ ở giữa nút */
				
			}
			
			.tab button {
				width: 100%; /* Đảm bảo nút chiếm toàn bộ chiều rộng của tab */
				background-color: #222028;
				padding:10px;
				color: white;
				font-size: 24px;
				
				border: 2px solid transparent;
				cursor: pointer;
				transition: background-color 0.3s;
			}
			
			.tab button:hover {
				border-color: #f3a701; /* Đổi màu khi hover */
			}
			
			.tab button.active {
				border-color: #f3a701; ; /* Màu nút khi được chọn */
			}
			
			/* Style the tab content */
			.tabcontent {
				display: none;
				padding: 6px 12px;
				border: 2px solid #ccc;
				border-top: none;
			}
			
			.tablinks {
				padding: 0px 0px;
				border: none;
				background-color: #4CAF50;
				color: white;
				cursor: pointer;
			}
			
			 table {
		            width: 80%;
		            border-collapse: collapse;
		            margin: 20px auto;
		            font-family: Arial, sans-serif;
		        }

		        th, td {
		            border: 1px solid #ddd;
		            padding: 8px;
		            text-align: center;
		        	color : white;
		        }

		        th {
		            background-color: #222028;
		            color: white;
		        }

		        tr:nth-child(even) {
		            background-color: #222028;
		        }

		        tr:hover {
		        	 border: 2px solid #f3a701; /* Màu viền khi hover */
		        }
		        //code css chart
		        .wg-box {
		            display: flex;
		            flex-direction: column;
		            gap: 20px;
		        }

		        .wg-box .flex {
		            display: flex;
		            align-items: center;
		            justify-content: space-between;
		        }

		        .wg-box .flex.flex-wrap.gap40 {
		            display: flex;
		            justify-content: space-between; /* Căn đều hai phần tử Revenue và Order */
		            align-items: center;
		            gap: 40px; /* Khoảng cách giữa các phần tử */
		        }

		        .wg-box h5 {
		            font-size: 1.5em;
		            color: white;
		            margin-bottom: 0;
		        }

		        .block-legend {
		            display: flex;
		            align-items: center;
		            gap: 10px;
		        }

		        .block-legend .dot {
		            width: 10px;
		            height: 10px;
		            border-radius: 50%;
		        }

		        .block-legend .dot.t3 {
		            background-color: orange;
		        }

		        .block-legend .dot.t5 {
		            background-color: purple;
		        }

		        .mb-1 {
		            margin-bottom: 8px;
		        }

		        .box-icon-trending {
		            display: flex;
		            align-items: center;
		            gap: 5px;
		        }

		        .box-icon-trending.up i {
		            color: green;
		        }

		        h4 {
		            font-size: 2em;
		            margin: 0;
		        }

		    `;

		    // Gắn nội dung CSS vào thẻ <style>
		    styleTag.innerHTML = cssContent;

		    // Thêm thẻ <style> vào <head>
		    document.head.appendChild(styleTag);

		}

		// Gọi hàm để thêm CSS khi tài liệu đã tải
		addStylesToHead();


	</script>
	<script>
    var chartDataMovie = ${chartDataMovie}; // Nhúng dữ liệu JSON vào biến JavaScript
    var chartDataPopCorn = ${chartDataPopCorn}; // Nhúng dữ liệu JSON vào biến JavaScript
</script>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script
		src=" ${pageContext.request.contextPath}/assets2/js/jquery.min.js"></script>
	<script
		src=" ${pageContext.request.contextPath}/assets2/js/apexcharts/line-chart-7.js"></script>
	<script
		src=" ${pageContext.request.contextPath}/assets2/js/apexcharts/line-chart-popcorn.js"></script>


</body>

<!-- Mirrored from hotflix.volkovdesign.com/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:36 GMT -->
</html>