package com.cinema.services;

import java.util.List;

import com.cinema.entity.SeatStatus;

public interface ISeatStatusService {

	boolean addSeatStatus(SeatStatus seatStatus);
    List<SeatStatus> getSeatStatusByScreeningId(int screeningID);
    boolean deleteSeatStatusByScreeningId(int screeningID);
	
    List<SeatStatus> getSeatStatusesByScreeningAndRoom(int msID, int roomID);

}
