package com.cinema.controllers.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cinema.configs.PaymentConfig;
import com.cinema.entity.Movie;
import com.cinema.entity.Person;
import com.cinema.services.ICinemaService;
import com.cinema.services.IPaymentService;
import com.cinema.services.impl.CinemaServiceImpl;
import com.cinema.services.impl.PaymentServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/paymentReturn")
public class PaymentReturnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ICinemaService cinemaService = new CinemaServiceImpl();
	IPaymentService paymentService = new PaymentServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy tất cả các tham số từ URL
		Map<String, String> vnp_Params = new HashMap<>();
		req.getParameterMap().forEach((key, value) -> {
			vnp_Params.put(key, value[0]);
		});

		// Kiểm tra chữ ký hash (bảo mật)
		String vnp_SecureHash = vnp_Params.remove("vnp_SecureHash");
		String generatedHash = PaymentConfig.hashAllFields(vnp_Params); // Sử dụng hàm hashAllFields đã xây dựng trước
																		// đó
		// Kiểm tra mã phản hồi từ VNPay
		String responseCode = vnp_Params.get("vnp_ResponseCode");
		if ("00".equals(responseCode)) {
			// Thanh toán thành công
			String paymentId = vnp_Params.get("vnp_TxnRef");
			String transactionNo = vnp_Params.get("vnp_TransactionNo");
			String amount = vnp_Params.get("vnp_Amount");
			String payDate = vnp_Params.get("vnp_PayDate");

			HttpSession session = req.getSession();
			String screeningIdStr = (String) session.getAttribute("screeningId");
			String selectedLocation = (String) session.getAttribute("selectedLocation");
			String selectedDate = (String) session.getAttribute("selectedDate");
			String experience = (String) session.getAttribute("experience");
			String version = (String) session.getAttribute("version");
			String startHourStr = (String) session.getAttribute("startHour");
			Movie movie = (Movie) session.getAttribute("movie");
//			Person person = (Person) session.getAttribute("person");

			String selectedSeats = (String) session.getAttribute("selectedSeats");
			String totalPrice = (String) session.getAttribute("totalPrice");
			Person person = (Person) session.getAttribute("person");

			Map<String, List<Integer>> products = (Map<String, List<Integer>>) session.getAttribute("products");
			String foodAndBeverageTotal = (String) session.getAttribute("foodAndBeverageTotal");
			String amountPayable = (String) session.getAttribute("amountPayable");
			
			
			// SAVE DB
			//update ghe da dat
			try {
				paymentService.processPayment(screeningIdStr, selectedLocation, selectedDate, experience, 
						version, startHourStr, movie, selectedSeats, amountPayable, payDate, products, person);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// Chuyển hướng tới JSP hiển thị kết quả
			req.setAttribute("vnp_Params", vnp_Params);
			req.getRequestDispatcher("/views/user/payment-status.jsp").forward(req, resp);
		} else {
			// Thanh toán thất bại
			req.setAttribute("errorMessage", "Payment failed with Response Code: " + responseCode);
			req.getRequestDispatcher("/views/user/payment-status.jsp").forward(req, resp);
		}
	}

}
