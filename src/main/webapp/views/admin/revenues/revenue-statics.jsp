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
<title>HotFlix â Online Movies, TV Shows & Cinema HTML Template</title>

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
				<c:if
					test="${not empty popcornRevenues and not empty movieRevenues}">

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
								<!-- Láº·p qua danh sÃ¡ch dá»¯ liá»u (vÃ­ dá»¥ tá»« cÆ¡ sá» dá»¯ liá»u) -->
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
								<!-- Láº·p qua danh sÃ¡ch dá»¯ liá»u (vÃ­ dá»¥ tá»« cÆ¡ sá» dá»¯ liá»u) -->
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
				</c:if>
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
								<!-- Láº·p qua danh sÃ¡ch dá»¯ liá»u (vÃ­ dá»¥ tá»« cÆ¡ sá» dá»¯ liá»u) -->
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
									<!-- Láº·p qua danh sÃ¡ch dá»¯ liá»u (vÃ­ dá»¥ tá»« cÆ¡ sá» dá»¯ liá»u) -->
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
	        // Máº·c Äá»nh hiá»n thá» tab Äáº§u tiÃªn náº¿u khÃ´ng cÃ³ tham sá»
	        showOption(null, "time-group");
	        document.querySelector(".tab button[onclick*='time-group']").classList.add("active");
	    }
	});


	function showOptionAndFetchData(evt, optionName) {
	    // Hiá»n thá» pháº§n tá»­ tÆ°Æ¡ng á»©ng
	   showOption(evt, optionName);

		// Gá»­i yÃªu cáº§u GET tá»i Controller, thay Äá»i URL phÃ¹ há»£p vá»i Controller cá»§a báº¡n
    	const tmp = `${pageContext.request.contextPath}`;
        const url = tmp + "/admin/revenues-statics?cinemaID="+"1" + "&tab=region-group";
        // Gá»­i yÃªu cáº§u GET (chuyá»n hÆ°á»ng trÃ¬nh duyá»t Äáº¿n URL)
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
			    element.style.display = 'block'; // áº¨n tá»«ng pháº§n tá»­
			});
			 if (evt) {
			        evt.currentTarget.className += " active";
			    }
			
		}
	
	
		
		//gui yeu cau GET toi controller khi chon time cu the o tab "Time"
		document.getElementById('dateValue').addEventListener('change', function () {
		    // Láº¥y giÃ¡ trá» ngÃ y ÄÆ°á»£c chá»n
		    const selectedDate = this.value;
			const dateType = document.getElementById('time-option').value;
		    // Kiá»m tra náº¿u giÃ¡ trá» khÃ´ng rá»ng
		    if (selectedDate) {
		        // Táº¡o URL Äá» gá»­i yÃªu cáº§u GET
		        const tmp = `${pageContext.request.contextPath}`;
		        const url = tmp + "/admin/revenues-statics?dateValue="+selectedDate + "&dateType="+dateType +"&tab=time-group";
		        // Gá»­i yÃªu cáº§u GET (chuyá»n hÆ°á»ng trÃ¬nh duyá»t Äáº¿n URL)
		        window.location.href = url;
		    }
		});
		//gui yeu cau GET toi controller khi chon movie cu the o tab "Movies"
		document.getElementById('movie-option').addEventListener('change', function () {
	        const movieID = this.value; // Láº¥y giÃ¡ trá» ÄÆ°á»£c chá»n (movieID)
	        if (movieID) {
	            // Gá»­i yÃªu cáº§u GET tá»i Controller, thay Äá»i URL phÃ¹ há»£p vá»i Controller cá»§a báº¡n
	        	const tmp = `${pageContext.request.contextPath}`;
		        const url = tmp + "/admin/revenues-statics?movieID="+movieID + "&tab=movie-group";
		        // Gá»­i yÃªu cáº§u GET (chuyá»n hÆ°á»ng trÃ¬nh duyá»t Äáº¿n URL)
		        window.location.href = url;
	        }
	    });
		
		//gui yeu cau GET toi controller khi chon cinema cu the o tab "Regions"
		document.getElementById('region-option').addEventListener('change', function () {
	        const cinemaID = this.value; // Láº¥y giÃ¡ trá» ÄÆ°á»£c chá»n (movieID)
	        if (cinemaID) {
	            // Gá»­i yÃªu cáº§u GET tá»i Controller, thay Äá»i URL phÃ¹ há»£p vá»i Controller cá»§a báº¡n
	        	const tmp = `${pageContext.request.contextPath}`;
		        const url = tmp + "/admin/revenues-statics?cinemaID="+cinemaID + "&tab=regions";
		        // Gá»­i yÃªu cáº§u GET (chuyá»n hÆ°á»ng trÃ¬nh duyá»t Äáº¿n URL)
		        window.location.href = url;
	        }
	    });
		
	</script>

	<script>
	<c:if test="${not empty chartDataMovie}">
    // Náº¿u attribute tá»n táº¡i, gÃ¡n giÃ¡ trá» cá»§a nÃ³ vÃ o biáº¿n JavaScript
    	var chartDataMovie = ${chartDataMovie}; 
	</c:if>
	<c:if test="${not empty chartDataPopCorn}">
	// Náº¿u attribute tá»n táº¡i, gÃ¡n giÃ¡ trá» cá»§a nÃ³ vÃ o biáº¿n JavaScript
		var chartDataPopCorn = ${chartDataPopCorn}; 
	</c:if>
	<c:if test="${not empty jsonChartDataMovies}">
	//Náº¿u attribute tá»n táº¡i, gÃ¡n giÃ¡ trá» cá»§a nÃ³ vÃ o biáº¿n JavaScript
		var jsonChartDataMovies = ${jsonChartDataMovies}; 
	</c:if>
	
	<c:if test="${not empty jsonChartDataCinemas}">
	//Náº¿u attribute tá»n táº¡i, gÃ¡n giÃ¡ trá» cá»§a nÃ³ vÃ o biáº¿n JavaScript
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

	<!-- Kiá»m tra vÃ  chá» thÃªm script cho line-chart-popcorn.js náº¿u chartDataPopCorn tá»n táº¡i -->
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
	// HÃ m thÃªm CSS vÃ o tháº» <head>
	function addStylesToHead() {
	    // Táº¡o tháº» <style>
	    const styleTag = document.createElement('style');
	    styleTag.type = 'text/css';

	    // Ná»i dung CSS
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
			flex: 1; /* Äáº£m báº£o cÃ¡c tab cÃ³ cÃ¹ng chiá»u rá»ng */
			text-align: center; /* CÄn chá»¯ á» giá»¯a nÃºt */
			
		}
		
		.tab button {
			width: 100%; /* Äáº£m báº£o nÃºt chiáº¿m toÃ n bá» chiá»u rá»ng cá»§a tab */
			background-color: #222028;
			padding:10px;
			color: white;
			font-size: 24px;
			
			border: 2px solid transparent;
			cursor: pointer;
			transition: background-color 0.3s;
		}
		
		.tab button:hover {
			border-color: #f3a701; /* Äá»i mÃ u khi hover */
		}
		
		.tab button.active {
			border-color: #f3a701; ; /* MÃ u nÃºt khi ÄÆ°á»£c chá»n */
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
	        	 border: 2px solid #f3a701; /* MÃ u viá»n khi hover */
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
	            justify-content: space-between; /* CÄn Äá»u hai pháº§n tá»­ Revenue vÃ  Order */
	            align-items: center;
	            gap: 40px; /* Khoáº£ng cÃ¡ch giá»¯a cÃ¡c pháº§n tá»­ */
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
	            border-radius: 4px; /* Bo gÃ³c */
	        appearance: none !important; /* Loáº¡i bá» giao diá»n máº·c Äá»nh */
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
	            border-radius: 4px; /* Bo gÃ³c */
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
	            border-radius: 4px; /* Bo gÃ³c */
	        }
	        
	        /* Thay Äá»i mÃ u cá»§a icon lá»ch */
	        #dateValue::-webkit-calendar-picker-indicator {
	            color: white; /* MÃ u icon */
	            background-color: #333; /* Ná»n icon */
	            border-radius: 50%; /* TÃ¹y chá»nh gÃ³c bo */
	            padding: 5px; /* Khoáº£ng cÃ¡ch trong */
	        }
	        /* CÄn chá»nh cÃ¡c pháº§n tá»­ trong má»t dÃ²ng */
	        .time-container {
	            display: flex;
	            align-items: center; /* CÄn giá»¯a theo chiá»u dá»c */
	            gap: 10px; /* Khoáº£ng cÃ¡ch giá»¯a cÃ¡c pháº§n tá»­ */
	        }
	        //
	    `;
	    styleTag.innerHTML = cssContent;

	    // ThÃªm tháº» <style> vÃ o <head>
	    document.head.appendChild(styleTag);

	}

	// Gá»i hÃ m Äá» thÃªm CSS khi tÃ i liá»u ÄÃ£ táº£i
	addStylesToHead();
	</script>
</body>

<!-- Mirrored from hotflix.volkovdesign.com/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 03 Nov 2024 07:09:36 GMT -->
</html>