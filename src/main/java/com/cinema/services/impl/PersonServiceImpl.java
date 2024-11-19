package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IPersonDAO;
import com.cinema.dao.impl.PersonDAOImpl;
import com.cinema.entity.Person;
import com.cinema.services.IPersonService;

public class PersonServiceImpl implements IPersonService {

	IPersonDAO PersonDao = new PersonDAOImpl();
	@Override
	public List<Person> getAllPerson() {
		return PersonDao.getAllPerson();
	}

	@Override
	public Person getOnePerson(int id) {
		return PersonDao.getOnePerson(id);
	}
	@Override
	public boolean insertPerson(Person Person) {
		return PersonDao.insertPerson(Person);
	}

	@Override
	public boolean updatePerson(Person Person) {
		return PersonDao.updatePerson(Person);
		
	}

	@Override
	public boolean deletePerson(Person Person) {
		return PersonDao.deletePerson(Person);
		
	}

	@Override
	public String  getRolePerson(String email,String password) {
		Person acc = PersonDao.findByEmailAndPass(email, password);
		if(acc != null)
			return PersonDao.getRolePerson(acc.getPerID());
		else
			return "NULL";
	}
	
	@Override
	public Person findByName(String username) {
		Person acc =  PersonDao.findByName(username);
		return PersonDao.getOnePerson(acc.getPerID());
	}

	@Override
	public Person login(String email, String password) {
		Person acc =  PersonDao.findByEmail(email);
		if(acc.getPerID() != 0 && password.equals(acc.getPassword())) {
			return PersonDao.getOnePerson(acc.getPerID());
		}
		return null;
	}
	
	@Override
	public Person findByEmail(String email) {
		return PersonDao.findByEmail(email);
	}

	@Override
	public boolean checkPassword(int userID, String password) {
		Person Person=PersonDao.getOnePerson(userID);
		if(Person!=null && Person.getPassword().equals(password)) {
			return true;
		}
		return false;
	}


	
	
}
