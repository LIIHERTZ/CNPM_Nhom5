package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ITicketDAO;
import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.PopCornPayment;
import com.cinema.entity.Ticket;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class TicketDAOImpl implements ITicketDAO{
	@Override
	public List<PopCornPayment> getPopCornAndQuantityByPaymentId(int paymentId) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT pp "
					+ "FROM PopCornPayment pp "
					+ "JOIN pp.payment pay "
					+ "JOIN pay.ticketPayments tp "
					+ "WHERE tp.payment.paymentID = :paymentId";

			TypedQuery<PopCornPayment> query = em.createQuery(jpql, PopCornPayment.class);
			query.setParameter("paymentId", paymentId);

			List<PopCornPayment> result = query.getResultList();

			// Tính tổng giá tiền và gán vào thuộc tính price
			for (PopCornPayment pp : result) {
				double calculatedPrice = pp.getPopcorn().getPrice() * pp.getQuantity(); // Tính giá
				pp.getPopcorn().setPrice(calculatedPrice); // Gán lại giá trị cho thuộc tính price
			}

			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			em.close();
		}
	}



	@Override
	public List<TicketHistoryDTO> getPaginatedTicketHistory(int personId, int page, int pageSize) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			// Use GROUP_CONCAT to concatenate chair numbers for each PaymentId
			String jpql = "SELECT new com.cinema.dto.TicketHistoryDTO(" +
					"p.paymentID, " +
					"m.movieName, " +
					"c.cinemaName, " +
					"r.roomName, " +
					"t.chairNumber, " +
					"ms.startHour, " +
					"ms.endHour, " +
					"p.totalPrice" +
					")" +
					"FROM Ticket t " +
					"JOIN t.movieScreenings ms " +
					"JOIN ms.movie m " +
					"JOIN ms.room r " +
					"JOIN r.cinema c " +
					"JOIN t.ticketPayments tp " +
					"JOIN tp.payment p " +
					"WHERE p.person.perID = :personId " +
					"ORDER BY p.paymentID DESC";

			TypedQuery<TicketHistoryDTO> query = em.createQuery(jpql, TicketHistoryDTO.class);
			query.setParameter("personId", personId);
			query.setFirstResult(page * pageSize); // Offset
			query.setMaxResults(pageSize); // Limit
			return query.getResultList();
		} finally {
			em.close();
		}
	}
	
	




	@Override
	public int countTicketHistory(int personId) {
		EntityManager em = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT COUNT(t) "
	                + "FROM Ticket t "
	                + "JOIN t.movieScreenings ms "
	                + "JOIN ms.room r "
	                + "JOIN r.cinema c "
	                + "JOIN t.ticketPayments tp "
	                + "JOIN tp.payment p "
	                + "WHERE p.person.perID = :personId";

	        TypedQuery<Long> query = em.createQuery(jpql, Long.class);
	        query.setParameter("personId", personId);
	        return query.getSingleResult().intValue();
	    } finally {
	        em.close();
	    }
	}


	@Override
	public Ticket saveTicket(Ticket ticket) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;
		try {

			transaction = em.getTransaction();
			transaction.begin();
			em.persist(ticket);
			transaction.commit();
			return ticket;

		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback(); // Rollback nếu có lỗi
			}
			System.out.println(e);

		} finally {
			em.close();
		}
		return null;
	}
	
	
	@Override
	public List<TicketHistoryDTO> getTicketHistory(int personId) {
	    EntityManager em = JPAConfig.getEntityManager();
	    try {
	        // Cập nhật JPQL để lấy thêm trường movieID và không cần phân trang
	    	String jpql = "SELECT new com.cinema.dto.TicketHistoryDTO(" +
					"p.paymentID, " +
					"m.movieName, " +
					"c.cinemaName, " +
					"r.roomName, " +
					"t.chairNumber, " +
					"ms.startHour, " +
					"ms.endHour, " +
					"p.totalPrice" +
					")" +
					"FROM Ticket t " +
					"JOIN t.movieScreenings ms " +
					"JOIN ms.movie m " +
					"JOIN ms.room r " +
					"JOIN r.cinema c " +
					"JOIN t.ticketPayments tp " +
					"JOIN tp.payment p " +
					"WHERE p.person.perID = :personId " +
					"ORDER BY p.paymentID DESC";

	        TypedQuery<TicketHistoryDTO> query = em.createQuery(jpql, TicketHistoryDTO.class);
	        query.setParameter("personId", personId); // Thiết lập personId

	        return query.getResultList(); // Không cần phân trang
	    } finally {
	        em.close(); // Đảm bảo đóng EntityManager
	    }
	}
}
