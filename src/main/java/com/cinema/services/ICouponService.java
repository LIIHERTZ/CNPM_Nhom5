package com.cinema.services;

import com.cinema.entity.Coupon;

import java.util.List;

public interface ICouponService {
    public List<Coupon> getAllCouponsValid();
}
