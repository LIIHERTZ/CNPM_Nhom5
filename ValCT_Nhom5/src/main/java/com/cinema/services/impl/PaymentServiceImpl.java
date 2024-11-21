package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IPaymentDAO;
import com.cinema.dao.impl.PaymentDAOImpl;
import com.cinema.services.IPaymentService;

public class PaymentServiceImpl implements IPaymentService{
	IPaymentDAO payDao = new PaymentDAOImpl();
	@Override
	public List<Object[]> getMovieStatisticsByDate(String dateValue,String dateType){
		return payDao.getMovieStatisticsByDate(dateValue, dateType);
	}
	@Override
	public List<Object[]> getPopCornStatisticsByDate(String dateValue,String dateType){
		return payDao.getPopCornStatisticsByDate(dateValue, dateType);
	}
}
