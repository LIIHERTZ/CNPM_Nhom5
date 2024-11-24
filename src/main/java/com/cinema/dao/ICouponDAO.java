package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Coupon;

public interface ICouponDAO {
	public List<Coupon> getAllCouponsValid();
}
