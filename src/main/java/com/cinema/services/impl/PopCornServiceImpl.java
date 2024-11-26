package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IPopCornDAO;
import com.cinema.dao.impl.PopCornDAOImpl;
import com.cinema.entity.PopCorn;
import com.cinema.services.IPopCornService;

public class PopCornServiceImpl  implements IPopCornService{
	IPopCornDAO popDao = new PopCornDAOImpl();

	@Override
	public List<PopCorn> getPopCorns(int page, int pageSize, String searchValue) {
        return popDao.getPaginatedPopCorns(page, pageSize ,  searchValue);
    }


	@Override
	public int getTotalPages(int pageSize,String searchValue) {
        long totalPopCorns = popDao.countTotalPopCorns(searchValue);
        return (int) Math.ceil((double) totalPopCorns / pageSize);
    }
    
	@Override
	public PopCorn getOnePopCorn(int id) {
		return popDao.getOnePopCorn(id);
	}
	@Override
	public boolean insertPopCorn(PopCorn popcorn) {
		return popDao.insertPopCorn(popcorn);
	}
	@Override
	public boolean updatePopCorn(PopCorn popcorn) {
		return popDao.updatePopCorn(popcorn);
	}
	@Override
	public boolean deletePopCorn(PopCorn popcorn) {
		return popDao.deletePopCorn(popcorn);
	}
	@Override
	public List<PopCorn> getAllPopcorns() {
		return popDao.findAll();
	}
	@Override
	public List<PopCorn> getPopcornsByType(String type) {
		return popDao.findByType(type);
	}
	@Override
	public long countTotalPopCorns(String searchValue) {
		return popDao.countTotalPopCorns(searchValue);
	}
}
