package com.cinema.controllers.admin;

import java.io.IOException;

import com.cinema.entity.Person;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/adminHome")
public class AdminHomeController extends HttpServlet {

	private static final long serialVersionUID = 4317368494648713183L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("person") != null) {
		    Person person = (Person) session.getAttribute("person");

		    if (person.getRole().toLowerCase().contains("admin")) {

		        RequestDispatcher rd = req.getRequestDispatcher("/admin/cinemas");
		        rd.forward(req, resp);
		        return; 
		    }
		}

		resp.sendRedirect(req.getContextPath() + "/signin");
	}
}
