package com.cinema.services.impl;

import com.cinema.services.IPopcornService;
import java.util.List;

import com.cinema.dao.IPopcornDAO;
import com.cinema.dao.impl.PopcornDAOImpl;
import com.cinema.entity.PopCorn;

public class PopcornServiceImpl implements IPopcornService{

	IPopcornDAO popcornDAO = new PopcornDAOImpl();
	@Override
	public List<PopCorn> getAllPopcorns() {
		return popcornDAO.findAll();
	}
	@Override
	public List<PopCorn> getPopcornsByType(String type) {
		 return popcornDAO.findByType(type);
	}

	@Override
	public PopCorn getPopcornByName(String name) {
		return popcornDAO.findByName(name);
	}

}
