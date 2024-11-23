package com.cinema.dao.impl;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IChairDAO;
import com.cinema.entity.Chair;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class ChairDAOImpl implements IChairDAO {

	 @Override
	    public boolean addChair(Chair chair) {
	        EntityManager em = JPAConfig.getEntityManager();
	        EntityTransaction transaction = null;

	        try {
	            transaction = em.getTransaction();
	            transaction.begin();
	            em.persist(chair);
	            transaction.commit();
	            return true;
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	            return false;
	        } finally {
	            em.close();
	        }
	    }
	
}
