package com.cinema.dao.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ITicketPaymentDAO;
import com.cinema.entity.TicketPayment;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class TicketPaymentDAOImpl implements ITicketPaymentDAO {
    @Override
    public TicketPayment save(TicketPayment tp) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = null;
        try {

            transaction = em.getTransaction();
            transaction.begin();
            em.persist(tp);
            transaction.commit();
            return tp;

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
