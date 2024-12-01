package com.cinema.services;

import java.util.List;
import java.util.Map;

import com.cinema.entity.Movie;
import com.cinema.entity.Person;

public interface IPaymentService {
	void processPayment(String screeningId, String selectedLocation, String selectedDate,
            String experience, String version, String startHour, Movie movie,
            String selectedSeats, String totalPrice, String couponId, String payDate, Map<String, List<Integer>> products,
            Person person) throws Exception;
    List<Object[]> getMovieStatisticsByDate(String dateValue, String dateType);
    List<Object[]> getPopCornStatisticsByDate(String dateValue, String dateType);
    List<Object[]> getCinemaRevenuesByMovieID(String movieID);
    List<Object[]> getCustomerAmountAllCinema();
}
