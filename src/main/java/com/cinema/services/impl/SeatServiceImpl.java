package com.cinema.services.impl;

import java.util.List;

import com.cinema.entity.Seat;
import com.cinema.services.ISeatService;
import com.cinema.dao.*;
import com.cinema.dao.impl.SeatDAOImpl;

public class SeatServiceImpl implements ISeatService  {
	
	 ISeatDAO seatDAO = new SeatDAOImpl();
	
	 @Override
	    public boolean addSeat(Seat seat) {
	        return seatDAO.addSeat(seat);
	    }

	    @Override
	    public Seat getSeatById(int seatID) {
	        return seatDAO.getSeatById(seatID);
	    }

	    @Override
	    public List<Seat> getSeatsByRoomId(int roomID) {
	        return seatDAO.getSeatsByRoomId(roomID);
	    }

	    @Override
	    public boolean deleteSeat(int seatID) {
	        return seatDAO.deleteSeat(seatID);
	    }

}
