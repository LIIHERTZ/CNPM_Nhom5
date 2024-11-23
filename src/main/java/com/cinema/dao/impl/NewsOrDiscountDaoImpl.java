package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.INewsOrDiscountDao;
import com.cinema.entity.NewsOrDiscount;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.Query;

public class NewsOrDiscountDaoImpl implements INewsOrDiscountDao {

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT count(n) FROM NewsOrDiscount n";
        Query query = enma.createQuery(jpql);
        return ((Long) query.getSingleResult()).intValue();
	}

	@Override
	public List<NewsOrDiscount> findAll(int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<NewsOrDiscount> query = enma.createNamedQuery("NewsOrDiscount.findAll", NewsOrDiscount.class);
        query.setFirstResult(page * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
	}

	@Override
	public List<NewsOrDiscount> findByNewsOrDiscountname(String newsOrDiscountName, int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT n FROM NewsOrDiscount n WHERE n.title LIKE :newsOrDiscountName";
        TypedQuery<NewsOrDiscount> query = enma.createQuery(jpql, NewsOrDiscount.class);
        query.setParameter("newsOrDiscountName", "%" + newsOrDiscountName + "%");
        
     // Phân trang: setFirstResult và setMaxResults
        query.setFirstResult(page * pageSize);
        query.setMaxResults(pageSize);
        
        return query.getResultList();
	}
	
	@Override
	public List<NewsOrDiscount> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<NewsOrDiscount> query = enma.createNamedQuery("NewsOrDiscount.findAll", NewsOrDiscount.class);
        return query.getResultList();
	}

	@Override
	public NewsOrDiscount findById(int newsOrDiscountId) {
		EntityManager enma = JPAConfig.getEntityManager();
        NewsOrDiscount newsOrDiscount = enma.find(NewsOrDiscount.class, newsOrDiscountId);
        return newsOrDiscount;
	}

	@Override
	public void delete(int newsOrDiscountId) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            NewsOrDiscount newsOrDiscount = enma.find(NewsOrDiscount.class, newsOrDiscountId);
            if (newsOrDiscount != null) {
                enma.remove(newsOrDiscount);
            } else {
                throw new Exception("Không tìm thấy đối tượng với ID: " + newsOrDiscountId);
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
	}

	@Override
	public void update(NewsOrDiscount newsOrDiscount) {
		EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(newsOrDiscount);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
	}

	@Override
	public void insert(NewsOrDiscount newsOrDiscount) {
		EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(newsOrDiscount);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
	}

	@Override
	public int countBySearch(String searchKeyword) {
		EntityManager enma = JPAConfig.getEntityManager();
	    String jpql = "SELECT COUNT(n) FROM NewsOrDiscount n WHERE n.title LIKE :newsOrDiscountName";
	    TypedQuery<Long> query = enma.createQuery(jpql, Long.class);
	    query.setParameter("newsOrDiscountName", "%" + searchKeyword + "%");
	    return query.getSingleResult().intValue();
	}

}
