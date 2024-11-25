package com.cinema.dao.impl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ICouponDAO;
import com.cinema.entity.Coupon;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class CouponDAOImpl implements ICouponDAO{

	@Override
	public long countTotalCoupons(String searchValue) {
		EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(u) FROM Coupon u  ";
        Long count = 0L;
        if (searchValue != null && !searchValue.isEmpty())
        {
        	jpql += "WHERE u.couponName LIKE :searchValue";
        }
        try {
        	TypedQuery<Long> query = em.createQuery(jpql, Long.class);
	        
	        if (searchValue != null && !searchValue.isEmpty())
	        {
	        	query.setParameter("searchValue", "%" + searchValue + "%");
	        }
	       
	        count = query.getSingleResult();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
        
        return count;
	}

	@Override
	public List<Coupon> getPaginatedCoupons(int page, int pageSize, String searchValue) {
		EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT u FROM Coupon  u  "; // Truy vấn JPQL
        if (searchValue != null && !searchValue.isEmpty())
        {
        	jpql += "WHERE u.couponName LIKE :searchValue";
        }
        List<Coupon> listCoupon= new ArrayList<>();
        try {
        	
        	 TypedQuery<Coupon> query = em.createQuery(jpql, Coupon.class);
 	       // Thiết lập phân trang
        	 if (searchValue != null && !searchValue.isEmpty()) {
     			query.setParameter("searchValue", "%" + searchValue + "%");
     		}

	        query.setFirstResult((page - 1) * pageSize); // Bỏ qua số bản ghi trước trang hiện tại
	        query.setMaxResults(pageSize);              // Giới hạn số bản ghi trong một trang
	        listCoupon = query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
       
        return listCoupon;
	}

	@Override
	public Coupon getOneCoupon(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		Coupon coupon = new Coupon();
		try {
			coupon = em.find(Coupon.class, id);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return coupon;
	}

	@Override
	public boolean insertCoupon(Coupon coupon) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = em.getTransaction();
			transaction.begin();

			em.persist(coupon);

			transaction.commit();
			return true;

		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback(); // Rollback nếu có lỗi
			}
			System.out.println(e);
			return false;

		} finally {
			em.close();
		}
	}

	@Override
	public boolean updateCoupon(Coupon coupon) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = em.getTransaction();
			transaction.begin();

			em.merge(coupon);

			transaction.commit();
			return true;

		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback(); // Rollback nếu có lỗi
			}
			System.out.println(e);
			return false;

		} finally {
			em.close();
		}
	}

	@Override
	public boolean deleteCoupon(Coupon coupon) {
		EntityManager em = JPAConfig.getEntityManager();
		 EntityTransaction transaction = null;

	        try {
	            transaction = em.getTransaction();
	            transaction.begin();

	            Coupon cou= em.find(Coupon.class, coupon.getCouponID());
	            if (cou != null) {
	                // Xóa đối tượng nếu tồn tại
	                em.remove(cou);
	            }

	            transaction.commit();
	            return true;

	        } catch (Exception e) {
	            if (transaction != null && transaction.isActive()) {
	                transaction.rollback(); // Hoàn tác nếu có lỗi
	            }
	            System.out.println(e);
	            return false;

	        } finally {
	            em.close();
	        }
	}
	
	@Override
	public List<Coupon> getAllCouponsValid() {
	    EntityManager em = JPAConfig.getEntityManager();
	    String jpql = "SELECT u FROM Coupon u WHERE u.endDate >= :currentDate"; // Truy vấn JPQL với điều kiện
	    List<Coupon> listCoupon = new ArrayList<>();
	    try {
	        TypedQuery<Coupon> query = em.createQuery(jpql, Coupon.class);
	        
	        // Lấy ngày hiện tại
	        LocalDate today = LocalDate.now();
	        Date currentDate = Date.valueOf(today); // Chuyển đổi thành java.sql.Date
	        
	        // Thiết lập tham số cho câu truy vấn
	        query.setParameter("currentDate", currentDate);

	        // Lấy danh sách coupon còn hiệu lực
	        listCoupon = query.getResultList();
	    } catch (Exception e) {
	        System.out.println("Error: " + e.getMessage());
	    } finally {
	        em.close();
	    }
	    return listCoupon;
	}

}
