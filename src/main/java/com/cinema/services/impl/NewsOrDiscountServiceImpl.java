package com.cinema.services.impl;

import java.util.List;

import com.cinema.entity.NewsOrDiscount;
import com.cinema.services.INewsOrDiscountService;
import com.cinema.dao.INewsOrDiscountDao;
import com.cinema.dao.impl.*;

public class NewsOrDiscountServiceImpl implements INewsOrDiscountService {
	
	INewsOrDiscountDao newsOrDiscountDao = new NewsOrDiscountDaoImpl();
	@Override
	public int count() {
		return newsOrDiscountDao.count();
	}

	@Override
	public List<NewsOrDiscount> findAll(int page, int pagesize) {
		return newsOrDiscountDao.findAll(page, pagesize);
	}

	@Override
	public List<NewsOrDiscount> findByNewsOrDiscountname(String newsOrDiscountName, int page, int pageSize) {
		return newsOrDiscountDao.findByNewsOrDiscountname(newsOrDiscountName, page, pageSize);
	}

	@Override
	public List<NewsOrDiscount> findAll() {
		return newsOrDiscountDao.findAll();
	}

	@Override
	public NewsOrDiscount findById(int newsOrDiscountId) {
		return newsOrDiscountDao.findById(newsOrDiscountId);
	}

	@Override
	public void delete(int newsOrDiscountId) throws Exception {
		newsOrDiscountDao.delete(newsOrDiscountId);
		
	}

	@Override
	public void update(NewsOrDiscount NewsOrDiscount) {
		newsOrDiscountDao.update(NewsOrDiscount);
	}

	@Override
	public void insert(NewsOrDiscount NewsOrDiscount) {
		newsOrDiscountDao.insert(NewsOrDiscount);
	}

	@Override
	public int countBySearch(String searchKeyword) {
		return newsOrDiscountDao.countBySearch(searchKeyword);
	}


}
