package com.cinema.controllers.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.cinema.entity.Movie;
import com.cinema.entity.Person;
import com.cinema.entity.PopCorn;
import com.cinema.entity.SeatStatus;
import com.cinema.services.IMovieService;
import com.cinema.services.IPopCornService;
import com.cinema.services.ISeatService;
import com.cinema.services.impl.MovieServiceImpl;
import com.cinema.services.impl.PopCornServiceImpl;
import com.cinema.services.impl.SeatServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/userAddService")
public class AddServiceController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private IMovieService movieService = new MovieServiceImpl();
	private ISeatService seatService = new SeatServiceImpl();
	private IPopCornService popcornService = new PopCornServiceImpl();

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

				String selectedSeats = (String) session.getAttribute("selectedSeats");
				String totalPrice = (String) session.getAttribute("totalPrice");

				// Lấy giá trị từ session nếu tồn tại
				Map<String, List<Integer>> products = (Map<String, List<Integer>>) session.getAttribute("products");
				String foodAndBeverageTotal = (String) session.getAttribute("foodAndBeverageTotal");
				String amountPayable = (String) session.getAttribute("amountPayable");

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
					resp.sendRedirect("/ValCT_Nhom5/userBookTickets");
					return;
				}

				int screeningId = Integer.parseInt(screeningIdStr);

				// Lấy danh sách ghế và trạng thái
				List<SeatStatus> seatStatuses = seatService.getSeatStatusesByScreeningId(screeningId);

				// Nhóm ghế theo hàng (row)
				Map<String, List<SeatStatus>> seatStatusesGroupedByRow = seatStatuses.stream()
						.collect(Collectors.groupingBy(seat -> seat.getSeat().getSeatNumber().substring(0, 1)));

				// Nhận tham số "type" từ request
				String type = req.getParameter("type");

				List<PopCorn> popcornList;
				if (type == null || type.equals("all")) {
					popcornList = popcornService.getAllPopcorns(); // Lấy tất cả popcorn
				} else {
					popcornList = popcornService.getPopcornsByType(type); // Lọc theo type
				}

				// Gán thông tin vào request để truyền tới JSP

				req.setAttribute("movie", movie);
				req.setAttribute("seatStatusesGroupedByRow", seatStatusesGroupedByRow);
				req.setAttribute("screeningId", screeningId);
				req.setAttribute("selectedLocation", selectedLocation);
				req.setAttribute("selectedDate", selectedDate);
				req.setAttribute("experience", experience);
				req.setAttribute("version", version);
				req.setAttribute("startHour", startHour);

				req.setAttribute("selectedSeats", selectedSeats);
				req.setAttribute("totalPrice", totalPrice);

				req.setAttribute("popcornList", popcornList);

				// Gán lại vào request attribute để truyền đến JSP
				req.setAttribute("products", products);
				req.setAttribute("foodAndBeverageTotal", foodAndBeverageTotal);
				req.setAttribute("amountPayable", amountPayable);

				RequestDispatcher rd = req.getRequestDispatcher("/views/user/add-service.jsp");
				rd.forward(req, resp);
				return;
			}
		}
		resp.sendRedirect(req.getContextPath() + "/signin");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		// Dùng Map để lưu trữ sản phẩm
		Map<String, List<Integer>> products = new HashMap<>();

		// Lặp qua các sản phẩm được gửi từ form
		int index = 0;
		while (true) {
			String name = request.getParameter("product[" + index + "].name");
			String quantity = request.getParameter("product[" + index + "].quantity");
			String totalPrice = request.getParameter("product[" + index + "].totalPrice");

			if (name == null || quantity == null || totalPrice == null)
				break;

			products.put(name, Arrays.asList(Integer.parseInt(quantity), Integer.parseInt(totalPrice)));
			index++;
		}

		// Lấy tổng tiền Food & Beverage và tổng tiền chung
		String foodAndBeverageTotal = request.getParameter("foodAndBeverageTotal");
		String amountPayable = request.getParameter("amountPayable");

//	    // Lưu dữ liệu vào session
		session.setAttribute("products", products);
		session.setAttribute("foodAndBeverageTotal", foodAndBeverageTotal);
		session.setAttribute("amountPayable", amountPayable);

		// Chuyển hướng đến movieCheckout
		response.sendRedirect("userMovieCheckout");

	}
}