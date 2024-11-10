package com.cinema.dao;

import java.util.List;

import com.cinema.entity.MovieScreenings;

public interface IMovieScreeningsDAO {

	List<MovieScreenings> getScreeningsByMovieIdAndCinemaId(int movieId, int cinemaId);
}
