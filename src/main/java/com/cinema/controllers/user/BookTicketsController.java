package com.cinema.controllers.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cinema.entity.Cinema;
import com.cinema.entity.Movie;
import com.cinema.entity.MovieScreenings;
import com.cinema.entity.Person;
import com.cinema.services.ICinemaService;
import com.cinema.services.IMovieService;
import com.cinema.services.IMovieScreeningsService;
import com.cinema.services.impl.CinemaServiceImpl;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.MovieScreeningsServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/userBookTickets")
public class BookTicketsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IMovieService movieService = new MovieServiceImpl();
	private ICinemaService cinemaService = new CinemaServiceImpl();
	private IMovieScreeningsService  movieScreeningService = new MovieScreeningsServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("person") != null) {

			Person person = (Person) session.getAttribute("person");

			if (!person.getRole().toLowerCase().contains("admin")) {

				String movieId = req.getParameter("movieId");
				String selectedLocation = req.getParameter("location");
				String selectedDate = req.getParameter("date");

				if (selectedLocation == null) {
					selectedLocation = "Hồ Chí Minh";
				}

				// Lấy ngày hiện tại nếu chưa chọn
				if (selectedDate == null || selectedDate.isEmpty()) {
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					selectedDate = sdf.format(new Date());
				}

				// Lấy thông tin phim
				Movie movie = movieService.getOneMovie(Integer.parseInt(movieId));

				// Lấy danh sách rạp
				List<Cinema> listCinema = cinemaService.getAllCinema();
				List<Cinema> filteredCinema = new ArrayList<>();
				Map<Integer, List<MovieScreenings>> cinemaScreeningsMap = new HashMap<>();

				// Lọc danh sách rạp và suất chiếu dựa trên location và date
				for (Cinema cinema : listCinema) {
					// Nếu location được chọn, lọc theo location
					if (selectedLocation != null && !selectedLocation.isEmpty() && !cinema.getLocation().equals(selectedLocation)) {
						continue;
					}

					// Lấy danh sách suất chiếu theo movieID và cinemaID
					List<MovieScreenings> screenings = movieScreeningService.getScreeningsByMovieIdAndCinemaId(movie.getMovieID(), cinema.getCinemaID());

					// Lọc suất chiếu theo ngày
					List<MovieScreenings> filteredScreenings = new ArrayList<>();
					for (MovieScreenings screening : screenings) {
						SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
						String screeningDate = sdf.format(screening.getStartHour());
						if (screeningDate.equals(selectedDate)) {
							filteredScreenings.add(screening);
						}
					}

					// Nếu có suất chiếu hợp lệ, thêm rạp và suất chiếu vào danh sách
					if (!filteredScreenings.isEmpty()) {
						filteredCinema.add(cinema);
						cinemaScreeningsMap.put(cinema.getCinemaID(), filteredScreenings);
					}
				}

				// Lấy danh sách location và date từ tất cả các rạp và suất chiếu
				List<String> locations = new ArrayList<>();
				List<String> dates = new ArrayList<>();
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

				for (Cinema cinema : listCinema) {
					// Thêm location
					if (!locations.contains(cinema.getLocation())) {
						locations.add(cinema.getLocation());
					}

					// Thêm date từ suất chiếu
					List<MovieScreenings> screenings = movieScreeningService.getScreeningsByMovieIdAndCinemaId(movie.getMovieID(), cinema.getCinemaID());
					for (MovieScreenings screening : screenings) {
						String date = sdf.format(screening.getStartHour());
						if (!dates.contains(date)) {
							dates.add(date);
						}
					}
				}

				// Truyền dữ liệu vào request
				req.setAttribute("locations", locations);
				req.setAttribute("dates", dates);
				req.setAttribute("listCinema", filteredCinema);
				req.setAttribute("selectedLocation", selectedLocation);
				req.setAttribute("selectedDate", selectedDate);
				req.setAttribute("movie", movie);
				req.setAttribute("cinemaScreeningsMap", cinemaScreeningsMap);

				// Forward đến JSP
				RequestDispatcher rd = req.getRequestDispatcher("/views/user/bookTickets.jsp");
				rd.forward(req, resp);
				return;
			}
		}
		resp.sendRedirect(req.getContextPath() + "/signin");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String movieId = req.getParameter("movieId");
	    String screeningId = req.getParameter("screeningId");
	    String startHour = req.getParameter("startHour");
	    String selectedLocation = req.getParameter("location");
	    String selectedDate = req.getParameter("date");
	    String experience = req.getParameter("experience");
	    String version = req.getParameter("version");
	    String cinemaName = req.getParameter("cinemaName");

	    if (screeningId == null || screeningId.isEmpty()) {
	        resp.sendRedirect("/ValCT_Nhom5/userBookTickets");
	        return;
	    }
	    Movie movie = movieService.getOneMovie(Integer.parseInt(movieId));
	    
	    // Lưu các thông tin vào Session
	    HttpSession session = req.getSession();
	    session.setAttribute("movie", movie);
	    session.setAttribute("screeningId", screeningId);
	    session.setAttribute("startHour", startHour);
	    session.setAttribute("selectedLocation", selectedLocation);
	    session.setAttribute("selectedDate", selectedDate);
	    session.setAttribute("experience", experience);
	    session.setAttribute("version", version);
	    session.setAttribute("cinemaName", cinemaName);

	    // Chuyển hướng tới selectSeats
	    resp.sendRedirect("userSelectSeats");
	}

}