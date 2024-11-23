package com.cinema.dao;

import java.util.List;

import com.cinema.entity.SeatStatus;

public interface ISeatDAO {
	List<SeatStatus> getSeatStatusesByScreeningId(int screeningId);
    void updateSeatStatuses(String[] selectedSeats, int screeningId);
}
