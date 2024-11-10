package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.ICinemaDAO;
import com.cinema.dao.impl.CinemaDAOImpl;
import com.cinema.entity.Cinema;
import com.cinema.services.ICinemaService;

public class CinemaServiceImpl implements ICinemaService {

	ICinemaDAO cinemaDao = new CinemaDAOImpl();
	@Override
	public List<Cinema> getAllCinema() {
		return cinemaDao.getAllCinema();
	}
	

	@Override
	public Cinema getOneCinema(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertCinema(Cinema Cinema) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateCinema(Cinema Cinema) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCinema(Cinema Cinema) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public List<Cinema> getCinemaByLocation(String location) {
		return cinemaDao.getCinemaByLocation(location);
	}



	
}
