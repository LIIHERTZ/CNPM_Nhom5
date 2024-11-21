package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IMovieDAO;
import com.cinema.entity.Movie;
import com.cinema.entity.Movie;

import jakarta.persistence.EntityManager;

public class MovieDAOImpl implements IMovieDAO {

	@Override
	public List<Movie> getAllMovie() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Movie getOneMovie(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		Movie movie = new Movie();
		try {
			movie = em.find(Movie.class, id);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return movie;
	}

	@Override
	public boolean insertMovie(Movie Movie) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateMovie(Movie Movie) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMovie(Movie Movie) {
		// TODO Auto-generated method stub
		return false;
	}

}
