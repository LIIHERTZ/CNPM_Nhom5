package com.cinema.services;

import java.util.List;

import com.cinema.entity.NewsOrDiscount;


public interface INewsOrDiscountService {
	int count();

	List<NewsOrDiscount> findAll(int page, int pagesize);

	List<NewsOrDiscount> findByNewsOrDiscountname(String newsOrDiscountName, int page, int pageSize);
	
	int countBySearch(String searchKeyword);

	List<NewsOrDiscount> findAll();

	NewsOrDiscount findById(int newsOrDiscountId);

	void delete(int newsOrDiscountId) throws Exception;

	void update(NewsOrDiscount NewsOrDiscount);

	void insert(NewsOrDiscount NewsOrDiscount);
}
