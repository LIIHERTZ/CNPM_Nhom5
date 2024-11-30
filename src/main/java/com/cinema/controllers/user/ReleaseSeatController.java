package com.cinema.controllers.user;

import com.cinema.entity.Person;
import com.cinema.entity.Seat;
import com.cinema.services.ISeatService;
import com.cinema.services.ISeatStatusService;
import com.cinema.services.impl.SeatServiceImpl;
import com.cinema.services.impl.SeatStatusServiceImpl;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/userReleaseSeat")
public class ReleaseSeatController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ISeatService seatService = new SeatServiceImpl();
    private final ISeatStatusService seatStatusService = new SeatStatusServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("person") != null) {

            Person person = (Person) session.getAttribute("person");

            if (!person.getRole().toLowerCase().contains("admin")) {
                String selectedSeats = request.getParameter("selectedSeats");
                String screeningId = request.getParameter("screeningId");

                // Log để kiểm tra xem dữ liệu có được truyền qua hay không
                System.out.println("Selected Seats: " + selectedSeats);
                System.out.println("Screening ID: " + screeningId);

                String[] seats = selectedSeats.split(",");
                for (String seat : seats) {
                    Seat tmp = seatService.findSeatIdBySeatNumberAndScreeningId(seat, Integer.parseInt(screeningId));
                    seatStatusService.updateSeatStatusesFalse(tmp.getSeatID(), Integer.parseInt(screeningId));
                }

                // Trả về phản hồi cho client (optional)
                response.getWriter().write("Success");
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/signin");
    }
}