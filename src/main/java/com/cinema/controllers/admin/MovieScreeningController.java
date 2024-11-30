package com.cinema.controllers.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.sql.Timestamp;
import java.time.*;

import com.cinema.entity.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cinema.services.*;
import com.cinema.services.impl.*;
import jakarta.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/admin/moviescreenings", "/admin/addMovieScreening", "/admin/editMovieScreening", "/admin/deleteMovieScreening"})
public class MovieScreeningController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	 	private IMovieScreeningsService movieScreeningService = new MovieScreeningsServiceImpl();
	    private IRoomService roomService = new RoomServiceImpl();
	    private IMovieService movieService = new MovieServiceImpl();
	    
	    private ISeatService seatService = new SeatServiceImpl();
	    private ISeatStatusService seatStatusService = new SeatStatusServiceImpl();

	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			HttpSession session = req.getSession(false);

			if (session != null && session.getAttribute("person") != null) {
				Person person = (Person) session.getAttribute("person");

				if (person.getRole().toLowerCase().contains("admin")) {
					String action = req.getServletPath();
					switch (action) {
						case "/admin/moviescreenings":
							listMovieScreenings(req, resp);
							break;
						case "/admin/editMovieScreening":
							showEditForm(req, resp);
							break;
						case "/admin/deleteMovieScreening":
							deleteMovieScreening(req, resp);
							break;
						default:
							resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
							break;
					}
					return;
				}
			}
			resp.sendRedirect(req.getContextPath() + "/signin");
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String action = req.getServletPath();
	        switch (action) {
	            case "/admin/addMovieScreening":
	                addMovieScreening(req, resp);
	                break;
	            case "/admin/editMovieScreening":
	                updateMovieScreening(req, resp);
	                break;
	            case "/admin/deleteMovieScreening":
	                deleteMovieScreening(req, resp);
	                break;
	            default:
	                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
	                break;    
	        }
	    }


	    private void listMovieScreenings(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String roomIdParam = req.getParameter("id");
	        String cinemaIdParam = req.getParameter("cinemaId");
	        String screeningDateParam = req.getParameter("screeningDate");
	        
	        
	        if (roomIdParam != null && !roomIdParam.isEmpty()) {
	            try {
	                int roomID = Integer.parseInt(roomIdParam);
	                int cinemaId = Integer.parseInt(cinemaIdParam);
	                int page = 1;
	                int recordsPerPage = 10;

	                // Kiểm tra nếu có tham số "page" trong yêu cầu thì sử dụng
	                if (req.getParameter("page") != null) {
	                    page = Integer.parseInt(req.getParameter("page"));
	                }

	                // Lấy danh sách movie screenings với phân trang
	                List<MovieScreenings> movieScreenings ;  //= movieScreeningService.getMovieScreeningsByRoomIdWithPagination(roomID, (page - 1) * recordsPerPage, recordsPerPage);
	                
	                if (screeningDateParam != null && !screeningDateParam.isEmpty()) {
	                	
	                	Date screeningDate = Date.valueOf(screeningDateParam); // Sử dụng Date.valueOf() để chuyển đổi từ String sang java.sql.Date
	                	
	                    movieScreenings = movieScreeningService.getMovieScreeningsByRoomIdAndDateWithPagination(
	                            roomID, screeningDate, (page - 1) * recordsPerPage, recordsPerPage);
	                } else {
	                    // Nếu không có `screeningDateParam` thì lấy toàn bộ danh sách
	                    movieScreenings = movieScreeningService.getMovieScreeningsByRoomIdWithPagination(
	                            roomID, (page - 1) * recordsPerPage, recordsPerPage);
	                }
	                
	                // Lấy tổng số records để tính số trang
	                int noOfRecords = movieScreeningService.getNoOfRecordsByRoomId(roomID);
	                int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

	                List<Movie> movies = movieService.getAllMovieActive();
	                req.setAttribute("movieScreenings", movieScreenings);
	                req.setAttribute("room", roomService.getRoomById(roomID));
	                req.setAttribute("movies", movies);
	                req.setAttribute("noOfPages", noOfPages);
	                req.setAttribute("currentPage", page);
	                req.setAttribute("noOfRecords", noOfRecords); // Thêm thuộc tính này để hiển thị tổng số bản ghi
	                req.setAttribute("cinemaId", cinemaId);
	                req.setAttribute("screeningDate", screeningDateParam); // Để giữ lại giá trị sau khi lọc


	                RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/MovieScreening.jsp");
	                dispatcher.forward(req, resp);
	            } catch (NumberFormatException e) {
	                resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=invalidRoomId");
	            }
	        } else {
	            resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=missingRoomId");
	        }
	    }
	    
	    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        try {
	            String msIDParam = req.getParameter("msID");
	            String roomIDParam = req.getParameter("roomID");
	            String cinemaIDParam = req.getParameter("cinemaId");
	            
	            if (msIDParam != null && !msIDParam.isEmpty() && roomIDParam != null && !roomIDParam.isEmpty()) {
	                int msID = Integer.parseInt(msIDParam);
	                int roomID = Integer.parseInt(roomIDParam);
	                int cinemaID = Integer.parseInt(cinemaIDParam);

	                MovieScreenings movieScreening = movieScreeningService.getMovieScreeningById(msID);
	                if (movieScreening != null) {
	                    // Định dạng screeningDate, startHour và endHour trước khi gửi đến JSP
	                	DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	                	LocalDate localDate = movieScreening.getScreeningDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	                	String formattedDate = localDate.format(dateFormatter);
	                    String formattedStartHour = movieScreening.getStartHour().toString().substring(11, 16);
	                    String formattedEndHour = movieScreening.getEndHour().toString().substring(11, 16); 


	                    // Gán giá trị đã định dạng vào request
	                    req.setAttribute("movieScreening", movieScreening);
	                    req.setAttribute("formattedDate", formattedDate);
	                    req.setAttribute("formattedStartHour", formattedStartHour);
	                    req.setAttribute("formattedEndHour", formattedEndHour);
	                    req.setAttribute("roomID", roomID);
	                    req.setAttribute("cinemaId", cinemaID);

	                    List<Movie> movies = movieService.getAllMovieActive(); // Thêm danh sách phim vào để hiển thị trong form
	                    req.setAttribute("movies", movies);
	                    RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/EditMovieScreening.jsp");
	                    dispatcher.forward(req, resp);
	                } else {
	                    resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=notfound");
	                }
	            } else {
	                resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=invalidIdOrRoomId");
	            }
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	            resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=invalidId");
	        } catch (Exception e) {
	            e.printStackTrace();
	            resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=unexpected");
	        }
	    }




	  private void addMovieScreening(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    try {
        // Lấy giá trị từ request
        int roomID = Integer.parseInt(req.getParameter("roomID"));
        int movieID = Integer.parseInt(req.getParameter("movieID"));
        int cinemaID = Integer.parseInt(req.getParameter("cinemaId")); // Lấy cinemaID từ request

        // Lấy giá trị từ input dateScreening và chuyển thành java.sql.Date
        String dateScreeningParam = req.getParameter("dateScreening");
        LocalDate screeningDate = LocalDate.parse(dateScreeningParam);
        java.sql.Date sqlScreeningDate = java.sql.Date.valueOf(screeningDate);

        // Lấy giá trị từ input startHour và endHour
        String startHourParam = req.getParameter("startHour");
        String endHourParam = req.getParameter("endHour");

        LocalTime startTime = LocalTime.parse(startHourParam);
        LocalTime endTime = LocalTime.parse(endHourParam);

        // Tạo đối tượng Timestamp để lưu vào database (kết hợp ngày chiếu và giờ)
        LocalDateTime startDateTime = LocalDateTime.of(screeningDate, startTime);
        LocalDateTime endDateTime = LocalDateTime.of(screeningDate, endTime);
        Timestamp startHour = Timestamp.valueOf(startDateTime);
        Timestamp endHour = Timestamp.valueOf(endDateTime);

        // Tạo đối tượng MovieScreenings
        MovieScreenings movieScreening = new MovieScreenings();
        movieScreening.setRoom(roomService.getRoomById(roomID));
        movieScreening.setMovie(movieService.getMovieById(movieID));
        movieScreening.setScreeningDate(sqlScreeningDate);
        movieScreening.setStartHour(startHour);
        movieScreening.setEndHour(endHour);
        movieScreening.setStatus(Boolean.parseBoolean(req.getParameter("status")));

        // Thêm vào cơ sở dữ liệu
        if (movieScreeningService.addMovieScreening(movieScreening)) {
        	
        	// Thêm SeatStatus cho tất cả các ghế trong phòng
            
            List<Seat> seats = seatService.getSeatsByRoomId(roomID); // Lấy tất cả ghế trong phòng
            

            for (Seat seat : seats) {
                SeatStatus seatStatus = new SeatStatus();
                seatStatus.setSeat(seat);
                seatStatus.setScreening(movieScreening);
                seatStatus.setStatus(false); // Mặc định tất cả ghế đều trống

                seatStatusService.addSeatStatus(seatStatus);
            }
        	
            // Chuyển hướng đến trang danh sách với roomID và page hiện tại
            String currentPage = req.getParameter("page");
            if (currentPage == null || currentPage.isEmpty()) {
                currentPage = "1"; // Mặc định là trang 1 nếu không có thông tin page
            }
            // Đảm bảo chuyển hướng về đúng URL với roomID và page
            resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?id=" + roomID + "&cinemaId=" + cinemaID + "&page=" + currentPage + "&success=added");

        } else {
        	resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?id=" + roomID + "&cinemaId=" + cinemaID + "&error=addfailed");

        }
    } catch (Exception e) {
        e.printStackTrace();
        resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?id=" + req.getParameter("roomID") + "&error=addfailed");
    }
}

	  private void updateMovieScreening(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		    try {
		        int msID = Integer.parseInt(req.getParameter("msID"));
		        int roomID = Integer.parseInt(req.getParameter("roomID"));
		        int movieID = Integer.parseInt(req.getParameter("movieID")); // Lấy movieID từ form
		        int cinemaID = Integer.parseInt(req.getParameter("cinemaId")); // Lấy cinemaID từ form


		        MovieScreenings movieScreening = movieScreeningService.getMovieScreeningById(msID);
		        if (movieScreening != null) {
		            String screeningDateParam = req.getParameter("screeningDate");
		            String startHourParam = req.getParameter("startHour");
		            String endHourParam = req.getParameter("endHour");

		            // Chuyển đổi các giá trị thành Timestamp
		            LocalDate screeningDate = LocalDate.parse(screeningDateParam);
		            LocalTime startTime = LocalTime.parse(startHourParam);
		            LocalTime endTime = LocalTime.parse(endHourParam);

		            LocalDateTime startDateTime = LocalDateTime.of(screeningDate, startTime);
		            LocalDateTime endDateTime = LocalDateTime.of(screeningDate, endTime);

		            Timestamp startHour = Timestamp.valueOf(startDateTime);
		            Timestamp endHour = Timestamp.valueOf(endDateTime);

		            // Set các giá trị mới cho đối tượng movieScreening
		            movieScreening.setScreeningDate(java.sql.Date.valueOf(screeningDate));
		            movieScreening.setStartHour(startHour);
		            movieScreening.setEndHour(endHour);
		            movieScreening.setStatus(Boolean.parseBoolean(req.getParameter("status")));
		            
		         // Cập nhật tên phim
		            Movie movie = movieService.getMovieById(movieID);
		            if (movie != null) {
		                movieScreening.setMovie(movie);
		            }

		            if (movieScreeningService.updateMovieScreening(movieScreening)) {
		                // Điều hướng về lại trang danh sách movie screenings của phòng hiện tại
		            	resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?id=" + roomID + "&cinemaId=" + cinemaID + "&success=updated");
		            } else {
		            	resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?id=" + roomID + "&cinemaId=" + cinemaID + "&error=updatefailed");

		            }
		        } else {
		            resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=notfound");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=updatefailed");
		    }
		}


	    private void deleteMovieScreening(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	        try {
	            // Lấy giá trị msID và roomID từ yêu cầu
	            String msIdParam = req.getParameter("id");
	            String roomIdParam = req.getParameter("roomID");
	            String cinemaIdParam = req.getParameter("cinemaID");

	            if (msIdParam == null || msIdParam.isEmpty() || roomIdParam == null || roomIdParam.isEmpty()) {
	                resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=missingRoomIdOrMsId");
	                return;
	            }

	            int msID = Integer.parseInt(msIdParam);
	            int roomID = Integer.parseInt(roomIdParam);
	            int cinemaID = Integer.parseInt(cinemaIdParam);

	            // Xóa MovieScreening và chuyển hướng
	            if (movieScreeningService.deleteMovieScreening(msID)) { 
	                resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?id=" + roomID + "&cinemaId=" + cinemaID + "&success=deleted");
	            } else {
	                resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?id=" + roomID + "&cinemaId=" + cinemaID + "&error=deletefailed");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            resp.sendRedirect(req.getContextPath() + "/admin/moviescreenings?error=deletefailed");
	        }
	    }


}

