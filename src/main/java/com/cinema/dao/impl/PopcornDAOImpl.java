package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IPopcornDAO;
import com.cinema.entity.Movie;
import com.cinema.entity.Person;
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

    @Override
    public PopCorn findByID(int id) {
        EntityManager em = JPAConfig.getEntityManager();
        PopCorn popcorn = new PopCorn();
        try {
            popcorn = em.find(PopCorn.class, id);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
        return popcorn;
    }

    @Override
    public PopCorn findByName(String name) {
        EntityManager em = JPAConfig.getEntityManager();
        String sql = "SELECT p FROM PopCorn p WHERE namePopCorn = :name";
        try {
            TypedQuery<PopCorn> query = em.createQuery(sql, PopCorn.class);
            query.setParameter("name", name);
			return query.getSingleResult();

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
        return null;
    }
}


