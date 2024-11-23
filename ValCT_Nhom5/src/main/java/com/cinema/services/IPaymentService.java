package com.cinema.services;

import java.util.List;

public interface IPaymentService {

	List<Object[]> getMovieStatisticsByDate(String dateValue, String dateType);

	List<Object[]> getPopCornStatisticsByDate(String dateValue, String dateType);
	List<Object[]> getCinemaRevenuesByMovieID(String movieID);
	List<Object[]> getCustomerAmountAllCinema();
}
