package com.cinema.services;

import java.util.List;

import com.cinema.entity.Person;

public interface IUserService {

	int getTotalPages(int pageSize,String searchValue);

	List<Person> getUsers(int page, int pageSize , String searchValue);

	long countTotalUsers(String searchValue);

}
