package com.cinema.controllers.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

import com.cinema.entity.NewsOrDiscount;
import com.cinema.services.*;
import com.cinema.services.impl.NewsOrDiscountServiceImpl;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/newsOrDiscounts", "/newsOrDiscountDetail" })
public class NewsOrDiscountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	INewsOrDiscountService newsOrDiscountService = new NewsOrDiscountServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		if (url.contains("newsOrDiscounts")) {
//			List<NewsOrDiscount> list = newsOrDiscountService.findAll();
//			req.setAttribute("listNewsOrDiscount", list);
			String searchKeyword = req.getParameter("search");
	        int page = 0;
	        int pageSize = 5; // Số item trên mỗi trang, có thể tùy chỉnh

	        try {
	            page = Integer.parseInt(req.getParameter("page"));
	        } catch (NumberFormatException e) {
	            // Mặc định page = 0 nếu không truyền hoặc lỗi định dạng
	        }

	        if (searchKeyword != null && !searchKeyword.isEmpty()) {
	            // Tìm kiếm
	            List<NewsOrDiscount> searchResults = newsOrDiscountService.findByNewsOrDiscountname(searchKeyword, page, pageSize);
	            
	            // Tính số trang
	            int totalItems = newsOrDiscountService.countBySearch(searchKeyword); // Phương thức đếm kết quả tìm kiếm
	            int totalPages = (int) Math.ceil((double) totalItems / pageSize);
	            
	            req.setAttribute("listNewsOrDiscount", searchResults);
	            req.setAttribute("totalPages", totalPages);
	            req.setAttribute("currentPage", page);
	        } else {
	            // Phân trang
	            List<NewsOrDiscount> pagedResults = newsOrDiscountService.findAll(page, pageSize);
	            int totalItems = newsOrDiscountService.count();
	            int totalPages = (int) Math.ceil((double) totalItems / pageSize);

	            req.setAttribute("listNewsOrDiscount", pagedResults);
	            req.setAttribute("totalPages", totalPages);
	            req.setAttribute("currentPage", page);
	        }
			
			req.getRequestDispatcher("/views/web/newsordiscount.jsp").forward(req, resp);
		} else if (url.contains("newsOrDiscountDetail")) {
			int id = Integer.parseInt(req.getParameter("id"));
            NewsOrDiscount newsOrDiscount = newsOrDiscountService.findById(id);
			List<NewsOrDiscount> list = newsOrDiscountService.findAll();
			req.setAttribute("listNewsOrDiscount", list);
            req.setAttribute("newsOrDiscount", newsOrDiscount);
			req.getRequestDispatcher("/views/web/newsordiscount-detail.jsp").forward(req, resp);
		}
	}

}