<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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
</head>

<body>
	<!-- main content -->
	<main class="container-fluid">
		<div class="container-fluid">
			<div class="row" style="margin-bottom: 20px;">
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
							onclick="showOptionAndFetchData(event, 'region-group')"
							style="color: white; font-size: 24px;">Regions</button>
					</div>
				</div>
			</div>



			<div class="row">
				<div id="Time" class="time-container">
					<select id="time-option"
						class="form-select  time-group sign__select"
						style="display: none;">
						<option value="">Select Time</option>
						<option value="day" ${dateType == 'day' ? 'selected' : ''}>Day</option>
						<option value="month" ${dateType == 'month' ? 'selected' : ''}>Month</option>
						<option value="year" ${dateType == 'year' ? 'selected' : ''}>Year</option>
					</select> <input type="date" id="dateValue" name="dateValue"
						class="form-select  time-group" style="display: none;"
						value="${dateValue}">
				</div>
<%--				<c:if--%>
<%--					test="${not empty popcornRevenues and not empty movieRevenues}">--%>

					<div class="form-select-table  time-group"
						style="display: none; backgroud-color: #222028;">
						<!-- Table  Doanh thu cua tab "Time"-->
						<h2 style="text-align: center; color: white;">Doanh Thu Theo
							Bo phim</h2>
						<table>
							<thead>
								<tr>
									<th>Ten phim</th>
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
										<td><fmt:formatNumber value="${movieRevenue[1]}"
												type="number" maxFractionDigits="2" /></td>
										<td><fmt:formatNumber value="${movieRevenue[2]}"
												type="number" maxFractionDigits="2" /></td>
										<td>${movieRevenue[3]}</td>
										<td><fmt:formatNumber
												value="${movieRevenue[1] - movieRevenue[2]}" type="number"
												maxFractionDigits="2" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<h2 style="text-align: center; color: white;">Doanh Thu Dich
							Vu</h2>
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
										<td><fmt:formatNumber value="${popcornRevenue[1]}"
												type="number" maxFractionDigits="2" /></td>
										<td><fmt:formatNumber value="${popcornRevenue[2]}"
												type="number" maxFractionDigits="2" /></td>
										<td>${popcornRevenue[3]}</td>
										<td><fmt:formatNumber
												value="${popcornRevenue[1] - popcornRevenue[2]}"
												type="number" maxFractionDigits="2" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<!-- Revenue Chart cua Tab "Time" -->
						<div class="wg-box">
							<div class="flex items-center justify-between">
								<h5>Chart</h5>
							</div>
							<div class="flex flex-wrap gap40">
								<div>
									<div class="mb-1">
										<div class="block-legend">
											<div class="dot t3"></div>
											<div class="text-tiny" style="color: white; font-size: 30px;">Movie</div>
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
											<div class="text-tiny" style="color: white; font-size: 30px;">PopCorn</div>
										</div>
									</div>
								</div>
							</div>
							<div id="line-chart-popcorn"></div>
						</div>
						<!-- /Revenue -->
					</div>
<%--				</c:if>--%>
			</div>
			<!-- Tab Movie -->

			<div class="row">
				<div id="Movie">
					<select id="movie-option"
						class="form-select movie-group sign__select"
						style="display: none; backgroud-color: #222028;">
						<option value="">Select Movie</option>
						<c:forEach var="movie" items="${movies}">
							<option value="${movie.movieID}"
								${movie.movieID == movieID ? 'selected' : ''}>
								${movie.movieName}</option>
						</c:forEach>
					</select>
				</div>
				<!-- Table cua tab "Movies" -->
				<c:if test="${not empty CinemaRevenuesByMovieID}">

					<div class="form-select-table  movie-group"
						style="display: none; backgroud-color: #222028;">
						<!-- Table  Doanh thu cua tab "Time"-->
						<h2 style="text-align: center; color: white;">Doanh Thu Bo
							Phim ${CinemaRevenuesByMovieID[0][2]}</h2>
						<table>
							<thead>
								<tr>
									<th>Ten rap</th>
									<th>Doanh Thu</th>
								</tr>
							</thead>
							<tbody>
								<!-- Lặp qua danh sách dữ liệu (ví dụ từ cơ sở dữ liệu) -->
								<c:forEach var="tmp" items="${CinemaRevenuesByMovieID}">
									<tr>
										<td>${tmp[0]}</td>
										<td>${tmp[1]}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- /Revenue -->
						<div class="wg-box">
							<div class="flex items-center justify-between">
								<h5>Chart</h5>
							</div>
							<div class="flex flex-wrap gap40">
								<div>
									<div class="mb-1">
										<div class="block-legend">
											<div class="dot t3"></div>
											<div class="text-tiny" style="color: white; font-size: 30px;">Doanh
												Thu Bo Phim</div>
										</div>
									</div>
								</div>
							</div>
							<div id="line-chart-revenues-movie-by-cinema"></div>
						</div>
					</div>
				</c:if>

			</div>

			<div class="row">
				<div id="Region">
					<select id="region-option" class="form-select-1  region1-group"
						style="display: none;">
						<option value="">Select Region</option>
						<c:forEach var="cinema" items="${cinemas}">
							<option value="${cinema.cinemaID}"
								${cinema.cinemaID == cinemaID ? 'selected' : ''}>
								${cinema.cinemaName}</option>
						</c:forEach>
					</select>
					<c:if test="${not empty CustomerAmountAllCinema}">

						<div class="form-select-table  region-group"
							style="display: none; backgroud-color: #222028;">
							<!-- Table  Doanh thu cua tab "Time"-->
							<h2 style="text-align: center; color: white;">So Luong Khach
								Hang Cua Cac Rap</h2>
							<table>
								<thead>
									<tr>
										<th>Ten rap</th>
										<th>So luong khach</th>
									</tr>
								</thead>
								<tbody>
									<!-- Lặp qua danh sách dữ liệu (ví dụ từ cơ sở dữ liệu) -->
									<c:forEach var="tmp" items="${CustomerAmountAllCinema}">
										<tr>
											<td>${tmp[1]}</td>
											<td>${tmp[2]}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /Revenue -->
							<div class="wg-box">
								<div class="flex items-center justify-between">
									<h5>Chart</h5>
								</div>
								<div class="flex flex-wrap gap40">
									<div>
										<div class="mb-1">
											<div class="block-legend">
												<div class="dot t3"></div>
												<div class="text-tiny"
													style="color: white; font-size: 30px;">So Luong Khach
													Theo Rap</div>
											</div>
										</div>
									</div>
								</div>
								<div id="line-chart-amount-customer-by-cinema"></div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
	</main>
	<!-- end main content -->


	<script>
	
	function getUrlParameter(name) {
	    const url = new URL(window.location.href);
	    return url.searchParams.get(name);
	}
	
	document.addEventListener("DOMContentLoaded", function () {
	    const tab = getUrlParameter("tab");

	    if (tab === "time-group") {
	        showOption(null, "time-group");
	        document.querySelector(".tab button[onclick*='time-group']").classList.add("active");
	    } else if (tab === "movie-group") {
	        showOption(null, "movie-group");
	        document.querySelector(".tab button[onclick*='movie-group']").classList.add("active");
	    } else if (tab === "region-group") {
	        showOption(null, "region-group");
	        document.querySelector(".tab button[onclick*='region-group']").classList.add("active");
	    } else {
	        // Mặc định hiển thị tab đầu tiên nếu không có tham số
	        showOption(null, "time-group");
	        document.querySelector(".tab button[onclick*='time-group']").classList.add("active");
	    }
	});


	function showOptionAndFetchData(evt, optionName) {
	    // Hiển thị phần tử tương ứng
	   showOption(evt, optionName);

		// Gửi yêu cầu GET tới Controller, thay đổi URL phù hợp với Controller của bạn
    	const tmp = `${pageContext.request.contextPath}`;
        const url = tmp + "/admin/revenues-statics?cinemaID="+"1" + "&tab=region-group";
        // Gửi yêu cầu GET (chuyển hướng trình duyệt đến URL)
        window.location.href = url;
	}

	// Function to handle tab switching
    function showOption(evt, optionName) {
			//console.log("Head" + document.head.innerHTML)
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
			 if (evt) {
			        evt.currentTarget.className += " active";
			    }
			
		}
	
	
		
		//gui yeu cau GET toi controller khi chon time cu the o tab "Time"
		document.getElementById('dateValue').addEventListener('change', function () {
		    // Lấy giá trị ngày được chọn
		    const selectedDate = this.value;
			const dateType = document.getElementById('time-option').value;
		    // Kiểm tra nếu giá trị không rỗng
		    if (selectedDate) {
		        // Tạo URL để gửi yêu cầu GET
		        const tmp = `${pageContext.request.contextPath}`;
		        const url = tmp + "/admin/revenues-statics?dateValue="+selectedDate + "&dateType="+dateType +"&tab=time-group";
		        // Gửi yêu cầu GET (chuyển hướng trình duyệt đến URL)
		        window.location.href = url;
		    }
		});
		//gui yeu cau GET toi controller khi chon movie cu the o tab "Movies"
		document.getElementById('movie-option').addEventListener('change', function () {
	        const movieID = this.value; // Lấy giá trị được chọn (movieID)
	        if (movieID) {
	            // Gửi yêu cầu GET tới Controller, thay đổi URL phù hợp với Controller của bạn
	        	const tmp = `${pageContext.request.contextPath}`;
		        const url = tmp + "/admin/revenues-statics?movieID="+movieID + "&tab=movie-group";
		        // Gửi yêu cầu GET (chuyển hướng trình duyệt đến URL)
		        window.location.href = url;
	        }
	    });
		
		//gui yeu cau GET toi controller khi chon cinema cu the o tab "Regions"
		document.getElementById('region-option').addEventListener('change', function () {
	        const cinemaID = this.value; // Lấy giá trị được chọn (movieID)
	        if (cinemaID) {
	            // Gửi yêu cầu GET tới Controller, thay đổi URL phù hợp với Controller của bạn
	        	const tmp = `${pageContext.request.contextPath}`;
		        const url = tmp + "/admin/revenues-statics?cinemaID="+cinemaID + "&tab=regions";
		        // Gửi yêu cầu GET (chuyển hướng trình duyệt đến URL)
		        window.location.href = url;
	        }
	    });
		
	</script>

	<script>
	<c:if test="${not empty chartDataMovie}">
    // Nếu attribute tồn tại, gán giá trị của nó vào biến JavaScript
    	var chartDataMovie = ${chartDataMovie}; 
	</c:if>
	<c:if test="${not empty chartDataPopCorn}">
	// Nếu attribute tồn tại, gán giá trị của nó vào biến JavaScript
		var chartDataPopCorn = ${chartDataPopCorn}; 
	</c:if>
	<c:if test="${not empty jsonChartDataMovies}">
	//Nếu attribute tồn tại, gán giá trị của nó vào biến JavaScript
		var jsonChartDataMovies = ${jsonChartDataMovies}; 
	</c:if>
	
	<c:if test="${not empty jsonChartDataCinemas}">
	//Nếu attribute tồn tại, gán giá trị của nó vào biến JavaScript
		var jsonChartDataCinemas = ${jsonChartDataCinemas}; 
	</c:if>
  
</script>

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script
		src=" ${pageContext.request.contextPath}/assets2/js/jquery.min.js"></script>
	<c:if test="${not empty chartDataMovie}">
		<script
			src="${pageContext.request.contextPath}/assets2/js/apexcharts/line-chart-7.js"></script>
	</c:if>

	<!-- Kiểm tra và chỉ thêm script cho line-chart-popcorn.js nếu chartDataPopCorn tồn tại -->
	<c:if test="${not empty chartDataPopCorn}">
		<script
			src="${pageContext.request.contextPath}/assets2/js/apexcharts/line-chart-popcorn.js"></script>
	</c:if>
	<c:if test="${not empty jsonChartDataMovies}">
		<script
			src=" ${pageContext.request.contextPath}/assets2/js/apexcharts/line-chart-revenues-movie-by-cinema.js"></script>
	</c:if>
	<c:if test="${not empty jsonChartDataCinemas}">
		<script
			src=" ${pageContext.request.contextPath}/assets2/js/apexcharts/line-chart-amount-customer-by-cinema.js"></script>
	</c:if>
	<script>
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
			//truong select cua tab "movie"
	        #movie-option {
	            background-color: #222028 !important;
	            color: white !important;
	            padding: 5px;
	            border-radius: 4px; /* Bo góc */
	        appearance: none !important; /* Loại bỏ giao diện mặc định */
	        -moz-appearance: none !important; /* Firefox */
	        -webkit-appearance: none !important; /* Safari, Chrome */
	        }

	        #movie-option option {
	            background-color: #222028;
	            color: white;
	        }

	        #movie-option option:hover {
	            background-color: #333;
	        }
	        // truong date time cua tab "Time"
	        #time-option {
	            background-color: #222028;
	            color: white;
	            padding: 5px;
	            border-radius: 4px; /* Bo góc */
	        }

	        #time-option option {
	            background-color: #222028;
	            color: white;
	        }

	        #time-option option:hover {
	            background-color: #333;
	        }
	        #dateValue {
	            background-color: #222028;
	            color: white;
	            padding: 5px;
	            border-radius: 4px; /* Bo góc */
	        }
	        
	        /* Thay đổi màu của icon lịch */
	        #dateValue::-webkit-calendar-picker-indicator {
	            color: white; /* Màu icon */
	            background-color: #333; /* Nền icon */
	            border-radius: 50%; /* Tùy chỉnh góc bo */
	            padding: 5px; /* Khoảng cách trong */
	        }
	        /* Căn chỉnh các phần tử trong một dòng */
	        .time-container {
	            display: flex;
	            align-items: center; /* Căn giữa theo chiều dọc */
	            gap: 10px; /* Khoảng cách giữa các phần tử */
	        }
	        //
	    `;
	    styleTag.innerHTML = cssContent;

	    // Thêm thẻ <style> vào <head>
	    document.head.appendChild(styleTag);

	}

	// Gọi hàm để thêm CSS khi tài liệu đã tải
	addStylesToHead();
	</script>
</body>

<!-- Mirrored from hotflix.volkovdesign.com/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:36 GMT -->
</html>