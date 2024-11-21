package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IMovieScreeningsDAO;
import com.cinema.dao.impl.MovieScreeningsDAOImpl;
import com.cinema.entity.MovieScreenings;
import com.cinema.services.IMovieScreeningsService;

public class MovieScreeningsServiceImpl implements IMovieScreeningsService {

	IMovieScreeningsDAO cinemaDao = new MovieScreeningsDAOImpl();
	@Override
	public List<MovieScreenings> getScreeningsByMovieIdAndCinemaId(int movieId, int cinemaId) {
		return cinemaDao.getScreeningsByMovieIdAndCinemaId(movieId, cinemaId);
	}
}
