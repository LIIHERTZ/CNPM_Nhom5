package com.cinema.services;

import java.sql.Date;
import java.util.List;

import com.cinema.entity.MovieScreenings;

public interface IMovieScreeningsService {

	List<String> findAvailableDatesByMovieId(Long movieId);
	public List<MovieScreenings> getScreeningsByMovieIdAndCinemaId(int movieId, int cinemaId) ;
	List<MovieScreenings> getAllMovieScreenings();
    MovieScreenings getMovieScreeningById(int msID);
    boolean addMovieScreening(MovieScreenings movieScreening);
    boolean updateMovieScreening(MovieScreenings movieScreening);
    boolean deleteMovieScreening(int msID);
    List<MovieScreenings> getMovieScreeningsByRoomId(int roomID);
    
    List<MovieScreenings> getMovieScreeningsByRoomIdWithPagination(int roomID, int start, int total);
    int getNoOfRecordsByRoomId(int roomID);
    List<MovieScreenings> getMovieScreeningsByRoomIdAndDateWithPagination(int roomID, Date screeningDate, int start, int total);

}
