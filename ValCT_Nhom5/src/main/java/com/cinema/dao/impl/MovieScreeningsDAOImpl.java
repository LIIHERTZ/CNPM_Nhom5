package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IMovieScreeningsDAO;
import com.cinema.entity.MovieScreenings;

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
}
