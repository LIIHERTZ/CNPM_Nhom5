package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IPersonDAO;
import com.cinema.dao.impl.PersonDAOImpl;
import com.cinema.entity.Person;
import com.cinema.services.IPersonService;

public class PersonServiceImpl implements IPersonService {

	IPersonDAO personDao = new PersonDAOImpl();
	@Override
	public List<Person> getAllPerson() {
		return personDao.getAllPerson();
	}

	@Override
	public Person getOnePerson(int id) {
		return personDao.getOnePerson(id);
	}
	@Override
	public boolean insertPerson(Person person) {
		return personDao.insertPerson(person);
	}

	@Override
	public boolean updatePerson(Person person) {
		return personDao.updatePerson(person);
		
	}

	@Override
	public boolean deletePerson(Person person) {
		return personDao.deletePerson(person);
		
	}

	@Override
	public String  getRolePerson(String email,String password) {
		Person acc = personDao.findByEmailAndPass(email, password);
		if(acc != null)
			return personDao.getRolePerson(acc.getPerID());
		else
			return "NULL";
	}
	
	@Override
	public Person findByName(String username) {
		Person acc =  personDao.findByName(username);
		return personDao.getOnePerson(acc.getPerID());
	}

	@Override
	public Person login(String email, String password) {
		Person acc =  personDao.findByEmail(email);
		if(acc.getPerID() != 0 && password.equals(acc.getPassword())) {
			return personDao.getOnePerson(acc.getPerID());
		}
		return null;
	}
	
	@Override
	public Person findByEmail(String email) {
		return personDao.findByEmail(email);
	}

	@Override
	public boolean checkPassword(int userID, String password) {
		Person Person=personDao.getOnePerson(userID);
		if(Person!=null && Person.getPassword().equals(password)) {
			return true;
		}
		return false;
	}


	
	
}
