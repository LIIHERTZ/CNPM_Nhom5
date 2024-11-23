package com.cinema.dao.impl;

import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IMovieDAO;
import com.cinema.entity.Movie;
import com.cinema.entity.Movie;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class MovieDAOImpl implements IMovieDAO {

	@Override
	public List<Movie> getAllMovie() {
		EntityManager em = JPAConfig.getEntityManager();
        try {
        	 String jpql = "SELECT m FROM Movie m";
             TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
             List<Movie> movies = query.getResultList();
             System.out.println("Movies List Size: " + movies.size()); // Log size
             return movies;
        } finally {
            em.close();
        }
        
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

	@Override
	public List<Movie> searchMoviesByName(String movieName) {
		 EntityManager em = JPAConfig.getEntityManager();
	        try {
	            String jpql = "SELECT m FROM Movie m WHERE m.movieName LIKE :movieName";
	            TypedQuery<Movie> query = em.createQuery(jpql, Movie.class);
	            query.setParameter("movieName", "%" + movieName + "%");
	            return query.getResultList();
	        } finally {
	            em.close();
	        }
	}

}
