package com.cinema.controllers.web;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import com.cinema.entity.Person;
import com.cinema.dto.GoogleAccountDTO;
import com.cinema.services.IPersonService;
import com.cinema.services.impl.PersonServiceImpl;
import com.cinema.other.Constants;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/signin", "/loginwithgoogle" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IPersonService accService = new PersonServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("signin"))
			showPageLogin(req, resp);
		else if (url.contains("loginwithgoogle"))
			showGoogleLogin(req, resp);
		/*
		 * else if (url.contains("waiting")) waiting(req, resp);
		 */
	}

	private void showGoogleLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		String code = req.getParameter("code");
		String accessToken = getToken(code,req);
		GoogleAccountDTO acc = getUserInfo(accessToken);
		String email = acc.getEmail();
		HttpSession session = req.getSession(true);
		
		Person per = accService.findByEmail(email);
		if (per.getEmail() != null) {
			session.setAttribute("person", per);
			resp.sendRedirect(req.getContextPath() + "/waiting");
		} else {
			Person person= new Person();
			person.setFullName(acc.getName());
			person.setEmail(acc.getEmail());
			person.setRole("User");
			person.setPassword("123");
			accService.insertPerson(person);
			session.setAttribute("person", person);
			resp.sendRedirect(req.getContextPath() + "/waiting");
		}
		
	}
	public static String getToken(String code, HttpServletRequest req) throws ClientProtocolException, IOException {
		String url = "http://localhost:8080" + req.getContextPath() + "/loginwithgoogle";

        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)

                .bodyForm(

                        Form.form()

       .add("client_id", Constants.GOOGLE_CLIENT_ID)

                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)

                        .add("redirect_uri", url)

                        .add("code", code)

                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE)

                        .build()

                )

                .execute().returnContent().asString();



        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");

        return accessToken;

    }
	public static GoogleAccountDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;

        String response = Request.Get(link).execute().returnContent().asString();

        GoogleAccountDTO googlePojo = new Gson().fromJson(response, GoogleAccountDTO.class);

        return googlePojo;

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

	/*
	 * private void waiting(HttpServletRequest req, HttpServletResponse resp) throws
	 * ServletException, IOException { resp.setContentType("text/html"); HttpSession
	 * session = req.getSession();
	 * 
	 * if (session != null && session.getAttribute("person") != null) { Person
	 * person = (Person) session.getAttribute("person"); String url = "/home";
	 * 
	 * if (person.getRole().toLowerCase().contains("admin")) url = "/adminHome";
	 * else url = "/userHome";
	 * 
	 * resp.sendRedirect(req.getContextPath() + url); return; } else {
	 * resp.sendRedirect(req.getContextPath() + "/signin"); }
	 * 
	 * resp.sendRedirect(req.getContextPath() + "/signin"); }
	 */

	private void saveRemeberMe(HttpServletResponse resp, int personID) {
		Cookie cookie = new Cookie("personID", String.valueOf(personID));
		cookie.setMaxAge(30 * 62);
		resp.addCookie(cookie);

	}
}
