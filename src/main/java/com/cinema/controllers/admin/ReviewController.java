package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Movie;
import com.cinema.entity.Person;
import com.cinema.entity.Review;
import com.cinema.services.IReviewService;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.ReviewServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/adminReview"})
public class ReviewController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IReviewService reviewService;

    @Override
    public void init() {
        reviewService = new ReviewServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("person") != null) {
            Person person = (Person) session.getAttribute("person");

            if (person.getRole().toLowerCase().contains("admin")) {
                int movieId = Integer.parseInt(request.getParameter("movieID"));
                int page = 1;  // Mặc định là trang 1
                int pageSize = 5;  // Mỗi trang có 5 bài đánh giá

                // Lấy số trang từ query parameters nếu có
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    try {
                        page = Integer.parseInt(pageParam);
                    } catch (NumberFormatException e) {
                        page = 1; // Nếu page không phải số hợp lệ, default về trang 1
                    }
                }

                // Giới hạn page để không vượt quá tổng số trang
                int totalReviews = reviewService.getTotalReviewCountByMovie(movieId);
                int totalPages = (int) Math.ceil((double) totalReviews / pageSize);
                if (page < 1) page = 1;  // Đảm bảo page không nhỏ hơn 1
                if (page > totalPages) page = totalPages;  // Đảm bảo page không vượt quá tổng số trang

                // Lấy các bài đánh giá cho trang hiện tại
                List<Review> reviews = reviewService.getReviewsByMovieWithPagination(movieId, page, pageSize);

                // Lưu vào request attributes
                request.setAttribute("reviews", reviews);
                request.setAttribute("noOfRecords", totalReviews);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", page);
                request.setAttribute("movieId", movieId);

                // Chuyển đến JSP
                request.getRequestDispatcher("/views/admin/review.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/signin");
    }


}
