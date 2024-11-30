package com.cinema.services.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.*;
import com.cinema.dao.impl.*;
import com.cinema.entity.*;
import com.cinema.services.*;
import jakarta.persistence.EntityManager;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class PaymentServiceImpl implements IPaymentService{
    private IPaymentDAO paymentDAO = new PaymentDAOImpl();
    private ITicketDAO ticketDAO = new TicketDAOImpl();
    private IPopcornPaymentDAO popcornPaymentDAO = new PopcornPaymentDAOImpl();
    private IMovieScreeningsDAO movieScreeningsDAO = new MovieScreeningsDAOImpl();
    private IPopCornDAO popcornDAO = new PopCornDAOImpl();
    private ITicketPaymentService ticketPaymentService = new TicketPaymentServiceImpl();
    private ISeatService seatService = new SeatServiceImpl();
    private ISeatStatusService seatStatusService = new SeatStatusServiceImpl();
    private ICouponService couponService = new CouponServiceImpl();

	@Override
	public void processPayment(String screeningId, String selectedLocation, String selectedDate, String experience,
			String version, String startHour, Movie movie, String selectedSeats, String totalPrice, String couponId, String payDate,
			Map<String, List<Integer>> products, Person person) throws Exception {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin(); // Bắt đầu giao dịch
            // Lấy thông tin MovieScreenings
            MovieScreenings movieScreening = movieScreeningsDAO.findById(Integer.parseInt(screeningId));
            Date date = new SimpleDateFormat("yyyyMMddHHmmss").parse(payDate);
            Coupon coupon = couponService.getOneCoupon(Integer.parseInt(couponId));
            // Lưu Payment
            Payment payment = new Payment();
            payment.setCoupon(coupon);
            payment.setCreatedDate(date);
            payment.setStatus(1);
            payment.setTotalPrice(Double.parseDouble(totalPrice));
            payment.setPerson(person);
            paymentDAO.savePayment(payment); // Lưu vào DB

            // Lưu Ticket và TicketPayment
            String[] seats = selectedSeats.split(",");

            for (String seat : seats) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date date1 = sdf.parse(selectedDate);
                Ticket ticket = new Ticket();
                ticket.setChairNumber(seat);
                ticket.setDate(date1); // `selectedDate` đã đúng định dạng
                ticket.setPlaceName(selectedLocation);
                ticket.setPriceTicket(Double.parseDouble(totalPrice) / seats.length);
                ticket.setVersionName(version);
                ticket.setMovieScreenings(movieScreening);
                Seat tmp = seatService.findSeatIdBySeatNumberAndScreeningId(seat, Integer.parseInt(screeningId));
                seatStatusService.updateSeatStatusesTrue(tmp.getSeatID(), Integer.parseInt(screeningId));
                if (tmp.isCouple()) {
                    ticket.setPriceTicket(150000);
                }
                else {
                    ticket.setPriceTicket(90000);
                }
                Ticket savedTicket = ticketDAO.saveTicket(ticket); // Lưu Ticket
                if (savedTicket == null) {
                    throw new RuntimeException("Không lưu được Ticket cho ghế: " + seat);
                }

                TicketPayment ticketPayment = new TicketPayment();
                ticketPayment.setTicket(savedTicket);
                ticketPayment.setPayment(payment);
                ticketPaymentService.saveTicketPayment(ticketPayment); // Lưu TicketPayment
            }

            // Lưu PopcornPayment nếu có sản phẩm
            if (products != null) {
                for (Map.Entry<String, List<Integer>> entry : products.entrySet()) {
                    String productName = entry.getKey();
                    PopCorn popCorn = popcornDAO.findByName(productName);
                    if (popCorn == null) {
                        throw new IllegalArgumentException("Không tìm thấy PopCorn với tên: " + productName);
                    }

                    List<Integer> productDetails = entry.getValue();
                    if (productDetails.size() >= 2) {
                        int quantity = productDetails.get(0);
                        int price = productDetails.get(1);

                        PopCornPayment popcornPayment = new PopCornPayment();
                        popcornPayment.setQuantity(quantity);
                        popcornPayment.setPopcorn(popCorn);
                        popcornPayment.setPayment(payment);
                        popcornPaymentDAO.savePopcornPayment(popcornPayment); // Lưu PopCornPayment
                    } else {
                        throw new IllegalArgumentException("Chi tiết sản phẩm không hợp lệ cho " + productName);
                    }
                }
            }

            em.getTransaction().commit(); // Commit giao dịch
        } catch (Exception e) {
            em.getTransaction().rollback(); // Rollback nếu có lỗi
            throw e;
        } finally {
            em.close(); // Đóng EntityManager
        }
    }
    @Override
    public List<Object[]> getMovieStatisticsByDate(String dateValue,String dateType){
        return paymentDAO.getMovieStatisticsByDate(dateValue, dateType);
    }
    @Override
    public List<Object[]> getPopCornStatisticsByDate(String dateValue,String dateType){
        return paymentDAO.getPopCornStatisticsByDate(dateValue, dateType);
    }

    @Override
    public List<Object[]> getCinemaRevenuesByMovieID(String movieID){
        return paymentDAO.getCinemaRevenuesByMovieID(movieID);
    }
    @Override
    public List<Object[]> getCustomerAmountAllCinema(){
        return paymentDAO.getCustomerAmountAllCinema();
    }
}
