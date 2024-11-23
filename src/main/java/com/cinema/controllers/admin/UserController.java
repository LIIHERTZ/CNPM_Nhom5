package com.cinema.controllers.admin;
import java.io.IOException;
import java.util.List;

import com.cinema.services.*;
import com.cinema.entity.*;
import com.cinema.services.impl.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UserController", urlPatterns = { "/admin/users", "/admin/users/save", "/admin/users/add",
		"/admin/users/edit", "/admin/users/update", "/admin/users/delete" })
public class UserController extends HttpServlet{
	
	IUserService userService = new UserServiceImpl();
	IPersonService personService = new PersonServiceImpl();
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getServletPath();
			switch (action) {
			case "/admin/users/add":
				request.getRequestDispatcher("/views/admin/user-add.jsp").forward(request, response);
				break;
			case "/admin/users/edit":
				loadUserForEdit(request, response); // Load category data for edit
				break;
			default:
				 // Lấy thông tin phân trang từ tham số yêu cầu
		        //int page = Integer.parseInt(request.getParameter("page"));
			  int page =1;
			  int pageSize = 5;
			  String searchValue = request.getParameter("searchQuery");
			  System.out.println("dddd" + request.getParameter("pageNumber"));
			  System.out.println("ddddssss" +request.getParameter("pageSize"));
			 	if (request.getParameter("pageNumber") != null  && request.getParameter("pageSize") != null)
			 	{
			 		 page = Integer.parseInt(request.getParameter("pageNumber"));
			 		pageSize = Integer.parseInt(request.getParameter("pageSize"));
			 	}
			 	

		        // Lấy danh sách sản phẩm và tổng số trang
		        List<Person> users = userService.getUsers(page, pageSize,searchValue);
		        int totalPages = userService.getTotalPages(pageSize,searchValue);
		        // Đưa dữ liệu vào request để hiển thị ở JSP
		        request.setAttribute("users", users);
		        request.setAttribute("currentPage", page);
		        request.setAttribute("totalPages", totalPages);
		        request.setAttribute("pageSize", pageSize);
		        request.setAttribute("pageNumber", page);
		        request.setAttribute("searchQuery", searchValue);

		        // Forward đến JSP
		        request.getRequestDispatcher("/views/admin/user-list.jsp").forward(request, response);
				break;
	       
			}
	 }
	 
	 @Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String action = req.getServletPath();

			switch (action) {
			case "/admin/users/save":
				addUser(req, resp);
				break;
			case "/admin/users/update":
				updateUser(req, resp);
				break;
			case "/admin/users/delete":
				deleteUser(req, resp);
				break;
			default:
				resp.sendRedirect("admin/users");
				break;
			}
		}
			
			
			private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
				Person user = new Person();
				user.setFullName(request.getParameter("fname"));
				user.setEmail(request.getParameter("email"));
				user.setPassword(request.getParameter("password"));
				user.setPhone(request.getParameter("phone"));
				String rights = request.getParameter("rights");
				user.setRole(rights);
				personService.insertPerson(user);
				response.sendRedirect(request.getContextPath() + "/admin/users");
			}
			
			private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
				int userId = Integer.parseInt(request.getParameter("userId"));
				Person user = personService.getOnePerson(userId);

				if (user != null) {
					user.setFullName(request.getParameter("fname"));
					user.setEmail(request.getParameter("email"));
					user.setPassword(request.getParameter("password"));
					user.setPhone(request.getParameter("phone"));
					String rights = request.getParameter("rights");
					user.setRole(rights);
					personService.updatePerson(user);
				}

				response.sendRedirect(request.getContextPath() + "/admin/users");

			}
			
			private void loadUserForEdit(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
				String userIdParam = request.getParameter("userId");
				int userId = Integer.parseInt(userIdParam);
				Person user = personService.getOnePerson(userId);

				if (user != null) {
					request.setAttribute("user", user);
					request.getRequestDispatcher("/views/admin/user-edit.jsp").forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/admin/users");
				}
			}
			
			private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
				String userIdParam = request.getParameter("userId");
				int userId = Integer.parseInt(userIdParam);
				Person user = personService.getOnePerson(userId);
				try {
					personService.deletePerson(user);
					// Trả về phản hồi cho client
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("{\"status\": \"success\"}");
					response.sendRedirect(request.getContextPath() + "/admin/users");

				} catch (Exception e) {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					response.getWriter().write("{\"status\": \"error\", \"message\": \"Có lỗi xảy ra khi xóa user.\"}");
					e.printStackTrace();
				}
			}

	 
	 
	 
}
	 
	 
