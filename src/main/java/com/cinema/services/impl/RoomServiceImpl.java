package com.cinema.services.impl;

import com.cinema.dao.IRoomDAO;
import com.cinema.dao.impl.RoomDAOImpl;
import com.cinema.entity.Room;
import com.cinema.services.IRoomService;
import java.util.List;


public class RoomServiceImpl implements IRoomService {

	
	  private IRoomDAO roomDAO;

	    public RoomServiceImpl() {
	        this.roomDAO = new RoomDAOImpl();
	    }

	    @Override
	    public List<Room> getRoomsByCinemaId(int cinemaId) {
	        return roomDAO.getRoomsByCinemaId(cinemaId);
	    }

	    @Override
	    public List<Room> getAllRooms() {
	        return roomDAO.getAllRooms();
	    }

		@Override
		public Boolean addRoom(Room room, int cinemaID) {
			return roomDAO.addRoom(room,cinemaID);
		}

		@Override
		public Room getRoomById(int id) {
			return roomDAO.getRoomById(id);
		}
		
		 @Override
		    public boolean updateRoom(Room room) {
		        return roomDAO.updateRoom(room);
		    }
		 @Override
		 public boolean deleteRoomById(int roomId) {
		     return roomDAO.deleteRoomById(roomId);
		 }
		 @Override
		    public Room getRoomByNameAndCinemaId(String roomName, int cinemaID) {
		        return roomDAO.getRoomByNameAndCinemaId(roomName, cinemaID);
		    }

		@Override
		public List<Room> searchRoomsByScreenType(String screenType) {
			return roomDAO.searchRoomsByScreenType(screenType);
		}

		@Override
		public List<Room> searchRoomsByScreenTypeAndCinemaId(String screenType, int cinemaId) {
			return roomDAO.searchRoomsByScreenTypeAndCinemaId(screenType, cinemaId);
		}
}
