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
}
