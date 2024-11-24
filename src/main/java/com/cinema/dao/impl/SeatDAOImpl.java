package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatDAO;
import com.cinema.entity.Seat;
import com.cinema.entity.SeatStatus;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class SeatDAOImpl implements ISeatDAO {

	
	@Override
    public List<SeatStatus> getSeatStatusesByScreeningId(int screeningId) {
        EntityManager em = JPAConfig.getEntityManager();
        String query = "SELECT ss FROM SeatStatus ss JOIN FETCH ss.seat WHERE ss.screening.msID = :screeningId";
        TypedQuery<SeatStatus> typedQuery = em.createQuery(query, SeatStatus.class);
        typedQuery.setParameter("screeningId", screeningId);
        return typedQuery.getResultList();
    }

	@Override
	public void updateSeatStatuses(String[] selectedSeats, int screeningId) {
		EntityManager em = JPAConfig.getEntityManager();
        em.getTransaction().begin();

        for (String seatId : selectedSeats) {
            String query = "UPDATE SeatStatus ss SET ss.status = TRUE WHERE ss.seat.seatID = :seatId AND ss.screening.msID = :screeningId";
            em.createQuery(query)
              .setParameter("seatId", Integer.parseInt(seatId))
              .setParameter("screeningId", screeningId)
              .executeUpdate();
        }

        em.getTransaction().commit();
	}
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
