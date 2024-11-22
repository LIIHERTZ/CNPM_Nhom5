package com.cinema.dao.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatStatusDAO;

import com.cinema.entity.SeatStatus;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class SeatStatusDAOImpl implements ISeatStatusDAO {

	@Override
    public boolean addSeatStatus(SeatStatus seatStatus) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(seatStatus);
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
    public List<SeatStatus> getSeatStatusByScreeningId(int screeningID) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT ss FROM SeatStatus ss WHERE ss.screening.msID = :screeningID";
            return em.createQuery(jpql, SeatStatus.class)
                    .setParameter("screeningID", screeningID)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean deleteSeatStatusByScreeningId(int screeningID) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            String jpql = "DELETE FROM SeatStatus ss WHERE ss.screening.msID = :screeningID";
            int deletedCount = em.createQuery(jpql)
                    .setParameter("screeningID", screeningID)
                    .executeUpdate();
            transaction.commit();
            return deletedCount > 0;
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
