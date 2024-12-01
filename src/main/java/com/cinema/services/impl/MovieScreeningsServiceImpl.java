package com.cinema.services.impl;

import com.cinema.dao.IMovieScreeningsDAO;
import com.cinema.dao.impl.MovieScreeningsDAOImpl;
import com.cinema.entity.MovieScreenings;
import com.cinema.services.IMovieScreeningsService;

import java.sql.Date;
import java.util.List;

public class MovieScreeningsServiceImpl implements IMovieScreeningsService {

	IMovieScreeningsDAO movieScreeningDAO = new MovieScreeningsDAOImpl();
	@Override
	public List<MovieScreenings> getScreeningsByMovieIdAndCinemaId(int movieId, int cinemaId) {
		return movieScreeningDAO.getScreeningsByMovieIdAndCinemaId(movieId, cinemaId);
	}
	
	 @Override
	    public List<MovieScreenings> getAllMovieScreenings() {
	        return movieScreeningDAO.getAllMovieScreenings();
	    }

	    @Override
	    public MovieScreenings getMovieScreeningById(int msID) {
	        return movieScreeningDAO.getMovieScreeningById(msID);
	    }

	    @Override
	    public boolean addMovieScreening(MovieScreenings movieScreening) {
	        return movieScreeningDAO.addMovieScreening(movieScreening);
	    }

	    @Override
	    public boolean updateMovieScreening(MovieScreenings movieScreening) {
	        return movieScreeningDAO.updateMovieScreening(movieScreening);
	    }

	    @Override
	    public boolean deleteMovieScreening(int msID) {
	        return movieScreeningDAO.deleteMovieScreening(msID);
	    }
	    @Override
	    public List<MovieScreenings> getMovieScreeningsByRoomId(int roomID) {
	        return movieScreeningDAO.getMovieScreeningsByRoomId(roomID);
	    }

		@Override
		public List<MovieScreenings> getMovieScreeningsByRoomIdWithPagination(int roomID, int start, int total) {
			return movieScreeningDAO.getMovieScreeningsByRoomIdWithPagination(roomID, start, total);
		}

		@Override
		public int getNoOfRecordsByRoomId(int roomID) {
			return movieScreeningDAO.getNoOfRecordsByRoomId(roomID);
		}
		
		@Override
		public List<MovieScreenings> getMovieScreeningsByRoomIdAndDateWithPagination(int roomID, Date screeningDate, int start, int total) {
		    return movieScreeningDAO.getMovieScreeningsByRoomIdAndDateWithPagination(roomID, screeningDate, start, total);
		}

	@Override
	public List<String> findAvailableDatesByMovieId(Long movieId) {
		return movieScreeningDAO.findAvailableDatesByMovieId(movieId);
	}


}
