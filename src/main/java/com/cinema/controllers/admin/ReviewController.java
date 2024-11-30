package com.cinema.controllers.admin;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Review;
import com.cinema.services.IMovieService;
import com.cinema.services.IReviewService;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.ReviewServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/adminReview", "/admin/deleteReview"})
public class ReviewController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IReviewService reviewService = new ReviewServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String movieIDParam = req.getParameter("movieID");

        if (movieIDParam == null) {
            req.setAttribute("errorMessage", "Không tìm thấy thông tin phim. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/admin/movies");
            rd.forward(req, resp);
            return;
        }

        int movieID;
        try {
            movieID = Integer.parseInt(movieIDParam);
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "ID của phim không hợp lệ. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/admin/movies");
            rd.forward(req, resp);
            return;
        }        
        List<Review> reviews = reviewService.getReviewsByMovie(movieID);
        int noOfRecords = reviewService.countReviewsByMovie(movieID);
        // Đặt các thuộc tính vào request để truyền đến JSP
        req.setAttribute("reviews", reviews);        
        req.setAttribute("noOfRecords", noOfRecords);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/review.jsp");
        rd.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {         
            case "/admin/deleteReview":
                deleteReview(req, resp); // Thêm dòng này để xử lý xóa bằng POST
                break;
        }
    }
    private void deleteReview(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String ReviewIDParam = req.getParameter("id");
        if (ReviewIDParam != null && ! ReviewIDParam.isEmpty()) {
            try {
                int ReviewID = Integer.parseInt(ReviewIDParam);
                boolean isDeleted = reviewService.deleteReview(ReviewID);
                if (isDeleted) {
                    resp.sendRedirect(req.getContextPath() + "/adminReview");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/adminReview?error=deletefailed");
                }
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getContextPath() + "/adminReview?error=invalidid");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/adminReview?error=invalidid");
        }
    }
}
