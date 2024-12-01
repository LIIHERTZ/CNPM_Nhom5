package com.cinema.dao.impl;

	import com.cinema.configs.JPAConfig;
	import com.cinema.dao.IRoomDAO;
import com.cinema.entity.Cinema;
import com.cinema.entity.Room;

	import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

	import java.util.ArrayList;
	import java.util.List;

public class RoomDAOImpl implements IRoomDAO {

	@Override
	public List<Room> getRoomsByCinemaId(int cinemaId) {
	    EntityManager em = JPAConfig.getEntityManager();
	    List<Room> rooms = new ArrayList<>();
	    
	    try {
	        // Câu truy vấn JPQL với cinemaId từ đối tượng Cinema
	        String jpql = "SELECT r FROM Room r WHERE r.cinema.cinemaID = :cinemaId";
	        TypedQuery<Room> query = em.createQuery(jpql, Room.class);
	        query.setParameter("cinemaId", cinemaId);
	        
	        // Lấy kết quả trả về
	        rooms = query.getResultList();
	    } catch (Exception e) {
	        System.err.println("Error retrieving rooms by cinema ID: " + e.getMessage());
	    } finally {
	        em.close();
	    }

	    return rooms;
	}

		@Override
		public List<Room> getAllRooms() {
			 EntityManager em = JPAConfig.getEntityManager();
		        List<Room> rooms = new ArrayList<>();
		        
		        try {
		            String jpql = "SELECT r FROM Room r";
		            TypedQuery<Room> query = em.createQuery(jpql, Room.class);
		            rooms = query.getResultList();
		        } catch (Exception e) {
		            System.err.println("Error retrieving all rooms: " + e.getMessage());
		        } finally {
		            em.close();
		        }

		        return rooms;
		    }

		public Boolean addRoom(Room room, int cinemaID) {
		    EntityManager em = JPAConfig.getEntityManager();
		    try {
		        // Bắt đầu giao dịch
		        em.getTransaction().begin();
		        
		        // Tìm Cinema dựa trên ID
		        Cinema cinema = em.find(Cinema.class, cinemaID);

		        if (cinema == null) {
		            System.err.println("Cinema with ID '" + cinemaID + "' not found.");
		            return false;
		        }

		        // Liên kết Room với Cinema
		        room.setCinema(cinema);

		        // Lưu Room vào cơ sở dữ liệu
		        em.persist(room);

		        // Commit giao dịch
		        em.getTransaction().commit();
		        return true;
		    } catch (Exception e) {
		        // Rollback nếu có lỗi
		        em.getTransaction().rollback();
		        System.err.println("Error adding room: " + e.getMessage());
		    } finally {
		        // Đóng EntityManager
		        em.close();
		    }
		    return false;
		}

		@Override
		public Room getRoomById(int roomID) {
		    EntityManager em = JPAConfig.getEntityManager();
		    try {
		        // Truy vấn phòng dựa vào roomID
		        return em.find(Room.class, roomID);
		    } catch (Exception e) {
		        System.err.println("Error retrieving room by ID: " + e.getMessage());
		        return null;
		    } finally {
		        em.close();
		    }
		}


		@Override
	    public boolean updateRoom(Room room) {
	        EntityManager em = JPAConfig.getEntityManager();
	        EntityTransaction transaction = null;
	        boolean isUpdated = false;

	        try {
	            transaction = em.getTransaction();
	            transaction.begin();

	            // Tìm Room hiện tại trong cơ sở dữ liệu
	            Room existingRoom = em.find(Room.class, room.getRoomID());
	            if (existingRoom != null) {
	                // Cập nhật các trường của Room
	                existingRoom.setRoomName(room.getRoomName());
	                existingRoom.setScreenType(room.getScreenType());
	                existingRoom.setChairNumber(room.getChairNumber());
	                existingRoom.setStatus(room.isStatus());
	                existingRoom.setCinema(room.getCinema()); // Gán cinema mới nếu cần

	                // Merge để lưu thay đổi
	                em.merge(existingRoom);
	                isUpdated = true;
	            }

	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            System.err.println("Error updating room: " + e.getMessage());
	        } finally {
	            em.close();
	        }

	        return isUpdated;
	    }
		
		@Override
		public boolean deleteRoomById(int roomId) {
		    EntityManager em = JPAConfig.getEntityManager();
		    EntityTransaction transaction = em.getTransaction();
		    try {
		        transaction.begin();

		        // Tìm Room bằng roomID
		        Room room = em.find(Room.class, roomId);
		        if (room != null) {
		            // Xóa Room (JPA sẽ tự động xóa Seat và MovieScreenings liên quan)
		            em.remove(room);
		            transaction.commit();
		            return true;
		        }
		        return false;
		    } catch (Exception e) {
		        if (transaction.isActive()) {
		            transaction.rollback();
		        }
		        e.printStackTrace();
		        return false;
		    } finally {
		        em.close();
		    }
		}

		
		
		 @Override
		    public Room getRoomByNameAndCinemaId(String roomName, int cinemaID) {
		        EntityManager em = JPAConfig.getEntityManager();
		        try {
		            // Câu truy vấn JPQL để lấy phòng dựa trên tên và cinemaID
		            String jpql = "SELECT r FROM Room r WHERE r.roomName = :roomName AND r.cinema.cinemaID = :cinemaID";
		            TypedQuery<Room> query = em.createQuery(jpql, Room.class);
		            query.setParameter("roomName", roomName);
		            query.setParameter("cinemaID", cinemaID);

		            return query.getSingleResult(); // Trả về phòng đầu tiên tìm thấy
		        } catch (Exception e) {
		            e.printStackTrace();
		            return null; // Nếu không tìm thấy hoặc có lỗi, trả về null
		        } finally {
		            em.close();
		        }
		    }
		 
		 @Override
		 public List<Room> searchRoomsByScreenType(String screenType) {
			    EntityManager em = JPAConfig.getEntityManager();
			    try {
			        String jpql = "SELECT r FROM Room r WHERE r.screenType = :screenType";
			        return em.createQuery(jpql, Room.class)
			                .setParameter("screenType", screenType)
			                .getResultList();
			    } finally {
			        em.close();
			    }
			}
		 
		 @Override
		 public List<Room> searchRoomsByScreenTypeAndCinemaId(String screenType, int cinemaId) 
		 {
			    EntityManager em = JPAConfig.getEntityManager();
			    try {
			        String jpql = "SELECT r FROM Room r WHERE r.cinema.cinemaID = :cinemaId AND r.screenType = :screenType";
			        return em.createQuery(jpql, Room.class)
			                 .setParameter("cinemaId", cinemaId)
			                 .setParameter("screenType", screenType)
			                 .getResultList();
			    } finally {
			        em.close();
			    }

		 
		

		}
}

		

