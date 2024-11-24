package com.cinema.controllers.admin;

import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/adminMessage")
public class AdminMessageController extends HttpServlet {

	
	private static final long serialVersionUID = 4317368494648713183L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy giờ hiện tại
	    LocalTime now = LocalTime.now();
	    // Định dạng giờ (HH:mm:ss)
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	    String formattedTime = now.format(formatter);

	    // Truyền giá trị vào request
	    req.setAttribute("currentTime", formattedTime);
		
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminMessage.jsp");
		rd.forward(req, resp);
	}
}
