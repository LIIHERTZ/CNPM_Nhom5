package com.cinema.controllers.web;

import java.io.IOException;

import com.cinema.entity.Person;
import com.cinema.services.IPersonService;
import com.cinema.services.impl.PersonServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/waiting" })
public class WaitingController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	IPersonService accService = new PersonServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		HttpSession session = req.getSession();

		if (session != null && session.getAttribute("person") != null) {
			Person person = (Person) session.getAttribute("person");
			String url = "/home";

			if (person.getRole().toLowerCase().contains("admin"))
				url = "/adminHome";
			else
				url = "/userHome";

			resp.sendRedirect(req.getContextPath() + url);
			return;
		} else {
			resp.sendRedirect(req.getContextPath() + "/signin");
		}
	}

}
