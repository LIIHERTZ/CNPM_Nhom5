package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.ISeatDAO;
import com.cinema.dao.impl.SeatDAOImpl;
import com.cinema.entity.Seat;
import com.cinema.entity.SeatStatus;
import com.cinema.services.ISeatService;

public class SeatServiceImpl implements ISeatService  {
	
	ISeatDAO seatDao = new SeatDAOImpl();
	
	@Override
	public List<SeatStatus> getSeatStatusesByScreeningId(int screeningId) {
		return seatDao.getSeatStatusesByScreeningId(screeningId);
	}

	@Override
	public void updateSeatStatuses(String[] selectedSeats, int screeningId) {
		seatDao.updateSeatStatuses(selectedSeats, screeningId);
	}
	
	 @Override
	    public boolean addSeat(Seat seat) {
	        return seatDao.addSeat(seat);
	    }

	    @Override
	    public Seat getSeatById(int seatID) {
	        return seatDao.getSeatById(seatID);
	    }

	    @Override
	    public List<Seat> getSeatsByRoomId(int roomID) {
	        return seatDao.getSeatsByRoomId(roomID);
	    }

	    @Override
	    public boolean deleteSeat(int seatID) {
	        return seatDao.deleteSeat(seatID);
	    }



}
