package com.cinema.services;

import java.util.List;

import com.cinema.entity.Cinema;
import com.cinema.entity.MovieScreenings;

public interface ICinemaService {
	List<Cinema> getAllCinema();
	Cinema getOneCinema(int id); 
	List<Cinema> getCinemaByLocation(String location);
	boolean insertCinema(Cinema Cinema); 
	boolean updateCinema(Cinema Cinema); 
	boolean deleteCinema(int ID);
	
	List<Cinema> getCinemas(int offset, int noOfRecords);
    int getNoOfRecords();
    Cinema getCinemaById(int id);
    boolean addCinema(Cinema cinema);
   // List<Cinema> searchCinemas(String keyword);
    List<Cinema> searchCinemas(String keyword, int offset, int limit);
    int getNoOfSearchResults(String keyword);
   
    List<Cinema> getAllCinemas(int offset, int recordsPerPage);
    int getTotalNumberOfCinemas();
    List<Cinema> searchCinemasByLocation(String location, int offset, int recordsPerPage);

}
