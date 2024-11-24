package com.cinema.dao.impl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ICouponDAO;
import com.cinema.entity.Coupon;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class CouponDAOImpl implements ICouponDAO {
	
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
