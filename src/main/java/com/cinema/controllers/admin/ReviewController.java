package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Movie;
import com.cinema.entity.Review;
import com.cinema.services.IReviewService;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.ReviewServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/adminReview"})
public class ReviewController extends HttpServlet {

	 private static final long serialVersionUID = 1L;
	    private MovieServiceImpl movieService;

	    @Override
	    public void init() throws ServletException {
	        movieService = new MovieServiceImpl();
	    }

	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        try {
	            // Lấy danh sách phim
	            List<Movie> movies = movieService.getAllMovie();
	            System.out.println("Movies: " + movies); // Kiểm tra log
	            req.setAttribute("movies", movies);

	            // Chuyển tiếp tới JSP
	            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/review.jsp");
	            dispatcher.forward(req, resp);

	        } catch (Exception e) {
	            e.printStackTrace(); // Log lỗi nếu có
	            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading movies");
	        }
	    }
	
	
}
