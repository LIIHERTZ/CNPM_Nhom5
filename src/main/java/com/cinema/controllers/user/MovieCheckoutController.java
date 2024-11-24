package com.cinema.controllers.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.hibernate.validator.constraints.URL;

import com.cinema.entity.Movie;
import com.cinema.entity.SeatStatus;
import com.cinema.services.IMovieService;
import com.cinema.services.ISeatService;
import com.cinema.services.impl.MoviceServiceImpl;
import com.cinema.services.impl.SeatServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/movieCheckout")
public class MovieCheckoutController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IMovieService movieService = new MoviceServiceImpl();
	private ISeatService seatService = new SeatServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

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
		
		
//		 // Lấy thông tin từ Session
	    Map<String, List<Integer>> products = (Map<String, List<Integer>>) session.getAttribute("products");
	    String foodAndBeverageTotal = (String) session.getAttribute("foodAndBeverageTotal");
	    String amountPayable = (String) session.getAttribute("amountPayable");
	    
	    
		
//		Map<String, List<Integer>> products = new HashMap<>();
//		products.put("Popcorn", Arrays.asList(2, 20000)); // 2 sản phẩm giá 20000
//		products.put("CocaCola", Arrays.asList(1, 15000)); // 1 sản phẩm giá 15000

        

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
			resp.sendRedirect("/ValCT_Nhom5/bookTickets");
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
		
		
		req.setAttribute("selectedSeats", selectedSeats);
		req.setAttribute("totalPrice", totalPrice);
		
		// Gán dữ liệu vào request để chuyển đến JSP
	    req.setAttribute("products", products);
	    req.setAttribute("foodAndBeverageTotal", foodAndBeverageTotal);
	    req.setAttribute("amountPayable", amountPayable);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/movie-checkout.jsp");
		rd.forward(req, resp);
	}

}
