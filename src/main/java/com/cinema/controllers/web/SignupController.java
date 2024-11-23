package com.cinema.controllers.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.cinema.entity.Person;
import com.cinema.services.IPersonService;
import com.cinema.services.impl.PersonServiceImpl;

import com.cinema.other.City;

import com.cinema.other.SendMail;

@WebServlet(urlPatterns = { "/signup", "/verification", "/resend" })
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IPersonService perService = new PersonServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("signup"))
			showPageSignup(req, resp);
		else if (url.contains("verification"))
			showVerificationPage(req, resp);
		else if (url.contains("resend")) {
			sendVerificationEmail(req);
			showVerificationPage(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("signup"))
			checkInfoSignup(req, resp);
		else if (url.contains("verification"))
			insertPer(req, resp);
	}

	private void showPageSignup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<String> listcity = City.getListCity();
		req.setAttribute("listcity", listcity);
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/signup.jsp");
		rd.forward(req, resp);
	}

	private void showVerificationPage(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("verification") != null) {
			RequestDispatcher rd = req.getRequestDispatcher("/views/web/verification.jsp");
			rd.forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

	private void checkInfoSignup(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		try {
			perService.checkValidInfoPerson(req.getParameter("fullname"), req.getParameter("email"),
					req.getParameter("passsignup"), req.getParameter("passcheck"), req.getParameter("phone"),
					req.getParameter("gender"), req.getParameter("region"), req.getParameter("dob"));
			req.removeAttribute("exception");

			Person person = new Person();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			person.setFullName(req.getParameter("fullname"));
			person.setEmail(req.getParameter("email"));
			person.setPassword(req.getParameter("passsignup"));
			person.setPhone(req.getParameter("phone"));
			person.setGender(Integer.parseInt(req.getParameter("gender")));
			person.setRegion(req.getParameter("region"));
			person.setBirthDate(formatter.parse(req.getParameter("dob")));
			person.setRole("User");

			HttpSession session = req.getSession();
			session.setAttribute("newperson", person);

			sendVerificationEmail(req);

			resp.sendRedirect("verification");

		} catch (IllegalArgumentException e) {
			req.setAttribute("exception", e.getMessage());
			req.setAttribute("personnamesignup", req.getParameter("personnamesignup"));
			req.setAttribute("firstname", req.getParameter("firstname"));
			req.setAttribute("lastname", req.getParameter("lastname"));
			req.setAttribute("email", req.getParameter("email"));
			req.setAttribute("phone", req.getParameter("phone"));
			req.setAttribute("area", req.getParameter("area"));
			req.setAttribute("address", req.getParameter("address"));
			req.setAttribute("gender", req.getParameter("gender"));
			req.setAttribute("dob", req.getParameter("dob"));

			showPageSignup(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void insertPer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String verification = (String) session.getAttribute("verification");
		String personcode = req.getParameter("personcode");

		if (verification.equals(personcode)) {
			Person person = (Person) session.getAttribute("newperson");
			perService.insertPerson(person);
			session.invalidate();
			resp.sendRedirect("signin");
		} else {
			req.setAttribute("mess", "Mã xác thực chưa đúng");
			showVerificationPage(req, resp);
		}

	}

	private void sendVerificationEmail(HttpServletRequest req) {
		HttpSession session = req.getSession();

		Person person = (Person) session.getAttribute("newperson");
		Random rnd = new Random();
		String verification = String.valueOf(rnd.nextInt(100000, 999999));
		SendMail.sendMail(person.getEmail(), "Mã xác nhận: " + verification);
		session.setAttribute("verification", verification);

	}

}
