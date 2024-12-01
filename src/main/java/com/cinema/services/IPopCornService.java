package com.cinema.services;

import java.util.List;

import com.cinema.entity.PopCorn;

public interface IPopCornService {

	boolean deletePopCorn(PopCorn popcorn);

	boolean updatePopCorn(PopCorn popcorn);

	boolean insertPopCorn(PopCorn popcorn);

	PopCorn getOnePopCorn(int id);

	int getTotalPages(int pageSize, String searchValue);

	List<PopCorn> getPopCorns(int page, int pageSize, String searchValue);
	List<PopCorn> getAllPopcorns();
	List<PopCorn> getPopcornsByType(String type);

	long countTotalPopCorns(String searchValue);

}
