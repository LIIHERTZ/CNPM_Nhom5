package com.cinema.controllers.admin;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.cinema.entity.Cinema;
import com.cinema.entity.MovieScreenings;
import com.cinema.entity.*;
import com.cinema.entity.SeatStatus;
import com.cinema.services.*;
import com.cinema.services.impl.*;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/admin/seatrooms" })
public class SeatController  extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	//private IMovieScreeningsService movieScreeningService = new MovieScreeningsServiceImpl();
    private ISeatStatusService seatStatusService = new SeatStatusServiceImpl();
    
 	private IMovieScreeningsService movieScreeningService = new MovieScreeningsServiceImpl();
    private IRoomService roomService = new RoomServiceImpl();
    private IMovieService movieService = new MovieServiceImpl();
    ICinemaService cinemaService = new CinemaServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("person") != null) {
            Person person = (Person) session.getAttribute("person");

            if (person.getRole().toLowerCase().contains("admin")) {
                String action = req.getServletPath();
                switch (action) {
                    case "/admin/seatrooms":
                        System.out.println("msID: " + req.getParameter("msID"));
                        System.out.println("roomID: " + req.getParameter("roomID"));
                        System.out.println("cinemaId: " + req.getParameter("cinemaId"));
                        viewSeatRoom(req, resp);
                        break;
                    default:
                        resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                return;
            }
        }
        resp.sendRedirect(req.getContextPath() + "/signin");
    }


//    private void viewSeatRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//            int msID = Integer.parseInt(req.getParameter("msID"));
//            int roomID = Integer.parseInt(req.getParameter("roomID"));
//            int cinemaID = Integer.parseInt(req.getParameter("cinemaId"));
//            
//            // Lấy thông tin về screening, room và cinema
//            MovieScreenings screening = movieScreeningService.getMovieScreeningById(msID);
//            Room room = roomService.getRoomById(roomID);
//            Cinema cinema = cinemaService.getCinemaById(cinemaID);
//
//            // Gọi service để lấy danh sách trạng thái ghế
//            List<SeatStatus> seatStatuses = seatStatusService.getSeatStatusesByScreeningAndRoom(msID, roomID);
//            System.out.println("Found seatStatuses: " + (seatStatuses != null ? seatStatuses.size() : 0));
//
//            // Kiểm tra nếu danh sách ghế rỗng
//            if (seatStatuses == null || seatStatuses.isEmpty()) {
//                throw new RuntimeException("No seat statuses found for msID: " + msID + " and roomID: " + roomID);
//            }
//
//            // Nhóm ghế theo hàng (A, B, C, ...)
//            Map<String, List<SeatStatus>> seatStatusesGroupedByRow = seatStatuses.stream()
//                    .collect(Collectors.groupingBy(seatStatus -> seatStatus.getSeat().getSeatNumber().substring(0, 1)));
//
//            System.out.println("Grouped by row: " + seatStatusesGroupedByRow.keySet());
//
//            // Gửi dữ liệu tới JSP
//            req.setAttribute("seatStatusesGroupedByRow", seatStatusesGroupedByRow);
//            req.setAttribute("msID", msID);
//            req.setAttribute("roomID", roomID);
//            req.setAttribute("cinemaID", cinemaID);
//         // Truyền dữ liệu vào model (req.setAttribute)
//            req.setAttribute("screening", screening);
//            req.setAttribute("room", room);
//            req.setAttribute("cinema", cinema);
//
//            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/ManageUserSeat.jsp");
//            rd.forward(req, resp);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading seat room data: " + e.getMessage());
//        }
//    }
    
    private void viewSeatRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int msID = Integer.parseInt(req.getParameter("msID"));
            int roomID = Integer.parseInt(req.getParameter("roomID"));
            int cinemaID = Integer.parseInt(req.getParameter("cinemaId"));
            
            // Lấy thông tin về screening, room và cinema
            MovieScreenings screening = movieScreeningService.getMovieScreeningById(msID);
            Room room = roomService.getRoomById(roomID);
            Cinema cinema = cinemaService.getCinemaById(cinemaID);

            // Gọi service để lấy danh sách trạng thái ghế
            List<SeatStatus> seatStatuses = seatStatusService.getSeatStatusesByScreeningAndRoom(msID, roomID);
            System.out.println("Found seatStatuses: " + (seatStatuses != null ? seatStatuses.size() : 0));

            // Kiểm tra nếu danh sách ghế rỗng
            if (seatStatuses == null || seatStatuses.isEmpty()) {
                throw new RuntimeException("No seat statuses found for msID: " + msID + " and roomID: " + roomID);
            }
            
         // Đếm số ghế chưa được đặt
            long availableSeats = seatStatuses.stream()
                    .filter(seatStatus -> !seatStatus.isStatus()) // Trạng thái false (chưa đặt)
                    .count();

            // Nhóm ghế theo hàng (A, B, C, ...)
            Map<String, List<SeatStatus>> seatStatusesGroupedByRow = seatStatuses.stream()
                    .collect(Collectors.groupingBy(seatStatus -> seatStatus.getSeat().getSeatNumber().substring(0, 1)));

            System.out.println("Grouped by row: " + seatStatusesGroupedByRow.keySet());

            // Tạo Map để lưu seat_id và isCouple (dạng int)
            Map<Integer, Integer> seatCoupleMap = new HashMap<>();
            for (SeatStatus seatStatus : seatStatuses) {
                int isCoupleValue = seatStatus.getSeat().isCouple() ? 1 : 0; // Chuyển từ boolean sang int
                seatCoupleMap.put(seatStatus.getSeat().getSeatID(), isCoupleValue);
            }

            // Gửi dữ liệu tới JSP
            req.setAttribute("seatStatusesGroupedByRow", seatStatusesGroupedByRow);
            req.setAttribute("seatCoupleMap", seatCoupleMap); // Truyền Map vào JSP
            req.setAttribute("msID", msID);
            req.setAttribute("roomID", roomID);
            req.setAttribute("cinemaID", cinemaID);
            req.setAttribute("screening", screening);
            req.setAttribute("room", room);
            req.setAttribute("cinema", cinema);
         // Truyền số ghế chưa đặt vào JSP
            req.setAttribute("availableSeats", availableSeats);

            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/ManageUserSeat.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading seat room data: " + e.getMessage());
        }
    }




}
