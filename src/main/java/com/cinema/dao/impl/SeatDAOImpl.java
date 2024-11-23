package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatDAO;
import com.cinema.entity.Seat;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

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
	
}
