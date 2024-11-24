package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Person;

public interface IPersonDAO {
	List<Person> getAllPerson();
	Person getOnePerson(int id); 
	boolean insertPerson(Person Person); 
	boolean updatePerson(Person Person); 
	boolean deletePerson(Person Person); 
	String getRolePerson(int id);
	Person findByEmailAndPass(String email,String password);
	Person findByName(String username);
	Person findByEmail(String email);
	
	
}
