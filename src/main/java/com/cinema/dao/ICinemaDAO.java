package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Cinema;

public interface ICinemaDAO {
	List<Cinema> getAllCinema();
    Cinema getCinemaById(int id);
    Cinema getOneCinema(int id);
    List<Cinema> getCinemaByLocation(String location);
    boolean insertCinema(Cinema cinema);
    boolean updateCinema(Cinema cinema);
    boolean deleteCinema(int cinemaId);
    
    // New methods for pagination, searching, and getting record count
    List<Cinema> getCinemas(int offset, int noOfRecords);
    int getNoOfRecords();
    //List<Cinema> searchCinemas(String keyword);
    List<Cinema> searchCinemas(String keyword, int offset, int limit);
    int getNoOfSearchResults(String keyword);
    
    List<Cinema> getAllCinemas(int offset, int recordsPerPage);
    int getTotalNumberOfCinemas();
    List<Cinema> searchCinemasByLocation(String location, int offset, int recordsPerPage);
}
