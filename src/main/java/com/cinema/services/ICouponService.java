package com.cinema.services;

import java.util.List;

import com.cinema.entity.Coupon;

public interface ICouponService {
	public List<Coupon> getAllCouponsValid();
}
