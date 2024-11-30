package com.cinema.services;

import java.util.List;

import com.cinema.entity.Movie;

public interface IMovieService {
	List<Movie> getAllMovie();
	Movie getOneMovie(int id); 
	boolean insertMovie(Movie Movie); 
	boolean updateMovie(Movie Movie); 
	boolean deleteMovie(int movieID); 
	Movie getMovieById(int movieID);  // Thêm phương thức getMovieById
	List<Movie> getMovies(int offset, int noOfRecords) ;
	int getNoOfRecords();
	List<Movie> searchMovies(String keyword, int i, int recordsPerPage);
	int getNoOfSearchResults(String keyword);
	List<Movie> searchMovies(String keyword, String category, int offset, int limit);
	int getNoOfSearchResults(String keyword, String category);
	List<Movie> searchMovies(String keyword, String[] categories, int offset, int limit);
	int getNoOfSearchResults(String keyword, String[] categories);

	List<Movie> searchMoviesByName(String movieName);
	 List<Movie> getMoviesShowing();
	    List<Movie> getMoviesComingSoon();
	List<Movie> getAllMovieActive();
	boolean updateMovieRating(int movieID,float rating);
}
