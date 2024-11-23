package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.ICinemaDAO;
import com.cinema.dao.impl.CinemaDAOImpl;
import com.cinema.entity.Cinema;
import com.cinema.entity.MovieScreenings;
import com.cinema.services.ICinemaService;

public class CinemaServiceImpl implements ICinemaService {

    ICinemaDAO cinemaDao = new CinemaDAOImpl();

    @Override
    public List<Cinema> getAllCinema() {
        return cinemaDao.getAllCinema();
    }

    @Override
    public Cinema getOneCinema(int id) {
        return cinemaDao.getCinemaById(id);
    }

    @Override
    public boolean insertCinema(Cinema cinema) {
        return cinemaDao.insertCinema(cinema);
    }

    @Override
    public boolean updateCinema(Cinema cinema) {
        return cinemaDao.updateCinema(cinema);
    }

    @Override
    public boolean deleteCinema(int ID) {
        return cinemaDao.deleteCinema(ID);
    }

    @Override
    public List<Cinema> getCinemaByLocation(String location) {
        return cinemaDao.getCinemaByLocation(location);
    }

    @Override
    public List<Cinema> getCinemas(int offset, int noOfRecords) {
        return cinemaDao.getCinemas(offset, noOfRecords);
    }

    @Override
    public int getNoOfRecords() {
        return cinemaDao.getNoOfRecords();
    }

    @Override
    public Cinema getCinemaById(int id) {
        return cinemaDao.getCinemaById(id);
    }

    @Override
    public boolean addCinema(Cinema cinema) {
        return cinemaDao.insertCinema(cinema);
    }

//    @Override
//    public List<Cinema> searchCinemas(String keyword) {
//        return cinemaDao.searchCinemas(keyword);
//    }
    @Override
    public List<Cinema> searchCinemas(String keyword, int offset, int limit) {
        return cinemaDao.searchCinemas(keyword, offset, limit);
    }
    @Override
    public int getNoOfSearchResults(String keyword) {
        return cinemaDao.getNoOfSearchResults(keyword);
    }

    @Override
    public List<Cinema> getAllCinemas(int offset, int recordsPerPage) {
        return cinemaDao.getAllCinemas(offset, recordsPerPage);
    }

    @Override
    public int getTotalNumberOfCinemas() {
        return cinemaDao.getTotalNumberOfCinemas();
    }

    @Override
    public List<Cinema> searchCinemasByLocation(String location, int offset, int recordsPerPage) {
        return cinemaDao.searchCinemasByLocation(location, offset, recordsPerPage);
    }


	
}
