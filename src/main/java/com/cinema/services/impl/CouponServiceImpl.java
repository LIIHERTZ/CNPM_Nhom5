package com.cinema.services.impl;

import java.util.List;

import com.cinema.entity.Coupon;
import com.cinema.dao.*;
import com.cinema.services.*;
import com.cinema.dao.impl.*;
public class CouponServiceImpl implements ICouponService{
	ICouponDAO couponDao = new CouponDAOImpl();
	@Override
	public long getTotalPages(int pageSize, String searchValue)
	{
		 long totalCoupons = couponDao.countTotalCoupons(searchValue);
	        return (int) Math.ceil((double) totalCoupons / pageSize);
	}

	@Override
	public List<Coupon> getCoupons(int page, int pageSize,String searchValue){
		return couponDao.getPaginatedCoupons(page, pageSize, searchValue);
	}
	
	@Override
	public Coupon getOneCoupon(int id) {
		return couponDao.getOneCoupon(id);
	}
	@Override
	public boolean insertCoupon(Coupon coupon) {
		return couponDao.insertCoupon(coupon);
	}
	@Override
	public boolean updateCoupon(Coupon coupon) {
		return couponDao.updateCoupon(coupon);
	}
	@Override
	public boolean deleteCoupon(Coupon coupon) {
		return couponDao.deleteCoupon(coupon);
	}
	@Override
	public List<Coupon> getAllCouponsValid() {
		return couponDao.getAllCouponsValid();
	}
	@Override
	public long countTotalCoupons(String searchValue) {
		return couponDao.countTotalCoupons(searchValue);
	}
}
