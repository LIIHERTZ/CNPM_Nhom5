package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.ISeatDAO;
import com.cinema.dao.impl.SeatDAOImpl;
import com.cinema.entity.SeatStatus;
import com.cinema.services.ISeatService;

public class SeatServiceImpl implements ISeatService {
	
	ISeatDAO seatDao = new SeatDAOImpl();
			
	@Override
	public List<SeatStatus> getSeatStatusesByScreeningId(int screeningId) {
		return seatDao.getSeatStatusesByScreeningId(screeningId);
	}

	@Override
	public void updateSeatStatuses(String[] selectedSeats, int screeningId) {
		seatDao.updateSeatStatuses(selectedSeats, screeningId);
	}

}
