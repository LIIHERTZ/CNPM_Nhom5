package com.cinema.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.cinema.entity.Cinema;
import com.cinema.entity.Movie;
import com.cinema.services.ICinemaService;
import com.cinema.services.IMovieService;
import com.cinema.services.impl.CinemaServiceImpl;
import com.cinema.services.impl.MoviceServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/bookTickets")
public class BookTicketsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IMovieService movieService = new MoviceServiceImpl();
	private ICinemaService cinemaService = new CinemaServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String movieId = "1";

		Movie movie = movieService.getOneMovie(Integer.parseInt(movieId));
		
		List<Cinema> listCinema = cinemaService.getAllCinema();
		List<String> locations = new ArrayList<>();
		for (Cinema cinema : listCinema) {
			locations.add(cinema.getLocation());
		}
		req.setAttribute("locations", locations);
		
		req.setAttribute("listCinema", listCinema);

		   req.setAttribute("selectedLocation", req.getParameter("location")); 
		// Set the movie name as a request attribute
		req.setAttribute("movie", movie);

		// Forward the request to the bookTickets.jsp page
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/bookTickets.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
