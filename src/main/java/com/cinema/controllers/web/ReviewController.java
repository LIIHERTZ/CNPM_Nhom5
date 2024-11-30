package com.cinema.controllers.web;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import com.cinema.entity.Movie;
import com.cinema.entity.Person;
import com.cinema.entity.Review;
import com.cinema.services.IMovieService;
import com.cinema.services.IPersonService;
import com.cinema.services.IReviewService;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.PersonServiceImpl;
import com.cinema.services.impl.ReviewServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/review"})
public class ReviewController extends HttpServlet {

    private static final long serialVersionUID = 1L;    
    private IReviewService reviewService;
    private IMovieService movieService;

    @Override
    public void init() throws ServletException {
        super.init();
        reviewService = new ReviewServiceImpl();
        movieService = new MovieServiceImpl();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getRequestURI().toString();
        if (action.contains("/review")) {
            handleUserReview(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "URL không được hỗ trợ ok");
        }
    }

    private void handleUserReview(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String movieIDParam = req.getParameter("movieID");

        if (movieIDParam == null) {
            req.setAttribute("errorMessage", "Không tìm thấy thông tin phim. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/userHome");
            rd.forward(req, resp);
            return;
        }
        int movieID;
        try {
            movieID = Integer.parseInt(movieIDParam);
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "ID của phim không hợp lệ. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/userHome");
            rd.forward(req, resp);
            return;
        }       
        
        Movie movie = movieService.getMovieById(movieID);
        if (movie == null) {
            req.setAttribute("errorMessage", "Phim không tồn tại hoặc đã bị xóa. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/home");
            rd.forward(req, resp);
            return;
        }
        List<Review> reviews = reviewService.getReviewsByMovie(movieID);
        int count = reviewService.countReviewsByMovie(movieID);
        int totalRating = 0;        
        for (Review review : reviews) {
            totalRating += review.getEvaluate();        
        }
        float rating = (count > 0) ? (float) totalRating / count : 0; 
        movieService.updateMovieRating(movieID,rating);
        req.setAttribute("movie", movie);
        req.setAttribute("reviews", reviews);
        req.setAttribute("count", count);
        req.setAttribute("rating", rating);
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/review.jsp");
        rd.forward(req, resp);
    }

}