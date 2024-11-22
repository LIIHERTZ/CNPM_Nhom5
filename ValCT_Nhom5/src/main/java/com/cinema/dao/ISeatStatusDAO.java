package com.cinema.dao;

import java.util.List;

import com.cinema.entity.SeatStatus;

public interface ISeatStatusDAO {

	boolean addSeatStatus(SeatStatus seatStatus);
    List<SeatStatus> getSeatStatusByScreeningId(int screeningID);
    boolean deleteSeatStatusByScreeningId(int screeningID);
	
}
