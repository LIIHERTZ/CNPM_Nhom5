package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IMovieDAO;
import com.cinema.dao.impl.MovieDAOImpl;
import com.cinema.entity.Movie;
import com.cinema.services.IMovieService;

public class MovieServiceImpl implements IMovieService{

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
		return movieDao.insertMovie(Movie);
	}

	@Override
	public boolean updateMovie(Movie Movie) {
		return movieDao.updateMovie(Movie);
	}

	@Override
	public boolean deleteMovie(int movieID) {
		return movieDao.deleteMovie(movieID);
	}
	@Override
    public Movie getMovieById(int movieID) {
        return movieDao.getMovieById(movieID);
    }
	public List<Movie> getMovies(int offset, int noOfRecords) {
		return movieDao.getMovies( offset, noOfRecords);
	}

	@Override
	public int getNoOfRecords() {
		return movieDao.getNoOfRecords();
	}

	@Override
	public List<Movie> searchMovies(String keyword, int i, int recordsPerPage) {
		return movieDao.searchMovies(keyword,i,recordsPerPage);
	}

	@Override
	public int getNoOfSearchResults(String keyword) {
		return movieDao.getNoOfSearchResults(keyword);
	}
	
    @Override
    public List<Movie> searchMovies(String keyword, String category, int offset, int limit) {
        return movieDao.searchMovies(keyword, category, offset, limit);
    }

    @Override
    public int getNoOfSearchResults(String keyword, String category) {
        return movieDao.getNoOfSearchResults(keyword, category);
    }

	@Override
	public List<Movie> searchMovies(String keyword, String[] categories, int offset, int limit) {
		return movieDao.searchMovies(keyword, categories, offset, limit);
	}

	@Override
	public int getNoOfSearchResults(String keyword, String[] categories) {
		return movieDao.getNoOfSearchResults(keyword, categories);
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
	@Override
	public List<Movie> getAllMovieActive() {
			
		return movieDao.getAllMovieActive();

	}
	public boolean updateMovieRating(int movieID,float rating) {
		return movieDao.updateMovieRating(movieID, rating);
	}

	
}
