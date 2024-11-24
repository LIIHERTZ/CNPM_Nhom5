package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatDAO;
import com.cinema.entity.Person;
import com.cinema.entity.Seat;
import com.cinema.entity.SeatStatus;

import jakarta.persistence.*;

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
    public void updateSeatStatuses(String selectedSeats, int screeningId) {
        EntityManager em = JPAConfig.getEntityManager();
        em.getTransaction().begin();
        String query = "UPDATE SeatStatus ss SET ss.status = TRUE WHERE ss.seat.seatID = :seatId AND ss.screening.msID = :screeningId";
        em.createQuery(query)
                .setParameter("seatId", Integer.parseInt(selectedSeats))
                .setParameter("screeningId", screeningId)
                .executeUpdate();
        em.getTransaction().commit();
    }

    @Override
    public Integer findSeatIdBySeatNumberAndScreeningId(String seatNumber, int screeningId) {
        EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT s.seatID " +
                "FROM Seat s " +
                "JOIN SeatStatus ss ON s.seatID = ss.seat.id " +
                "WHERE s.seatNumber = :seatNumber AND ss.screening.id = :screeningId";
        Query query = em.createQuery(jpql);
        query.setParameter("seatNumber", seatNumber);
        query.setParameter("screeningId", screeningId);

        try {
            return (Integer) query.getSingleResult();
        } catch (Exception e) {
            // Handle no result or multiple result exceptions
            e.printStackTrace();
            return null;
        }
    }

}
