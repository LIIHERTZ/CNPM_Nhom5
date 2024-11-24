package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IMovieScreeningsDAO;
import com.cinema.entity.MovieScreenings;
import com.cinema.entity.Person;

import jakarta.persistence.EntityManager;

public class MovieScreeningsDAOImpl implements IMovieScreeningsDAO {

	@Override
	public List<MovieScreenings> getScreeningsByMovieIdAndCinemaId(int movieId, int cinemaId) {
		EntityManager em = JPAConfig.getEntityManager();
		// Sử dụng ms.movie.movieID và c.cinemaID để truy vấn
		String query = "SELECT ms FROM MovieScreenings ms " +
				"JOIN ms.room r " +
				"JOIN r.cinema c " +
				"WHERE ms.movie.movieID = :movieId " +
				"AND c.cinemaID = :cinemaId " +
				"AND ms.status = true";
		return em.createQuery(query, MovieScreenings.class).setParameter("movieId", movieId)
				.setParameter("cinemaId", cinemaId).getResultList();
	}

	@Override
	public List<String> findAvailableDatesByMovieId(Long movieId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		String jpql = "SELECT DISTINCT FUNCTION('DATE_FORMAT', s.startTime, '%Y-%m-%d') "
				+ "FROM MovieScreenings s WHERE s.movieID= :movieId";
		return entityManager.createQuery(jpql, String.class).setParameter("movieId", movieId).getResultList();
	}

	@Override
	public MovieScreenings findById(int msID) {
		EntityManager em = JPAConfig.getEntityManager();
		MovieScreenings movie = new MovieScreenings();
		try {
			movie = em.find(MovieScreenings.class, msID);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return movie;
	}
}
