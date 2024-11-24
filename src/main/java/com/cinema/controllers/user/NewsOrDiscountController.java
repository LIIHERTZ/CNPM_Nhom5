package com.cinema.controllers.user;

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
@WebServlet(urlPatterns = { "/usernewsOrDiscounts", "/usernewsOrDiscountDetail" })
public class NewsOrDiscountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	INewsOrDiscountService newsOrDiscountService = new NewsOrDiscountServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		if (url.contains("newsOrDiscounts")) {
			List<NewsOrDiscount> list = newsOrDiscountService.findAll();
			req.setAttribute("listNewsOrDiscount", list);
			req.getRequestDispatcher("/views/user/newsordiscount.jsp").forward(req, resp);
		} else if (url.contains("newsOrDiscountDetail")) {
			int id = Integer.parseInt(req.getParameter("id"));
            NewsOrDiscount newsOrDiscount = newsOrDiscountService.findById(id);
            req.setAttribute("newsOrDiscount", newsOrDiscount);
			req.getRequestDispatcher("/views/user/newsordiscount-detail.jsp").forward(req, resp);
		}
	}

}