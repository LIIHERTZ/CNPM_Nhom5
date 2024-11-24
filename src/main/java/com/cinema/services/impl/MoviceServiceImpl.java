package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IMovieDAO;
import com.cinema.dao.impl.MovieDAOImpl;
import com.cinema.entity.Movie;
import com.cinema.services.IMovieService;

public class MoviceServiceImpl implements IMovieService{

	IMovieDAO movieDao = new MovieDAOImpl();
	@Override
	public List<Movie> getAllMovie() {
		return movieDao.getAllMovie();
	}

	@Override
	public Movie getOneMovie(int id) {
		return movieDao.getOneMovie(id);
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
	public boolean deleteMovie(Movie Person) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Movie> searchMoviesByName(String movieName) {
		return movieDao.searchMoviesByName(movieName);
	}

	@Override
	public List<Movie> getMoviesShowing() {
		 return movieDao.getMoviesShowing();
	}

	@Override
	public List<Movie> getMoviesComingSoon() {
		return movieDao.getMoviesComingSoon();
	}
	
}
