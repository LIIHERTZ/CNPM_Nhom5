package com.cinema.controllers.web;

import java.io.IOException;

import com.cinema.entity.Person;
import com.cinema.services.IPersonService;
import com.cinema.services.impl.PersonServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/signin", "/waiting" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IPersonService accService = new PersonServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("signin"))
			showPageLogin(req, resp);
		else if (url.contains("waiting"))
			waiting(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("signin"))
			checkLogin(req, resp);
	}

	private void showPageLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("person") != null) {
			resp.sendRedirect(req.getContextPath() + "/waiting");
			return;
		}

		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("personID")) {
					Person person = accService.getOnePerson(Integer.parseInt(cookie.getValue()));
					String tmp = cookie.getValue();
					session = req.getSession(true);
					session.setAttribute("person", person);
					resp.sendRedirect(req.getContextPath() + "/waiting");
					return;
				}
			}
		}

		RequestDispatcher rd = req.getRequestDispatcher("/views/web/signin.jsp");
		rd.forward(req, resp);
	}

	private void checkLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		Person person = accService.login(email, password);
		if (person == null) {
			req.setAttribute("mess", "Tài khoản hoặc mật khẩu chưa đúng");
			req.setAttribute("person", person);
			showPageLogin(req, resp);
		} else {
			HttpSession session = req.getSession(true);
			session.setAttribute("person", person);
			if ("on".equals(req.getParameter("remember"))) {
				saveRemeberMe(resp, person.getPerID());
			}
			resp.sendRedirect(req.getContextPath() + "/waiting");
		}

	}

	private void waiting(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
			resp.sendRedirect(req.getContextPath() + "/login");
		}

		resp.sendRedirect(req.getContextPath() + "/sginin");
	}

	private void saveRemeberMe(HttpServletResponse resp, int personID) {
		Cookie cookie = new Cookie("personID", String.valueOf(personID));
		cookie.setMaxAge(30 * 62);
		resp.addCookie(cookie);

	}
}
