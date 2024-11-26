package com.cinema.dao;

import java.util.List;

import com.cinema.entity.PopCorn;

public interface IPopCornDAO {
	long countTotalPopCorns( String searchValue);

	List<PopCorn> getPaginatedPopCorns(int page, int pageSize,String searchValue);
	
	PopCorn getOnePopCorn(int id); 
	boolean insertPopCorn(PopCorn popcorn); 
	boolean updatePopCorn(PopCorn popcorn); 
	boolean deletePopCorn(PopCorn popcorn);
    PopCorn findByName(String name);
	List<PopCorn> findAll();
	List<PopCorn> findByType(String type);
}
