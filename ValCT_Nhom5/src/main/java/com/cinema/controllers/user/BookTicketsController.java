package com.cinema.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cinema.entity.Cinema;
import com.cinema.entity.Movie;
import com.cinema.entity.MovieScreenings;
import com.cinema.services.ICinemaService;
import com.cinema.services.IMovieService;
import com.cinema.services.IMovieScreeningsService;
import com.cinema.services.impl.CinemaServiceImpl;
import com.cinema.services.impl.MoviceServiceImpl;
import com.cinema.services.impl.MovieScreeningsServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/bookTickets")
public class BookTicketsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IMovieService movieService = new MoviceServiceImpl();
	private ICinemaService cinemaService = new CinemaServiceImpl();
	private IMovieScreeningsService  movieScreeningService = new MovieScreeningsServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    String movieId = "2";
	    String selectedLocation = req.getParameter("location");

	    Movie movie = movieService.getOneMovie(Integer.parseInt(movieId));
	    List<Cinema> listCinema = cinemaService.getAllCinema();
	    List<Cinema> filteredCinema = new ArrayList<>();
	    
	    
	    Map<Integer, List<MovieScreenings>> cinemaScreeningsMap = new HashMap<>();

	    
	    // Nếu selectedLocation khác null và không rỗng, chỉ lấy các rạp có location phù hợp
	    if (selectedLocation != null && !selectedLocation.isEmpty()) {
	        for (Cinema cinema : listCinema) {
	            if (cinema.getLocation().equals(selectedLocation)) {
	                filteredCinema.add(cinema);
	                
	                
	             // Lấy danh sách suất chiếu của bộ phim cho rạp này
	                List<MovieScreenings> screenings = movieScreeningService.getScreeningsByMovieIdAndCinemaId(movie.getMovieID(), cinema.getCinemaID());
	                cinemaScreeningsMap.put(cinema.getCinemaID(), screenings);
	                
	                
	            }
	        }
	    } else {
	        // Nếu selectedLocation là null hoặc rỗng, hiển thị tất cả rạp
	        filteredCinema = listCinema;
	        
	        
	        for (Cinema cinema : listCinema) {
	            List<MovieScreenings> screenings = movieScreeningService.getScreeningsByMovieIdAndCinemaId(movie.getMovieID(), cinema.getCinemaID());
	            cinemaScreeningsMap.put(cinema.getCinemaID(), screenings);
	        }
	        
	        
	        
	    }

	    List<String> locations = new ArrayList<>();
	    for (Cinema cinema : listCinema) {
	        if (!locations.contains(cinema.getLocation())) {
	            locations.add(cinema.getLocation());
	        }
	    }

	    req.setAttribute("locations", locations);
	    req.setAttribute("listCinema", filteredCinema);
	    req.setAttribute("selectedLocation", selectedLocation); 
	    req.setAttribute("movie", movie);

	    
	    req.setAttribute("cinemaScreeningsMap", cinemaScreeningsMap); // Đưa map suất chiếu vào JSP
	    
	    
	    RequestDispatcher rd = req.getRequestDispatcher("/views/user/bookTickets.jsp");
	    rd.forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String movieId = "2";
	    String selectedLocation = req.getParameter("location");
	    String date = req.getParameter("date");
	    String experience = req.getParameter("experience");
	    String version = req.getParameter("version");
	    String startHour = req.getParameter("startHour");

	    // Lấy thông tin movie
	    Movie movie = movieService.getOneMovie(Integer.parseInt(movieId));

	    // Lưu dữ liệu vào session
	    HttpSession session = req.getSession();
	    session.setAttribute("selectedLocation", selectedLocation);
	    session.setAttribute("startHour", startHour);
	    session.setAttribute("date", date);
	    session.setAttribute("experience", experience);
	    session.setAttribute("version", version);
	    session.setAttribute("movie", movie);

	    // Chuyển hướng đến controller xử lý chọn ghế
	    resp.sendRedirect("selectSeats");
	}

}
