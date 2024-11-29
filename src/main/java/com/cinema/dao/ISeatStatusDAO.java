package com.cinema.dao;

import java.util.List;

import com.cinema.entity.SeatStatus;

public interface ISeatStatusDAO {

	boolean addSeatStatus(SeatStatus seatStatus);
    List<SeatStatus> getSeatStatusByScreeningId(int screeningID);
    boolean deleteSeatStatusByScreeningId(int screeningID);
	
    List<SeatStatus> getSeatStatusesByScreeningAndRoom(int msID, int roomID);

    void updateSeatStatusesTrue(int seatId, int screeningId);

    void updateSeatStatusesFalse(int seatId, int screeningId);

    void resetExpiredSeats();
}
