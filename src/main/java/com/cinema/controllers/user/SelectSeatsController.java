package com.cinema.controllers.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.cinema.entity.*;
import com.cinema.services.IMovieService;
import com.cinema.services.ISeatService;
import com.cinema.services.ISeatStatusService;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.SeatServiceImpl;

import com.cinema.services.impl.SeatStatusServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/userSelectSeats")
public class SelectSeatsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IMovieService movieService = new MovieServiceImpl();
	private ISeatService seatService = new SeatServiceImpl();
	private ISeatStatusService seatStatusService = new SeatStatusServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("person") != null) {

			Person person = (Person) session.getAttribute("person");

			if (!person.getRole().toLowerCase().contains("admin")) {

				// Lấy thông tin từ Session
				String screeningIdStr = (String) session.getAttribute("screeningId");
				String selectedLocation = (String) session.getAttribute("selectedLocation");
				String selectedDate = (String) session.getAttribute("selectedDate");
				String experience = (String) session.getAttribute("experience");
				String version = (String) session.getAttribute("version");
				String startHourStr = (String) session.getAttribute("startHour");
				Movie movie = (Movie) session.getAttribute("movie");
				String cinemaName = (String) session.getAttribute("cinemaName");

				// Chuyển đổi startHour từ String sang Date
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Định dạng của startHour
				Date startHour = null;
				try {
					if (startHourStr != null) {
						startHour = sdf.parse(startHourStr);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if (screeningIdStr == null || screeningIdStr.isEmpty()) {
					resp.sendRedirect("/userBookTickets");
					return;
				}

				int screeningId = Integer.parseInt(screeningIdStr);

				// Lấy danh sách ghế và trạng thái
				List<SeatStatus> seatStatuses = seatService.getSeatStatusesByScreeningId(screeningId);

				// Nhóm ghế theo hàng (row)
				Map<String, List<SeatStatus>> seatStatusesGroupedByRow = seatStatuses.stream()
						.collect(Collectors.groupingBy(seat -> seat.getSeat().getSeatNumber().substring(0, 1)));

				// Gán thông tin vào request để truyền tới JSP
				req.setAttribute("movie", movie);
				req.setAttribute("seatStatusesGroupedByRow", seatStatusesGroupedByRow);
				req.setAttribute("screeningId", screeningId);
				req.setAttribute("selectedLocation", selectedLocation);
				req.setAttribute("selectedDate", selectedDate);
				req.setAttribute("experience", experience);
				req.setAttribute("version", version);
				req.setAttribute("startHour", startHour);
				req.setAttribute("cinemaName", cinemaName);

				RequestDispatcher dispatcher = req.getRequestDispatcher("/views/user/movie-seat-plan.jsp");
				dispatcher.forward(req, resp);
				return;
			}
		}
		resp.sendRedirect(req.getContextPath() + "/signin");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy dữ liệu từ form
		HttpSession session = request.getSession();
		String screeningId = (String) request.getParameter("screeningId");
		String selectedSeats = request.getParameter("selectedSeats");
		String totalPrice = request.getParameter("totalPrice");
		String amountPayable = (String) session.getAttribute("amountPayable");
		String foodAndBeverageTotal = (String) session.getAttribute("foodAndBeverageTotal");
		
		// Kiểm tra và gán mặc định nếu null
		if (totalPrice == null || totalPrice.isEmpty()) {
		    totalPrice = "0";
		}
		if (foodAndBeverageTotal != null) {
		    foodAndBeverageTotal = foodAndBeverageTotal.replaceAll("[^\\d]", ""); // Loại bỏ tất cả ký tự không phải số
		} else {
		    foodAndBeverageTotal = "0"; // Gán mặc định nếu null
		}
		
		// Chuyển đổi và tính toán
		int totalPriceInt = Integer.parseInt(totalPrice);
		int foodAndBeverageTotalInt = Integer.parseInt(foodAndBeverageTotal);
		int amountPayableInt = totalPriceInt + foodAndBeverageTotalInt;
		
		// Chuyển lại thành String
		amountPayable = String.valueOf(amountPayableInt);
		String[] seats = selectedSeats.split(",");
		for (String seat : seats) {
			Seat tmp = seatService.findSeatIdBySeatNumberAndScreeningId(seat, Integer.parseInt(screeningId));
			seatStatusService.updateSeatStatusesTrue(tmp.getSeatID(), Integer.parseInt(screeningId));
		}
		// Lưu vào session
		session.setAttribute("selectedSeats", selectedSeats);
		session.setAttribute("totalPrice", totalPrice);
		session.setAttribute("amountPayable", amountPayable);

		response.sendRedirect("userMovieCheckout");
	}

}
