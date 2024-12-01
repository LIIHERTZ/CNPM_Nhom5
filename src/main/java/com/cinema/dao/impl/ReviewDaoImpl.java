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

public class ReviewDaoImpl implements IReviewDao {

    @Override
    public boolean addReview(Review review) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(review); // Lưu bài đánh giá vào DB
            em.getTransaction().commit();
            return true; // Trả về true khi thành công
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback(); // Đảm bảo rollback nếu có lỗi
            }
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        } finally {
            em.close(); // Đảm bảo đóng EntityManager sau khi hoàn thành
        }
    }

    @Override
    public void updateReview(Review review) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(review);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void deleteReview(int reviewID) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            Review review = em.find(Review.class, reviewID);
            if (review != null) {
                em.remove(review);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public int countReviewsByMovie(int movieId) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            Long count = em.createQuery("SELECT COUNT(r) FROM Review r WHERE r.movie.movieID = :movieId", Long.class)
                    .setParameter("movieId", movieId).getSingleResult();
            return count != null ? count.intValue() : 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            em.close();
        }
    }

    @Override
    public List<Review> getReviewsByMovie(int movieId) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            // Sử dụng JOIN FETCH để lấy thông tin của người đánh giá
            TypedQuery<Review> query = em.createQuery("SELECT r FROM Review r WHERE r.movie.movieID = :movieId",
                    Review.class);
            query.setParameter("movieId", movieId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Review> getReviewsByMovieAndPerson(int perID, int movieID) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            // Sử dụng truy vấn để lấy thông tin đánh giá của người dùng cho một bộ phim cụ thể
            TypedQuery<Review> query = em.createQuery(
                    "SELECT r FROM Review r WHERE r.movie.movieID = :movieId AND r.person.perID = :perID",
                    Review.class);
            query.setParameter("perID", perID);
            query.setParameter("movieId", movieID);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Review> getReviewsByMovieWithPagination(int movieId, int page, int pageSize) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            // Tính toán vị trí bắt đầu của phân trang
            int startPosition = (page - 1) * pageSize;

            TypedQuery<Review> query = em.createQuery(
                    "SELECT r FROM Review r WHERE r.movie.movieID = :movieId", Review.class);
            query.setParameter("movieId", movieId);
            query.setFirstResult(startPosition);  // Đặt vị trí bắt đầu
            query.setMaxResults(pageSize);  // Đặt số lượng kết quả trên mỗi trang

            return query.getResultList();
        } finally {
            em.close();
        }
    }

}