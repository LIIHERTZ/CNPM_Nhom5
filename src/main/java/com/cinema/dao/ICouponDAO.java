package com.cinema.dao;

import com.cinema.entity.Coupon;

import java.util.List;

public interface ICouponDAO {
    public List<Coupon> getAllCouponsValid();
}
