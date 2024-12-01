package com.cinema.services.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.cinema.dao.IPersonDAO;
import com.cinema.dao.impl.PersonDAOImpl;
import com.cinema.entity.Person;
import com.cinema.services.IPersonService;

import com.cinema.other.City;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;

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

	@Override
	public void checkValidInfoPerson(String fullName, String email, String passSignUp, String passCheck,
			String phone, String gender, String region, String dob) {
		if (fullName == null || fullName.equals(""))
			throw new IllegalArgumentException("Họ tên không hợp lệ");
		if (passSignUp == null || passSignUp.equals(""))
			throw new IllegalArgumentException("Mật khẩu không hợp lệ");
		if (!gender.equals("1") && !gender.equals("0"))
			throw new IllegalArgumentException("Giới tính không hợp lệ");
		if (region == null || !City.getListCity().contains(region))
			throw new IllegalArgumentException("Thành phố không hợp lệ");
		if (phone == null || phone.length() != 10 || !phone.chars().allMatch(Character::isDigit))
			throw new IllegalArgumentException("Số điện thoại không hợp lệ");
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			formatter.parse(dob);
		} catch (ParseException e) {
			throw new IllegalArgumentException("Ngày sinh không hợp lệ");
		}
		try {
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
		} catch (AddressException ex) {
			throw new IllegalArgumentException("Email không hợp lệ");
		}
		if (PersonDao.findByEmail(email).getPerID() != 0)
			throw new IllegalArgumentException("Email đã tồn tại");
		if (!passSignUp.equals(passCheck))
			throw new IllegalArgumentException("Mật khẩu không trùng khớp");
		
	}

	@Override
	public void checkValidEmail(String email) {
		try {
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
		} catch (AddressException ex) {
			throw new IllegalArgumentException("Email không hợp lệ");
		}
		if (PersonDao.findByEmail(email).getPerID() == 0)
			throw new IllegalArgumentException("Email không tồn tại");
		
	}



	
	
}
