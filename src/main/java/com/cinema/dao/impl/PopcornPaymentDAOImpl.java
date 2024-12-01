package com.cinema.dao.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IPopcornPaymentDAO;
import com.cinema.entity.Payment;
import com.cinema.entity.PopCorn;
import com.cinema.entity.PopCornPayment;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class PopcornPaymentDAOImpl implements IPopcornPaymentDAO {

	@Override
	public void savePopcornPayment(PopCornPayment popcornPayment) {
	    EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;
		try {

			transaction = em.getTransaction();
			transaction.begin();
			if (!em.contains(popcornPayment.getPayment())) {
				popcornPayment.setPayment(em.merge(popcornPayment.getPayment()));
			}
			if (!em.contains(popcornPayment.getPopcorn())) {
				popcornPayment.setPopcorn(em.merge(popcornPayment.getPopcorn()));
			}
			em.persist(popcornPayment);
			transaction.commit();

		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback(); // Rollback nếu có lỗi
			}
			System.out.println(e);

		} finally {
			em.close();
		}
	}

}
