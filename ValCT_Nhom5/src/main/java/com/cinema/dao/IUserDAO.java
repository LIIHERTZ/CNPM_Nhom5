package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Person;

public interface IUserDAO {

	long countTotalUsers( String searchValue);

	List<Person> getPaginatedUsers(int page, int pageSize,String searchValue);

}
