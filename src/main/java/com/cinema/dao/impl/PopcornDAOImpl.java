package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IPopcornDAO;
import com.cinema.entity.PopCorn;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class PopcornDAOImpl implements IPopcornDAO {

	@Override
	public List<PopCorn> findAll() {
		EntityManager em = JPAConfig.getEntityManager();
		String query = "SELECT p FROM PopCorn p WHERE p.status = True";
		return em.createQuery(query, PopCorn.class).getResultList();
	}

	@Override
	public List<PopCorn> findByType(String type) {
		EntityManager em = JPAConfig.getEntityManager(); // Lấy EntityManager từ cấu hình
	    String query = "SELECT p FROM PopCorn p WHERE p.typePopCorn = :type AND p.status = True";
	    
	    // Thực hiện truy vấn với tham số
	    return em.createQuery(query, PopCorn.class)
	             .setParameter("type", type)
	             .getResultList();
	}

}
