package com.cinema.services;

import java.util.List;

import com.cinema.entity.Coupon;

public interface ICouponService {

	boolean deleteCoupon(Coupon coupon);

	boolean updateCoupon(Coupon coupon);

	boolean insertCoupon(Coupon coupon);

	Coupon getOneCoupon(int id);

	List<Coupon> getCoupons(int page, int pageSize, String searchValue);

	long getTotalPages(int pageSize, String searchValue);

	List<Coupon> getAllCouponsValid();

	long countTotalCoupons(String searchValue);

}
