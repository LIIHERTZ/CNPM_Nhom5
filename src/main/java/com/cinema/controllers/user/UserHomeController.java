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
import jakarta.servlet.http.HttpSession;


@WebServlet(urlPatterns = "/userHome")
public class UserHomeController extends HttpServlet {

	
	private static final long serialVersionUID = 4317368494648713183L;
	private IMovieService movieService = new MoviceServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
	        if (session == null || session.getAttribute("person") == null) {
	            resp.sendRedirect(req.getContextPath() + "/signin");
	            return;
	        }

	        // Lấy danh sách phim đang chiếu
	        List<Movie> moviesShowing = movieService.getMoviesShowing();
	        req.setAttribute("moviesShowing", moviesShowing);

	        // Lấy danh sách phim sắp chiếu
	        List<Movie> moviesComingSoon = movieService.getMoviesComingSoon();
	        req.setAttribute("moviesComingSoon", moviesComingSoon);

	        // Chuyển tiếp đến trang home.jsp
	        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/user/home.jsp");
	        dispatcher.forward(req, resp);
	}
}
