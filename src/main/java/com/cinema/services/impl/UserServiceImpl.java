package com.cinema.services.impl;
import java.util.List;

import com.cinema.dao.*;
import com.cinema.services.*;
import com.cinema.dao.impl.UserDAOImpl;
import com.cinema.entity.Person;
public class UserServiceImpl implements IUserService{
	IUserDAO userDao = new UserDAOImpl();
	@Override
	public List<Person> getUsers(int page, int pageSize, String searchValue) {
        return userDao.getPaginatedUsers(page, pageSize ,  searchValue);
    }

    @Override
	public int getTotalPages(int pageSize,String searchValue) {
        long totalUsers = userDao.countTotalUsers(searchValue);
        return (int) Math.ceil((double) totalUsers / pageSize);
    }
    @Override
	public long countTotalUsers(String searchValue) {
    	return userDao.countTotalUsers(searchValue);
    }
}
