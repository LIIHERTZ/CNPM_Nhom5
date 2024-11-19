package com.cinema.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ICinemaDAO;
import com.cinema.entity.Cinema;
import com.cinema.entity.MovieScreenings;
import com.cinema.entity.Person;
import com.cinema.entity.Cinema;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class CinemaDAOImpl implements ICinemaDAO {

	@Override
	public List<Cinema> getAllCinema() {
	    EntityManager em = JPAConfig.getEntityManager();
	    List<Cinema> listCinema = new ArrayList<>();

	    try {
	        // Correct JPQL syntax to select all from Cinema
	        String jpql = "SELECT c FROM Cinema c";
	        TypedQuery<Cinema> query = em.createQuery(jpql, Cinema.class);
	        listCinema = query.getResultList();
	    } catch (Exception e) {
	        System.err.println("Error retrieving cinemas: " + e.getMessage());
	    } finally {
	        em.close();
	    }

	    return listCinema;
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
		EntityManager em = JPAConfig.getEntityManager();
		String sql = "SELECT * FROM Cinema WHERE location = :location";
		List<Cinema> listCinema = new ArrayList<>();
		try {
			TypedQuery<Cinema> query = em.createQuery(sql, Cinema.class);
			query.setParameter("location", location);
			listCinema = query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return listCinema;
	}


}
