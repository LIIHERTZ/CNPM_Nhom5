package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Movie;


public interface IMovieDAO {
	List<Movie> getAllMovie();
	Movie getOneMovie(int id); 
	boolean insertMovie(Movie Movie); 
	boolean updateMovie(Movie Movie); 
	boolean deleteMovie(Movie Movie); 
	Movie getMovieById(int movieID);  // Thêm phương thức getMovieById
}
