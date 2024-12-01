package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatDAO;
import com.cinema.entity.Seat;

import com.cinema.entity.SeatStatus;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

public class SeatDAOImpl implements ISeatDAO {

	
	 @Override
	    public boolean addSeat(Seat seat) {
	        EntityManager em = JPAConfig.getEntityManager();
	        EntityTransaction transaction = em.getTransaction();
	        try {
	            transaction.begin();
	            em.persist(seat);
	            transaction.commit();
	            return true;
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
	    public Seat getSeatById(int seatID) {
	        EntityManager em = JPAConfig.getEntityManager();
	        try {
	            return em.find(Seat.class, seatID);
	        } finally {
	            em.close();
	        }
	    }

	    @Override
	    public List<Seat> getSeatsByRoomId(int roomID) {
	        EntityManager em = JPAConfig.getEntityManager();
	        try {
	            String jpql = "SELECT s FROM Seat s WHERE s.room.roomID = :roomID";
	            return em.createQuery(jpql, Seat.class)
	                    .setParameter("roomID", roomID)
	                    .getResultList();
	        } finally {
	            em.close();
	        }
	    }

	    @Override
	    public boolean deleteSeat(int seatID) {
	        EntityManager em = JPAConfig.getEntityManager();
	        EntityTransaction transaction = em.getTransaction();
	        try {
	            transaction.begin();
	            Seat seat = em.find(Seat.class, seatID);
	            if (seat != null) {
	                em.remove(seat);
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
    public List<SeatStatus> getSeatStatusesByScreeningId(int screeningId) {
        EntityManager em = JPAConfig.getEntityManager();
        String query = "SELECT ss FROM SeatStatus ss JOIN FETCH ss.seat WHERE ss.screening.msID = :screeningId";
        TypedQuery<SeatStatus> typedQuery = em.createQuery(query, SeatStatus.class);
        typedQuery.setParameter("screeningId", screeningId);
        return typedQuery.getResultList();
    }



    @Override
    public Seat findSeatIdBySeatNumberAndScreeningId(String seatNumber, int screeningId) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT s " +
                "FROM Seat s " +
                "JOIN SeatStatus ss ON s.seatID = ss.seat.id " +
                "WHERE s.seatNumber = :seatNumber AND ss.screening.id = :screeningId";
        Query query = em.createQuery(jpql);
        query.setParameter("seatNumber", seatNumber);
        query.setParameter("screeningId", screeningId);

        try {
            Seat result = (Seat) query.getSingleResult();
            return result;
        } catch (Exception e) {
            // Handle no result or multiple result exceptions
            e.printStackTrace();
            return null;
        }
    }
	
}
