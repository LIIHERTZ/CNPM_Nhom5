package com.cinema.services;

import java.util.List;

import com.cinema.entity.Movie;

public interface IMovieService {
	List<Movie> getAllMovie();
	Movie getOneMovie(int id); 
	boolean insertMovie(Movie Movie); 
	boolean updateMovie(Movie Movie); 
	boolean deleteMovie(Movie movie); 
	List<Movie> searchMoviesByName(String movieName);
	 List<Movie> getMoviesShowing();
	    List<Movie> getMoviesComingSoon();
}
