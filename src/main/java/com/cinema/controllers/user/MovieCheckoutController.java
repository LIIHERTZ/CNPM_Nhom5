package com.cinema.controllers.user;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.stream.Collectors;

import com.cinema.configs.PaymentConfig;
import com.cinema.entity.Coupon;
import com.cinema.entity.Movie;
import com.cinema.entity.Person;
import com.cinema.entity.SeatStatus;
import com.cinema.services.ICouponService;
import com.cinema.services.ISeatService;
import com.cinema.services.impl.CouponServiceImpl;
import com.cinema.services.impl.SeatServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/userMovieCheckout")
public class MovieCheckoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;

    private ICouponService couponService = new CouponServiceImpl();
	private ISeatService seatService = new SeatServiceImpl();
	
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


//		 // Lấy thông tin từ Session
                Map<String, List<Integer>> products = (Map<String, List<Integer>>) session.getAttribute("products");
                String foodAndBeverageTotal = (String) session.getAttribute("foodAndBeverageTotal");
                String amountPayable = (String) session.getAttribute("amountPayable");

                //lay danh sach coupon
                List<Coupon> coupons = couponService.getAllCouponsValid();
                // Gán thông tin vào request để truyền tới JSP

                req.setAttribute("coupons", coupons);


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
                return;
            }
        }
        resp.sendRedirect(req.getContextPath() + "/signin");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String vnp_OrderInfo = "Thanh toan ve xem phim";
            String orderType = "billpayment";
            String vnp_TxnRef = PaymentConfig.getRandomNumber(8);
            String vnp_IpAddr = PaymentConfig.getIpAddress(req);
            String vnp_TmnCode = PaymentConfig.vnp_TmnCode;
            HttpSession session = req.getSession();
            String price = req.getParameter("amountPayable");
            session.setAttribute("amountPayable", price);
            String couponId = req.getParameter("selectedCouponId");
            session.setAttribute("selectedCouponId", couponId);

            int amount = Integer.parseInt(price) * 100;
            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");
            vnp_Params.put("vnp_BankCode", "NCB");
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
            vnp_Params.put("vnp_OrderType", orderType);
            vnp_Params.put("vnp_Locale", "vn");
            vnp_Params.put("vnp_ReturnUrl", PaymentConfig.vnp_ReturnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
    
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
    
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            //Add Params of 2.1.0 Version
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
            //Build data to hash and querystring
            List fieldNames = new ArrayList(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = (String) itr.next();
                String fieldValue = (String) vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = PaymentConfig.hmacSHA512(PaymentConfig.secretKey, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = PaymentConfig.vnp_PayUrl + "?" + queryUrl;
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
//            resp.getWriter().write(gson.toJson(job));
            resp.sendRedirect(paymentUrl);
	}
}
