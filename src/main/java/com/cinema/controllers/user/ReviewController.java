package com.cinema.controllers.user;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Movie;
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

@WebServlet(urlPatterns = {"/userReview"})
public class ReviewController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IReviewService reviewService;
    private IMovieService movieService;

    @Override
    public void init() throws ServletException {
        super.init();
        reviewService = new ReviewServiceImpl();
        movieService = new MovieServiceImpl(); 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Bước 1: Lấy movieID từ request
        String movieIDParam = req.getParameter("movieID");

        if (movieIDParam == null) {
            // Nếu không có movieID, chuyển hướng về trang chủ với thông báo lỗi
            req.setAttribute("errorMessage", "Không tìm thấy thông tin phim. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/userHome");
            rd.forward(req, resp);
            return;
        }

        int movieID;
        try {
            movieID = Integer.parseInt(movieIDParam);
            System.out.println("Movie ID received: " + movieID); // Log để kiểm tra movieID
        } catch (NumberFormatException e) {
            // Nếu movieID không hợp lệ, chuyển hướng về trang chủ với thông báo lỗi
            req.setAttribute("errorMessage", "ID của phim không hợp lệ. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/userHome");
            rd.forward(req, resp);
            return;
        }

        // Bước 2: Lấy đối tượng Movie từ cơ sở dữ liệu
        Movie movie = movieService.getMovieById(movieID);
        if (movie == null) {
            // Nếu không tìm thấy phim, log thông tin và chuyển hướng về trang chủ
            System.out.println("Movie not found for ID: " + movieID); // Log nếu không tìm thấy movie
            req.setAttribute("errorMessage", "Phim không tồn tại hoặc đã bị xóa. Vui lòng thử lại.");
            RequestDispatcher rd = req.getRequestDispatcher("/userHome");
            rd.forward(req, resp);
            return;
        }

        // Bước 3: Lấy danh sách đánh giá cho phim
        List<Review> reviews = reviewService.getReviewsByMovie(movieID);
        int count = reviewService.countReviewsByMovie(movieID);

        // Bước 4: Gửi dữ liệu đến JSP để hiển thị thông tin phim và đánh giá
        req.setAttribute("movie", movie);
        req.setAttribute("reviews", reviews);
        req.setAttribute("count", count);

        // Bước 5: Chuyển tiếp đến trang review.jsp để hiển thị chi tiết
        RequestDispatcher rd = req.getRequestDispatcher("/views/user/review.jsp");
        rd.forward(req, resp);
    }
}  