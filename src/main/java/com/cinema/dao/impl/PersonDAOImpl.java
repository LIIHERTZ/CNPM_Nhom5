package com.cinema.dao.impl;


import java.util.ArrayList;
import java.util.List;

import com.cinema.dao.IPersonDAO;
import com.cinema.entity.Person;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import com.cinema.configs.JPAConfig;

public class PersonDAOImpl implements IPersonDAO {

	@Override
	public List<Person> getAllPerson() {
		EntityManager em = JPAConfig.getEntityManager();
		String sql = "SELECT p FROM Person p";
		List<Person> listPerson = new ArrayList<>();
		try {
			TypedQuery<Person> query = em.createQuery(sql, Person.class);
			listPerson = query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return listPerson;
	}

	@Override
	public Person getOnePerson(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		Person account = new Person();
		try {
			account = em.find(Person.class, id);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return account;
	}

	@Override
	public boolean insertPerson(Person Person) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = em.getTransaction();
			transaction.begin();

			em.persist(Person);

			transaction.commit();
			return true;

		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback(); // Rollback nếu có lỗi
			}
			System.out.println(e);
			return false;

		} finally {
			em.close();
		}
	}

	@Override
	public boolean updatePerson(Person person) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = em.getTransaction();
			transaction.begin();

			em.merge(person);

			transaction.commit();
			return true;

		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback(); // Rollback nếu có lỗi
			}
			System.out.println(e);
			return false;

		} finally {
			em.close();
		}

	}

	@Override
	public boolean deletePerson(Person person) {
		EntityManager em = JPAConfig.getEntityManager();
		 EntityTransaction transaction = null;

	        try {
	            transaction = em.getTransaction();
	            transaction.begin();

	            Person account = em.find(Person.class, person.getPerID());
	            if (account != null) {
	                // Xóa đối tượng nếu tồn tại
	                em.remove(account);
	            }

	            transaction.commit();
	            return true;

	        } catch (Exception e) {
	            if (transaction != null && transaction.isActive()) {
	                transaction.rollback(); // Hoàn tác nếu có lỗi
	            }
	            System.out.println(e);
	            return false;

	        } finally {
	            em.close();
	        }
	}

	@Override
	public String getRolePerson(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		String sql = "SELECT role FROM person WHERE perID= :id";
		String role = "";

        try {
            TypedQuery<String> query = em.createQuery(sql, String.class);
            query.setParameter("perId", id);

            // Lấy kết quả nếu có
            role = query.getSingleResult();

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }

        return role;
	}

	@Override
	public Person findByEmailAndPass(String email, String password) {
		EntityManager em = JPAConfig.getEntityManager();
		Person person = new Person();
		try {
            // Sử dụng JPQL để tìm đối tượng Person theo username và password
            String jpql = "SELECT * FROM ACCOUNT WHERE email= :email AND Password= :password";
            TypedQuery<Person> query = em.createQuery(jpql, Person.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            // Lấy kết quả
            person = query.getSingleResult();
            
        } catch (NoResultException e) {
            System.out.println("No user found with the provided username and password.");
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }

        return person;
	}

	@Override
	public Person findByName(String username) {
		EntityManager em = JPAConfig.getEntityManager();
		Person person = new Person();
		try {
            // Sử dụng JPQL để tìm đối tượng Person theo username
            String jpql = "SELECT * FROM Person WHERE fullName = :username";
            TypedQuery<Person> query = em.createQuery(jpql, Person.class);
            query.setParameter("fullName", username);

            // Lấy kết quả nếu tìm thấy
            person = query.getSingleResult();

        } catch (NoResultException e) {
            // Không tìm thấy kết quả
            System.out.println("No user found with the provided username.");
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }

        return person;
	}

	@Override
	public Person findByEmail(String email) {
		EntityManager em = JPAConfig.getEntityManager();
		Person person = new Person();
		try {
            // Sử dụng JPQL để tìm đối tượng Person thông qua User email
			String jpql = "SELECT p FROM Person p WHERE p.email = :email";
            TypedQuery<Person> query = em.createQuery(jpql, Person.class);
            query.setParameter("email", email);

            // Lấy kết quả nếu có
            person = query.getSingleResult();

        } catch (NoResultException e) {
            // Không tìm thấy kết quả
            System.out.println("No user found with the provided email.");
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }

        return person;
	}


}
