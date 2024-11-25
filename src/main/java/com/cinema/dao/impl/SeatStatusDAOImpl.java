package com.cinema.dao.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatStatusDAO;

import com.cinema.entity.SeatStatus;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

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
    
    public List<SeatStatus> getSeatStatusesByScreeningAndRoom(int screeningId, int roomId) {
        EntityManager em = JPAConfig.getEntityManager();
        List<SeatStatus> seatStatuses = null;
        try {
            // Tạo truy vấn với TypedQuery để lấy các SeatStatus
            TypedQuery<SeatStatus> query = em.createQuery(
                "SELECT ss FROM SeatStatus ss " +
                "WHERE ss.screening.msID = :screeningId AND ss.seat.room.roomID = :roomId", 
                SeatStatus.class
            );
            // Set các tham số vào truy vấn
            query.setParameter("screeningId", screeningId);
            query.setParameter("roomId", roomId);

            // Lấy kết quả từ truy vấn
            seatStatuses = query.getResultList();
        } catch (Exception e) {
            System.err.println("Error loading seat statuses: " + e.getMessage());
        } finally {
            em.close(); // Đảm bảo đóng EntityManager để giải phóng tài nguyên
        }
        return seatStatuses;
    }

	
}
