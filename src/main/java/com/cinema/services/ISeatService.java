package com.cinema.services;

import java.util.List;

import com.cinema.entity.Seat;
import com.cinema.entity.SeatStatus;

public interface ISeatService {

	List<SeatStatus> getSeatStatusesByScreeningId(int screeningId);
    void updateSeatStatuses(String[] selectedSeats, int screeningId);
    boolean addSeat(Seat seat);
    Seat getSeatById(int seatID);
    List<Seat> getSeatsByRoomId(int roomID);
    boolean deleteSeat(int seatID);
}
