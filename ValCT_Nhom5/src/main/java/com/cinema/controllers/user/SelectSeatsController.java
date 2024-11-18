package com.cinema.controllers.user;

import java.io.IOException;

import com.cinema.services.IMovieService;
import com.cinema.services.impl.MoviceServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/selectSeats")
public class SelectSeatsController extends HttpServlet {
	private IMovieService movieService = new MoviceServiceImpl();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String startHour = req.getParameter("startHour"); // Lấy giá trị startHour
	    String date = req.getParameter("date");
	    String location = req.getParameter("location");
	    String experience = req.getParameter("experience");
	    String version = req.getParameter("version");

	    // Chuyển tiếp đến trang tiếp theo hoặc xử lý thêm
	    req.setAttribute("startHour", startHour);
	    req.setAttribute("date", date);
	    req.setAttribute("location", location);
	    req.setAttribute("experience", experience);
	    req.setAttribute("version", version);

	    req.getRequestDispatcher("/views/user/movie-seat-plan.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
