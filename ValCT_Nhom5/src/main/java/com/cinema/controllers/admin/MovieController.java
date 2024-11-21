package com.cinema.controllers.admin;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin/addMovie")
public class MovieController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//HttpSession session = req.getSession(false);
		/*
		 * if (session != null && session.getAttribute("person") != null) {
		 * resp.sendRedirect(req.getContextPath() + "/waiting"); return; }
		 */
		/*
		 * Cookie[] cookies = req.getCookies(); if (cookies != null) { for (Cookie
		 * cookie : cookies) { if (cookie.getName().equals("userID")) { UserModel user =
		 * cusService.getOneCustomer(Integer.parseInt(cookie.getValue())); session =
		 * req.getSession(true); session.setAttribute("user",user);
		 * resp.sendRedirect(req.getContextPath() + "/waiting"); return; } } }
		 */
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/Movie.jsp");
		rd.forward(req, resp);
	}
}
