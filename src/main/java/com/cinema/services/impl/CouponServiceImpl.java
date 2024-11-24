package com.cinema.services.impl;

import java.util.List;

import com.cinema.entity.Coupon;
import com.cinema.services.ICouponService;
import com.cinema.dao.ICouponDAO;
import com.cinema.dao.impl.CouponDAOImpl;

public class CouponServiceImpl implements ICouponService
{
	ICouponDAO couponDao = new CouponDAOImpl();
	@Override
	public List<Coupon> getAllCouponsValid() {
		return couponDao.getAllCouponsValid();
	}

}
