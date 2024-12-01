package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Person;
import com.cinema.services.IPopCornService;
import com.cinema.services.impl.PopCornServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.cinema.entity.*;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "PopcornController", urlPatterns = { "/admin/popcorns", "/admin/popcorns/save", "/admin/popcorns/add",
		"/admin/popcorns/edit", "/admin/popcorns/update", "/admin/popcorns/delete" })
public class PopcornController extends HttpServlet{
	IPopCornService popcornService = new PopCornServiceImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("person") != null) {
			Person person = (Person) session.getAttribute("person");

			if (person.getRole().toLowerCase().contains("admin")) {
				String action = request.getServletPath();
				switch (action) {
					case "/admin/popcorns/add":
						request.getRequestDispatcher("/views/admin/popcorn/popcorn-add.jsp").forward(request, response);
						break;
					case "/admin/popcorns/edit":
						loadPopcornForEdit(request, response); // Load category data for edit
						break;
					default:
						// Lấy thông tin phân trang từ tham số yêu cầu
						//int page = Integer.parseInt(request.getParameter("page"));
						int page = 1;
						int pageSize = 5;
						String searchValue = request.getParameter("searchQuery");
						if (request.getParameter("pageNumber") != null && request.getParameter("pageSize") != null) {
							page = Integer.parseInt(request.getParameter("pageNumber"));
							pageSize = Integer.parseInt(request.getParameter("pageSize"));
						}


						// Lấy danh sách sản phẩm và tổng số trang
						List<PopCorn> popcorns = popcornService.getPopCorns(page, pageSize, searchValue);
						int totalPages = popcornService.getTotalPages(pageSize, searchValue);
						Long popcornTotal = popcornService.countTotalPopCorns(searchValue);
						// Đưa dữ liệu vào request để hiển thị ở JSP
						request.setAttribute("popcornTotal", popcornTotal);
						request.setAttribute("popcorns", popcorns);
						request.setAttribute("currentPage", page);
						request.setAttribute("totalPages", totalPages);
						request.setAttribute("pageSize", pageSize);
						request.setAttribute("pageNumber", page);
						request.setAttribute("searchQuery", searchValue);

						// Forward đến JSP
						request.getRequestDispatcher("/views/admin/popcorn/popcorn-list.jsp").forward(request, response);
						break;
				}
				return;
			}
		}
		response.sendRedirect(request.getContextPath() + "/signin");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getServletPath();

		switch (action) {
			case "/admin/popcorns/save":
				addPopcorn(req, resp);
				break;
			case "/admin/popcorns/update":
				updatePopcorn(req, resp);
				break;
			case "/admin/popcorns/delete":
				deletePopcorn(req, resp);
				break;
			default:
				resp.sendRedirect("admin/popcorns");
				break;
		}
	}


	private void addPopcorn(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PopCorn popcorn = new PopCorn();
		popcorn.setNamePopCorn(request.getParameter("namePopCorn"));
		popcorn.setPrice(Double.parseDouble(request.getParameter("price")));
		popcorn.setTypePopCorn(request.getParameter("typePopCorn"));
		String status = request.getParameter("status");
		popcorn.setStatus("1".equals(status));
		popcornService.insertPopCorn(popcorn);
		response.sendRedirect(request.getContextPath() + "/admin/popcorns");
	}

	private void updatePopcorn(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int popcorId = Integer.parseInt(request.getParameter("popcornID"));
		PopCorn popcorn = popcornService.getOnePopCorn(popcorId);

		if (popcorn != null) {
			popcorn.setNamePopCorn(request.getParameter("namePopCorn"));
			popcorn.setPrice(Double.parseDouble(request.getParameter("price")));
			popcorn.setTypePopCorn(request.getParameter("typePopCorn"));
			String status = request.getParameter("status");
			popcorn.setStatus("1".equals(status));
			popcornService.updatePopCorn(popcorn);
		}

		response.sendRedirect(request.getContextPath() + "/admin/popcorns");

	}

	private void loadPopcornForEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String popcorIdParam = request.getParameter("popcornID");
		int popcorId = Integer.parseInt(popcorIdParam);
		PopCorn popcorn = popcornService.getOnePopCorn(popcorId);

		if (popcorn != null) {
			request.setAttribute("popcorn", popcorn);
			request.getRequestDispatcher("/views/admin/popcorn/popcorn-edit.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/popcorns");
		}
	}

	private void deletePopcorn(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String popcorIdParam = request.getParameter("popcornID");
		int popcorId = Integer.parseInt(popcorIdParam);
		PopCorn popcorn = popcornService.getOnePopCorn(popcorId);
		try {
			popcornService.deletePopCorn(popcorn);
			// Trả về phản hồi cho client
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"status\": \"success\"}");
			response.sendRedirect(request.getContextPath() + "/admin/popcorns");

		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("{\"status\": \"error\", \"message\": \"Có lỗi xảy ra khi xóa user.\"}");
			e.printStackTrace();
		}
	}
}
