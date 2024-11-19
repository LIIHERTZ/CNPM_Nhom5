package com.cinema.services;

import java.util.List;

import com.cinema.entity.Person;


public interface IPersonService {
	List<Person> getAllPerson();
	Person getOnePerson(int id); 
	boolean insertPerson(Person Person); 
	boolean updatePerson(Person Person); 
	boolean deletePerson(Person Person); 
	String getRolePerson(String email,String password);
	Person findByName(String username);
	Person login(String email,String password);
	Person findByEmail(String email);
	boolean checkPassword(int perID, String password);
	void checkValidInfoPerson(String fullName, String email, String passSignUp, String passCheck,
			String phone, String gender, String region, String dob);
	void checkValidEmail(String email);
}
