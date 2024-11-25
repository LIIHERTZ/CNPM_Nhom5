package com.cinema.services.impl;

import com.cinema.dao.ICouponDAO;
import com.cinema.dao.impl.CouponDAOImpl;
import com.cinema.entity.Coupon;
import com.cinema.services.ICouponService;

import java.util.List;

public class CouponServiceImpl implements ICouponService {
    ICouponDAO couponDao = new CouponDAOImpl();
    @Override
    public List<Coupon> getAllCouponsValid() {
        return couponDao.getAllCouponsValid();
    }
}
