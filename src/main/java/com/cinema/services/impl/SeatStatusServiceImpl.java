package com.cinema.services.impl;

import com.cinema.services.ISeatService;
import com.cinema.services.ISeatStatusService;

import java.util.List;

import com.cinema.dao.*;
import com.cinema.dao.impl.*;
import com.cinema.entity.Seat;
import com.cinema.entity.SeatStatus;
import com.cinema.entity.Ticket;
import com.cinema.entity.TicketPayment;

public class SeatStatusServiceImpl implements ISeatStatusService {
	
	ISeatStatusDAO seatStatusDAO = new SeatStatusDAOImpl();
	ISeatService seatService = new SeatServiceImpl();	
	@Override
    public boolean addSeatStatus(SeatStatus seatStatus) {
        return seatStatusDAO.addSeatStatus(seatStatus);
    }

    @Override
    public List<SeatStatus> getSeatStatusByScreeningId(int screeningID) {
        return seatStatusDAO.getSeatStatusByScreeningId(screeningID);
    }

    @Override
    public boolean deleteSeatStatusByScreeningId(int screeningID) {
        return seatStatusDAO.deleteSeatStatusByScreeningId(screeningID);
    }

    @Override
    public List<SeatStatus> getSeatStatusesByScreeningAndRoom(int msID, int roomID) {
        return seatStatusDAO.getSeatStatusesByScreeningAndRoom(msID, roomID);
    }
    
    @Override
    public void updateSeatStatusTmp(String selectedSeats, String screeningId) {
    	// Lưu Ticket và TicketPayment
        String[] seats = selectedSeats.split(",");
        for (String seat : seats) {
            Seat tmp = seatService.findSeatIdBySeatNumberAndScreeningId(seat, Integer.parseInt(screeningId));
            seatService.updateSeatStatuses(Integer.toString(tmp.getSeatID()), Integer.parseInt(screeningId));
        }

    }
    
    
}
