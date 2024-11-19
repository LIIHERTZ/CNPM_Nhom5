package com.cinema.services;

import java.util.List;

import com.cinema.entity.MovieScreenings;

public interface IMovieScreeningsService {

	public List<MovieScreenings> getScreeningsByMovieIdAndCinemaId(int movieId, int cinemaId) ;

}
