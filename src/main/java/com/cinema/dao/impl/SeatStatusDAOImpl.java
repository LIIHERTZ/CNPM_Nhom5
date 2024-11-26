package com.cinema.dao.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ISeatStatusDAO;

import com.cinema.entity.SeatStatus;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.time.LocalDateTime;
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

    @Override
    public void updateSeatStatusesTrue(int seatId, int screeningId) {
        EntityManager em = JPAConfig.getEntityManager();
        em.getTransaction().begin();
        String query = "UPDATE SeatStatus ss SET ss.status = TRUE, ss.bookingTime = :bookingTime WHERE ss.seat.seatID = :seatId AND ss.screening.msID = :screeningId";
        em.createQuery(query)
                .setParameter("seatId", seatId)
                .setParameter("screeningId", screeningId)
                .setParameter("bookingTime", LocalDateTime.now())
                .executeUpdate();
        em.getTransaction().commit();
    }

    @Override
    public void updateSeatStatusesFalse(int seatId, int screeningId) {
        EntityManager em = JPAConfig.getEntityManager();
        em.getTransaction().begin();
        String query = "UPDATE SeatStatus ss SET ss.status = FALSE, ss.bookingTime = :bookingTime WHERE ss.seat.seatID = :seatId AND ss.screening.msID = :screeningId";
        em.createQuery(query)
                .setParameter("seatId", seatId)
                .setParameter("screeningId", screeningId)
                .setParameter("bookingTime", null)
                .executeUpdate();
        em.getTransaction().commit();
    }

    @Override
    public void resetExpiredSeats() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();

            // Tìm các ghế đã đặt nhưng hết hạn (quá 5 phút) và không liên quan đến TicketPayment
            List<SeatStatus> expiredSeats = em.createQuery(
                            "SELECT s FROM SeatStatus s " +
                                    "WHERE s.status = true " +
                                    "AND s.bookingTime < :expirationTime " +
                                    "AND NOT EXISTS (" +
                                    "   SELECT tp FROM TicketPayment tp " +
                                    "   JOIN tp.ticket t " +
                                    "   WHERE t.movieScreenings.msID = s.screening.msID " +  // Liên kết qua MovieScreenings
                                    "   AND t.chairNumber = s.seat.seatNumber" +  // Ghế phải khớp số ghế
                                    ")", SeatStatus.class)
                    .setParameter("expirationTime", LocalDateTime.now().minusMinutes(5))
                    .getResultList();

            // Reset trạng thái ghế
            for (SeatStatus seat : expiredSeats) {
                seat.setStatus(false); // Trả lại trạng thái
                seat.setBookingTime(null); // Xóa thời gian đặt
                em.merge(seat); // Lưu lại trạng thái ghế
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
        } finally {
            em.close();
        }
    }
}
