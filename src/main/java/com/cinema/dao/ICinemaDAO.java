package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Cinema;

public interface ICinemaDAO {
	List<Cinema> getAllCinema();
	Cinema getOneCinema(int id); 
	List<Cinema> getCinemaByLocation(String location);
	boolean insertCinema(Cinema Cinema); 
	boolean updateCinema(Cinema Cinema); 
	boolean deleteCinema(Cinema Cinema); 
}
