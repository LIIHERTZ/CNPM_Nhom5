package com.cinema.dao;

import java.util.List;

public interface IPaymentDAO {

	List<Object[]> getMovieStatisticsByDate(String dateValue,String dateType);

	List<Object[]> getPopCornStatisticsByDate(String dateValue, String dateType);

	List<Object[]> getCinemaRevenuesByMovieID(String movieID);

	List<Object[]> getCustomerAmountAllCinema();

}
