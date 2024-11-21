package com.cinema.dao.impl;

import java.util.List;
import java.sql.Date;
import com.cinema.configs.JPAConfig;
import com.cinema.dao.IPaymentDAO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class PaymentDAOImpl implements IPaymentDAO{
	
	@Override
	public List<Object[]> getMovieStatisticsByDate(String dateValue,String dateType) {
		EntityManager em = JPAConfig.getEntityManager();
		String jpql ="";
		if("day".equals(dateType))
		{
			jpql ="SELECT m.movieName, SUM(t.priceTicket) AS tong,SUM(t.priceTicket - (t.priceTicket * (COALESCE(c.couponValue, 0) / 100))) as DoanhThu, COUNT(t.ticketID) AS SLVe "
					+ "FROM Payment p "
					+ "JOIN p.TicketPayments tp "
					+ "JOIN tp.ticket t "
					+ "JOIN t.movieScreenings ms "
					+ "JOIN ms.movie m "
					+"LEFT JOIN p.coupon c " 
					+ "WHERE t.date = :dateValue "
					+ "GROUP BY m.movieName";
		}
		else if("month".equals(dateType))
		{
			jpql = "SELECT m.movieName, SUM(t.priceTicket) AS tong, SUM(t.priceTicket - (t.priceTicket * (COALESCE(c.couponValue, 0) / 100))) as DoanhThu,COUNT(t.ticketID) AS SLVe "
					+ "FROM Payment p "
					+ "JOIN p.TicketPayments tp "
					+ "JOIN tp.ticket t "
					+ "JOIN t.movieScreenings ms "
					+ "JOIN ms.movie m "
					+"LEFT JOIN p.coupon c " 
					+ "WHERE FUNCTION('MONTH', t.date) = FUNCTION('MONTH', :dateValue) "
					+ "AND FUNCTION('YEAR', t.date) = FUNCTION('YEAR', :dateValue) "
					+ "GROUP BY m.movieName";
		}
		else
		{
			 jpql = "SELECT m.movieName, SUM(t.priceTicket) AS tong, SUM(t.priceTicket - (t.priceTicket * (COALESCE(c.couponValue, 0) / 100))) as DoanhThu,COUNT(t.ticketID) AS SLVe " +
                     "FROM Payment p " +
                     "JOIN p.TicketPayments tp " +
                     "JOIN tp.ticket t " +
                     "JOIN t.movieScreenings ms " +
                     "JOIN ms.movie m " +
                     "LEFT JOIN p.coupon c " +
                     "WHERE FUNCTION('YEAR', t.date) = FUNCTION('YEAR', :dateValue) " +
                     "GROUP BY m.movieName";
		}
        

        // Tạo truy vấn
        TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
        Date sqlDate = Date.valueOf(dateValue);
        query.setParameter("dateValue", sqlDate );

        // Thực thi truy vấn và trả về kết quả
        return query.getResultList();
    }
	
	@Override
	public List<Object[]> getPopCornStatisticsByDate(String dateValue,String dateType) {
		EntityManager em = JPAConfig.getEntityManager();
		String jpql ="";
		if("day".equals(dateType))
		{
			jpql ="SELECT pc.namePopCorn,SUM(pc.price * pp.quantity)  AS tong,SUM(pc.price * pp.quantity - (pc.price * pp.quantity * (COALESCE(c.couponValue, 0) / 100))) as DoanhThu ,COUNT(pc.popcornID) AS SL "
					+ "FROM Payment p "
					+ "JOIN p.PopCornPayments pp "
					+ "JOIN pp.popcorn pc "
					+"LEFT JOIN p.coupon c " 
					+ "WHERE p.createdDate = :dateValue "
					+ "GROUP BY pc.popcornID,pc.namePopCorn";
		}
		else if("month".equals(dateType))
		{
			jpql ="SELECT pc.namePopCorn,SUM(pc.price * pp.quantity)  AS tong,SUM(pc.price * pp.quantity - (pc.price * pp.quantity * (COALESCE(c.couponValue, 0) / 100))) as DoanhThu ,COUNT(pc.popcornID) AS SL "
					+ "FROM Payment p "
					+ "JOIN p.PopCornPayments pp "
					+ "JOIN pp.popcorn pc "
					+"LEFT JOIN p.coupon c " 
					+ "WHERE FUNCTION('MONTH', p.createdDate) = FUNCTION('MONTH', :dateValue) "
					+ "AND FUNCTION('YEAR',  p.createdDate) = FUNCTION('YEAR', :dateValue) "
					+ "GROUP BY pc.popcornID,pc.namePopCorn";
		}
		else
		{
			jpql ="SELECT pc.namePopCorn,SUM(pc.price * pp.quantity)  AS tong,SUM(pc.price * pp.quantity - (pc.price * pp.quantity * (COALESCE(c.couponValue, 0) / 100))) as DoanhThu ,COUNT(pc.popcornID) AS SL "
					+ "FROM Payment p "
					+ "JOIN p.PopCornPayments pp "
					+ "JOIN pp.popcorn pc "
					+"LEFT JOIN p.coupon c " 
					+ "WHERE  FUNCTION('YEAR',  p.createdDate) = FUNCTION('YEAR', :dateValue) "
					+ "GROUP BY pc.popcornID,pc.namePopCorn";
		}
        

        // Tạo truy vấn
        TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
        Date sqlDate = Date.valueOf(dateValue);
        query.setParameter("dateValue", sqlDate );
        // Thực thi truy vấn và trả về kết quả
        return query.getResultList();
    }
	
	
	public Double getCouponByPaymentID(String paymentID) {
		EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT c.couponValue FROM Payment p JOIN p.coupon  c WHERE p.paymentID = :paymentID ";
        Double count =0D;
   
        try {
        	TypedQuery<Double> query = em.createQuery(jpql, Double.class);
	        
	        if (paymentID != null && !paymentID.isEmpty())
	        {
	        	query.setParameter("paymentID",  paymentID);
	        }
	       
	        count = query.getSingleResult();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
        
        return count;
	}
}
