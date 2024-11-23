package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Seat;

public interface ISeatDAO {

	
	 	boolean addSeat(Seat seat);
	    Seat getSeatById(int seatID);
	    List<Seat> getSeatsByRoomId(int roomID);
	    boolean deleteSeat(int seatID);
	
}
