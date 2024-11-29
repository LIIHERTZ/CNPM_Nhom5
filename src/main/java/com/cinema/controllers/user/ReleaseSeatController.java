package com.cinema.controllers.user;

import com.cinema.entity.Seat;
import com.cinema.services.ISeatService;
import com.cinema.services.ISeatStatusService;
import com.cinema.services.impl.SeatServiceImpl;
import com.cinema.services.impl.SeatStatusServiceImpl;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/releaseSeat")
public class ReleaseSeatController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ISeatService seatService = new SeatServiceImpl();
    private final ISeatStatusService seatStatusService = new SeatStatusServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String selectedSeats = request.getParameter("selectedSeats");
        String screeningId = request.getParameter("screeningId");
        String[] seats = selectedSeats.split(",");
        for (String seat : seats) {
            Seat tmp = seatService.findSeatIdBySeatNumberAndScreeningId(seat, Integer.parseInt(screeningId));
            seatStatusService.updateSeatStatusesFalse(tmp.getSeatID(), Integer.parseInt(screeningId));
        }
    }

}