package com.cinema.controllers.user;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Movie;
import com.cinema.services.IMovieService;
import com.cinema.services.impl.MoviceServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/searchMovies")
public class SearchMovieController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	IMovieService movieService = new MoviceServiceImpl();
	
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        // Lấy tên phim từ request
	        String movieName = req.getParameter("movieName");

	        // Tìm kiếm phim
	        List<Movie > movies = movieService.searchMoviesByName(movieName);

	        // Đặt kết quả tìm kiếm vào request attribute
	        req.setAttribute("movies", movies);

	        // Chuyển hướng về trang JSP để hiển thị kết quả
	        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/user/home.jsp");
	        dispatcher.forward(req, resp);
	    }
}
