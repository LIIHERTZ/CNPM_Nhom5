package com.cinema.dao.impl;

import java.util.List;
import com.cinema.entity.*;
public class UserDAOImpl {
	 public List<User> getPaginatedProducts(int page, int pageSize) {
	        String jpql = "SELECT u FROM User  u"; // Truy vấn JPQL

	        TypedQuery<Product> query = entityManager.createQuery(jpql, Product.class);

	        // Thiết lập phân trang
	        query.setFirstResult((page - 1) * pageSize); // Bỏ qua số bản ghi trước trang hiện tại
	        query.setMaxResults(pageSize);              // Giới hạn số bản ghi trong một trang

	        return query.getResultList();
	    }

	    // Đếm tổng số bản ghi
	    public long countTotalProducts() {
	        String jpql = "SELECT COUNT(p) FROM Product p";
	        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
	        return query.getSingleResult();
	    }
}
