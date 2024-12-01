package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Coupon;

public interface ICouponDAO {
	long countTotalCoupons( String searchValue);

	List<Coupon> getPaginatedCoupons(int page, int pageSize,String searchValue);
	
	Coupon getOneCoupon(int id); 
	boolean insertCoupon(Coupon coupon); 
	boolean updateCoupon(Coupon coupon); 
	boolean deleteCoupon(Coupon coupon);

	List<Coupon> getAllCouponsValid(); 
}
