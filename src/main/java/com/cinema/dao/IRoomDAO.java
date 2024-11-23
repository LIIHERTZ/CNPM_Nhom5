package com.cinema.dao;
import com.cinema.entity.Room;
import java.util.List;
public interface IRoomDAO {
		
	 List<Room> getRoomsByCinemaId(int cinemaId);
	 List<Room> getAllRooms();
	 
	Boolean addRoom(Room room, int cinemaID);
	
    Room getRoomById(int id);
    boolean updateRoom(Room room);
    boolean deleteRoomById(int roomId);
    Room getRoomByNameAndCinemaId(String roomName, int cinemaID);
    
    List<Room> searchRoomsByScreenType(String screenType);
    List<Room> searchRoomsByScreenTypeAndCinemaId(String screenType, int cinemaId);
}
