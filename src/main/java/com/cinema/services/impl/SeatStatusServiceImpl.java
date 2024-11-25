package com.cinema.services.impl;

import com.cinema.services.ISeatStatusService;

import java.util.List;

import com.cinema.dao.*;
import com.cinema.dao.impl.*;
import com.cinema.entity.SeatStatus;

public class SeatStatusServiceImpl implements ISeatStatusService {
	
	ISeatStatusDAO seatStatusDAO = new SeatStatusDAOImpl();
	
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
}
