package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IPersonDAO;
import com.cinema.dao.IReviewDao;
import com.cinema.entity.Review;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

public class ReviewDaoImpl implements IReviewDao{
	
    public void addReview(Review review) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(review);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
	
    public void updateReview(Review review) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(review);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public void deleteReview(int reviewID) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            Review review = em.find(Review.class, reviewID);
            if (review != null) {
                em.remove(review);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public int countReviewsByMovie(int movieId) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        try {
            // Cập nhật truy vấn để đếm số lượng đánh giá cho một bộ phim
            Long count = entityManager.createQuery(
                    "SELECT COUNT(r) FROM Review r WHERE r.movie.movieID = :movieId", Long.class)
                    .setParameter("movieId", movieId)
                    .getSingleResult();

            return count.intValue();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    
    public List<Review> getReviewsByMovie(int movieId) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            // Sử dụng JOIN FETCH để lấy thông tin của người đánh giá
            TypedQuery<Review> query = em.createQuery(
                    "SELECT r FROM Review r WHERE r.movie.movieID = :movieId", Review.class);
            query.setParameter("movieId", movieId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
    
    @Override
    public List<Review> getReviewsByMovieWithPagination(int movieId, int offset, int limit) {
        String queryStr = "SELECT r FROM Review r WHERE r.movie.movieId = :movieId";
        TypedQuery<Review> query = JPAConfig.getEntityManager().createQuery(queryStr, Review.class);
        query.setParameter("movieId", movieId);
        query.setFirstResult(offset);
        query.setMaxResults(limit);
        return query.getResultList();
    }
   
  
}
