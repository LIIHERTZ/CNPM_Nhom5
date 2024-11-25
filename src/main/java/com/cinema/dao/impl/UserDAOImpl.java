package com.cinema.dao.impl;
import java.util.ArrayList;
import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.*;
import com.cinema.entity.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import jakarta.persistence.EntityManager;
public class UserDAOImpl  implements IUserDAO{
	String role = "User";
	 @Override
	public List<Person> getPaginatedUsers(int page, int pageSize,String searchValue) {
		 
		 EntityManager em = JPAConfig.getEntityManager();
	        String jpql = "SELECT u FROM Person  u WHERE role = :role "; // Truy vấn JPQL
	        if (searchValue != null && !searchValue.isEmpty())
	        {
	        	jpql += "AND u.fullName LIKE :searchValue";
	        }
	        List<Person> listPerson = new ArrayList<>();
	        try {
	        	
	        	 TypedQuery<Person> query = em.createQuery(jpql, Person.class);
	 	        query.setParameter("role", role);
	 	       // Thiết lập phân trang
	        	 if (searchValue != null && !searchValue.isEmpty()) {
	     			query.setParameter("searchValue", "%" + searchValue + "%");
	     		}

		        query.setFirstResult((page - 1) * pageSize); // Bỏ qua số bản ghi trước trang hiện tại
		        query.setMaxResults(pageSize);              // Giới hạn số bản ghi trong một trang
		        listPerson = query.getResultList();
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				em.close();
			}
	       
	        return listPerson;
	    }

	    // Đếm tổng số bản ghi
	    @Override
		public long countTotalUsers(String searchValue) {
	    	EntityManager em = JPAConfig.getEntityManager();
	        String jpql = "SELECT COUNT(u) FROM Person u WHERE role = :role ";
	        Long count = 0L;
	        if (searchValue != null && !searchValue.isEmpty())
	        {
	        	jpql += "AND u.fullName LIKE :searchValue";
	        }
	        try {
	        	TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		        
		        if (searchValue != null && !searchValue.isEmpty())
		        {
		        	query.setParameter("searchValue", "%" + searchValue + "%");
		        }
		        query.setParameter("role", role);
		       
		        count = query.getSingleResult();
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				em.close();
			}
	        
	        return count;
	    }



}
