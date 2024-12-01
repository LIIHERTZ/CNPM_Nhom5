package com.cinema.controllers.user;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.Movie;
import com.cinema.entity.Person;
import com.cinema.entity.Review;
import com.cinema.services.IMovieService;
import com.cinema.services.IPersonService;
import com.cinema.services.IReviewService;
import com.cinema.services.ITicketService;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.PersonServiceImpl;
import com.cinema.services.impl.ReviewServiceImpl;
import com.cinema.services.impl.TicketServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/userReview", "/userSubmitReview" })
public class ReviewController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(ReviewController.class.getName());
	private IReviewService reviewService;
	private IMovieService movieService;
	private IPersonService personService;
	private ITicketService ticketService;

	@Override
	public void init() throws ServletException {
		super.init();
		reviewService = new ReviewServiceImpl();
		movieService = new MovieServiceImpl();
		personService = new PersonServiceImpl();
		ticketService = new TicketServiceImpl();

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("person") != null) {

			Person person = (Person) session.getAttribute("person");
			int perID = person.getPerID(); 

			if (!person.getRole().toLowerCase().contains("admin")) {
				String action = req.getRequestURI().toString();
				if (action.contains("/userReview")) {
					handleUserReview(req, resp, perID);
				} else {
					resp.sendError(HttpServletResponse.SC_NOT_FOUND, "URL không được hỗ trợ ok");
				}
				return;
			}
		}
		resp.sendRedirect(req.getContextPath() + "/signin");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getRequestURI().toString();
		if (action.contains("/userSubmitReview")) {
			handleAddReview(req, resp);
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "URL không được hỗ trợ");
		}
	}

	private void handleUserReview(HttpServletRequest req, HttpServletResponse resp, int perID)
			throws ServletException, IOException {
		String movieIDParam = req.getParameter("movieID");

		if (movieIDParam == null) {
			req.setAttribute("errorMessage", "Không tìm thấy thông tin phim. Vui lòng thử lại.");
			RequestDispatcher rd = req.getRequestDispatcher("/userHome");
			rd.forward(req, resp);
			return;
		}

		int movieID;
		try {
			movieID = Integer.parseInt(movieIDParam);
		} catch (NumberFormatException e) {
			req.setAttribute("errorMessage", "ID của phim không hợp lệ. Vui lòng thử lại.");
			RequestDispatcher rd = req.getRequestDispatcher("/userHome");
			rd.forward(req, resp);
			return;
		}

		Movie movie = movieService.getMovieById(movieID);
		if (movie == null) {
			req.setAttribute("errorMessage", "Phim không tồn tại hoặc đã bị xóa. Vui lòng thử lại.");
			RequestDispatcher rd = req.getRequestDispatcher("/userHome");
			rd.forward(req, resp);
			return;
		}	
		List<Review> reviews = reviewService.getReviewsByMovie(movieID);
		int count = reviewService.countReviewsByMovie(movieID);
		int totalRating = 0;
		for (Review review : reviews) {
			totalRating += review.getEvaluate();
		}
		float ratings = (count > 0) ? (float) totalRating / count : 0; // Kiểm tra tránh chia cho 0
		movieService.updateMovieRating(movieID, ratings);
		req.setAttribute("movie", movie);
		req.setAttribute("reviews", reviews);
		req.setAttribute("count", count);
		req.setAttribute("perID", perID);
		req.setAttribute("ratings", ratings);
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/review.jsp");
		rd.forward(req, resp);
	}

	private void handleAddReview(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			String movieIDParam = req.getParameter("movieid");
			String perIDParam = req.getParameter("perid");
			String ratingParam = req.getParameter("rating");
			String reviewText = req.getParameter("review_text");

			int movieID = Integer.parseInt(movieIDParam);
			int perID = Integer.parseInt(perIDParam);
			int rating = Integer.parseInt(ratingParam);
			Movie movie = movieService.getMovieById(movieID);
			List<TicketHistoryDTO> tmps = ticketService.getTicketHistory(perID);
			if (tmps == null || tmps.isEmpty()) {
				req.setAttribute("errorMessage", "Bạn không thể đánh giá bộ phim này !");
				resp.sendRedirect(req.getContextPath() + "/userReview?movieID=" + movieID + "&perID=" + perID);
				logger.info("User with ID " + perID + " has already reviewed movie with ID " + movieID);
			} else {
				for (TicketHistoryDTO tmp : tmps) {
					if (tmp.getMovieName() == movie.getMovieName()) {
						req.setAttribute("errorMessage", "Bạn không thể đánh giá bộ phim này !");
						resp.sendRedirect(req.getContextPath() + "/userReview?movieID=" + movieID + "&perID=" + perID);
						logger.info("User with ID " + perID + " has already reviewed movie with ID " + movieID);
					} else {
						boolean hasReviewed = reviewService.hasReviewed(perID, movieID);
						if (hasReviewed) {
							req.setAttribute("errorMessage", "Bạn đã đánh giá bộ phim này rồi!");
							resp.sendRedirect(
									req.getContextPath() + "/userReview?movieID=" + movieID + "&perID=" + perID);
							logger.info("User with ID " + perID + " has already reviewed movie with ID " + movieID);
						} else {
							Review review = new Review();
							review.setContent(reviewText);
							review.setEvaluate(rating);
							review.setMovie(movieService.getMovieById(movieID));
							review.setPerson(personService.getOnePerson(perID));

							boolean isAdded = reviewService.addReview(review);

							if (isAdded) {
								req.setAttribute("errorMessage", "Đánh giá thành công!");
								resp.sendRedirect(
										req.getContextPath() + "/userReview?movieID=" + movieID + "&perID=" + perID);
								logger.info(
										"Review added successfully for movieID: " + movieID + ", by userID: " + perID);
							} else {
								req.setAttribute("errorMessage", "Đánh giá thất bại!");
								resp.sendRedirect(
										req.getContextPath() + "/userReview?movieID=" + movieID + "&perID=" + perID);
								logger.warning(
										"Failed to add review for movieID: " + movieID + ", by userID: " + perID);
							}
						}
					}
				}
			}

		} catch (NumberFormatException e) {

			e.printStackTrace();
			req.getRequestDispatcher(
					"/userReview?movieID=" + req.getParameter("movieID") + "&perID=" + req.getParameter("perID"))
					.forward(req, resp);
			logger.severe("Number format exception occurred: " + e.getMessage());
		} catch (Exception e) {

			e.printStackTrace();
			req.getRequestDispatcher(
					"/userReview?movieID=" + req.getParameter("movieID") + "&perID=" + req.getParameter("perID"))
					.forward(req, resp);
			logger.severe("An unexpected error occurred: " + e.getMessage());
		}
	}
}