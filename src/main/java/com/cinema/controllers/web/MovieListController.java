package com.cinema.controllers.web;

import com.cinema.entity.Movie;
import com.cinema.services.IMovieService;
import com.cinema.services.impl.MovieServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/movieList")
public class MovieListController extends HttpServlet{
	IMovieService movieService = new MovieServiceImpl();
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("person") != null) {
			resp.sendRedirect(req.getContextPath() + "/signin");
			return;
		}
		 String filter = req.getParameter("filter");

	        List<Movie> movies;
	        String pageTitle;

	        if ("showing".equalsIgnoreCase(filter)) {
	            movies = movieService.getMoviesShowing(); // Phim đang chiếu
	            pageTitle = "Movies Showing";
	        } else if ("comingSoon".equalsIgnoreCase(filter)) {
	            movies = movieService.getMoviesComingSoon(); // Phim sắp chiếu
	            pageTitle = "Movies Coming Soon";
	        } else {
	            // Mặc định: Hiển thị cả 2 danh sách
	            movies = movieService.getAllMovie();
	            pageTitle = "All Movies";
	        }

	        // Truyền dữ liệu xuống JSP
	        req.setAttribute("movies", movies);
	        req.setAttribute("pageTitle", pageTitle);

	        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/web/movie-list.jsp");
	        dispatcher.forward(req, resp);
	}
}
