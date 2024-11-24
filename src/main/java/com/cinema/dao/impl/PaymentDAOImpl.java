package com.cinema.dao.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IPaymentDAO;
import com.cinema.entity.Payment;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class PaymentDAOImpl implements IPaymentDAO{

	@Override
	public Payment savePayment(Payment payment) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;
		try {
			transaction = em.getTransaction();
			transaction.begin();
			em.persist(payment);
			transaction.commit();
			return payment;

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

}
