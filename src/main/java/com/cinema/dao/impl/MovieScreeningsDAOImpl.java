package com.cinema.dao.impl;

import java.sql.Date;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IMovieScreeningsDAO;
import com.cinema.entity.MovieScreenings;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class MovieScreeningsDAOImpl implements IMovieScreeningsDAO {

	@Override
	public List<MovieScreenings> getScreeningsByMovieIdAndCinemaId(int movieId, int cinemaId) {
		EntityManager em = JPAConfig.getEntityManager();
		// Sử dụng ms.movie.movieID và c.cinemaID để truy vấn
		String query = "SELECT ms FROM MovieScreenings ms " + "JOIN ms.room r " + "JOIN r.cinema c "
				+ "WHERE ms.movie.movieID = :movieId AND c.cinemaID = :cinemaId";
		return em.createQuery(query, MovieScreenings.class).setParameter("movieId", movieId)
				.setParameter("cinemaId", cinemaId).getResultList();

	}
	
	@Override
    public List<MovieScreenings> getAllMovieScreenings() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String queryStr = "SELECT ms FROM MovieScreenings ms";
            TypedQuery<MovieScreenings> query = em.createQuery(queryStr, MovieScreenings.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public MovieScreenings getMovieScreeningById(int msID) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return em.find(MovieScreenings.class, msID);
        } finally {
            em.close();
        }
    }

    @Override
    public boolean addMovieScreening(MovieScreenings movieScreening) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(movieScreening);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean updateMovieScreening(MovieScreenings movieScreening) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(movieScreening);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            return false;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean deleteMovieScreening(int msID) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            MovieScreenings ms = em.find(MovieScreenings.class, msID);
            if (ms != null) {
                em.remove(ms);
                em.getTransaction().commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            em.getTransaction().rollback();
            return false;
        } finally {
            em.close();
        }
    }
    
    
    @Override
    public List<MovieScreenings> getMovieScreeningsByRoomId(int roomID) {
        EntityManager em = JPAConfig.getEntityManager();
        List<MovieScreenings> movieScreenings = null;

        try {
            em.getTransaction().begin();
            // Tạo câu truy vấn JPQL để lấy danh sách MovieScreenings theo roomID
            TypedQuery<MovieScreenings> query = em.createQuery(
                    "FROM MovieScreenings ms WHERE ms.room.roomID = :roomID", MovieScreenings.class);
            query.setParameter("roomID", roomID);

            // Thực thi truy vấn và lấy kết quả
            movieScreenings = query.getResultList();
            em.getTransaction().commit();
        } catch (Exception e) {
            // Rollback nếu có lỗi
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            // Đóng EntityManager sau khi hoàn tất
            if (em.isOpen()) {
                em.close();
            }
        }

        return movieScreenings;
    }
    
    
    
    @Override
    public List<MovieScreenings> getMovieScreeningsByRoomIdWithPagination(int roomID, int start, int total) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT ms FROM MovieScreenings ms WHERE ms.room.roomID = :roomID";
            return em.createQuery(jpql, MovieScreenings.class)
                     .setParameter("roomID", roomID)
                     .setFirstResult(start)
                     .setMaxResults(total)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public int getNoOfRecordsByRoomId(int roomID) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(ms) FROM MovieScreenings ms WHERE ms.room.roomID = :roomID";
            Long count = em.createQuery(jpql, Long.class)
                           .setParameter("roomID", roomID)
                           .getSingleResult();
            return count.intValue();
        } finally {
            em.close();
        }
    }
    
    @Override
    public List<MovieScreenings> getMovieScreeningsByRoomIdAndDateWithPagination(int roomID, Date screeningDate, int offset, int recordsPerPage) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT ms FROM MovieScreenings ms WHERE ms.room.roomID = :roomID AND CAST(ms.screeningDate AS DATE) = :screeningDate";
            return em.createQuery(jpql, MovieScreenings.class)
                    .setParameter("roomID", roomID)
                    .setParameter("screeningDate", screeningDate)
                    .setFirstResult(offset)
                    .setMaxResults(recordsPerPage)
                    .getResultList();
        } finally {
            em.close();
        }
    }


    
    
    
    
	
}