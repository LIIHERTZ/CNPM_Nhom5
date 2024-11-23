package com.cinema.dao;

import java.util.List;

import com.cinema.entity.NewsOrDiscount;

public interface INewsOrDiscountDao {
	int count();

	List<NewsOrDiscount> findAll(int page, int pageSize);

	List<NewsOrDiscount> findByNewsOrDiscountname(String newsOrDiscountName, int page, int pageSize);
	
	int countBySearch(String searchKeyword);

	List<NewsOrDiscount> findAll();

	NewsOrDiscount findById(int newsOrDiscountId);

	void delete(int newsOrDiscountId) throws Exception;

	void update(NewsOrDiscount newsOrDiscount);

	void insert(NewsOrDiscount newsOrDiscount);

}
