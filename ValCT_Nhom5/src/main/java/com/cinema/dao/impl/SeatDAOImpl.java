package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatDAO;
import com.cinema.entity.SeatStatus;

import jakarta.persistence.EntityManager;
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

}
