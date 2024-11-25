package com.cinema.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.IPopCornDAO;
import com.cinema.entity.PopCorn;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class PopCornDAOImpl implements IPopCornDAO{

	@Override
	public long countTotalPopCorns(String searchValue) {
		EntityManager em = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(u) FROM PopCorn u  ";
        Long count = 0L;
        if (searchValue != null && !searchValue.isEmpty())
        {
        	jpql += "WHERE u.namePopCorn LIKE :searchValue";
        }
        try {
        	TypedQuery<Long> query = em.createQuery(jpql, Long.class);
	        
	        if (searchValue != null && !searchValue.isEmpty())
	        {
	        	query.setParameter("searchValue", "%" + searchValue + "%");
	        }
	       
	        count = query.getSingleResult();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
        
        return count;
	}

	@Override
	public List<PopCorn> getPaginatedPopCorns(int page, int pageSize, String searchValue) {
		 EntityManager em = JPAConfig.getEntityManager();
	        String jpql = "SELECT u FROM PopCorn  u  "; // Truy vấn JPQL
	        if (searchValue != null && !searchValue.isEmpty())
	        {
	        	jpql += "WHERE u.namePopCorn LIKE :searchValue";
	        }
	        List<PopCorn> listPopCorn= new ArrayList<>();
	        try {
	        	
	        	 TypedQuery<PopCorn> query = em.createQuery(jpql, PopCorn.class);
	 	       // Thiết lập phân trang
	        	 if (searchValue != null && !searchValue.isEmpty()) {
	     			query.setParameter("searchValue", "%" + searchValue + "%");
	     		}

		        query.setFirstResult((page - 1) * pageSize); // Bỏ qua số bản ghi trước trang hiện tại
		        query.setMaxResults(pageSize);              // Giới hạn số bản ghi trong một trang
		        listPopCorn = query.getResultList();
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				em.close();
			}
	       
	        return listPopCorn;
	}

	@Override
	public PopCorn getOnePopCorn(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		PopCorn popcorn = new PopCorn();
		try {
			popcorn = em.find(PopCorn.class, id);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return popcorn;
	}

	@Override
	public boolean insertPopCorn(PopCorn popcorn) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = em.getTransaction();
			transaction.begin();

			em.persist(popcorn);

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
	public boolean updatePopCorn(PopCorn popcorn) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction transaction = null;

		try {
			transaction = em.getTransaction();
			transaction.begin();

			em.merge(popcorn);

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
	public boolean deletePopCorn(PopCorn popcorn) {
		EntityManager em = JPAConfig.getEntityManager();
		 EntityTransaction transaction = null;

	        try {
	            transaction = em.getTransaction();
	            transaction.begin();

	            PopCorn pop= em.find(PopCorn.class, popcorn.getPopcornID());
	            if (pop != null) {
	                // Xóa đối tượng nếu tồn tại
	                em.remove(pop);
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
	public PopCorn findByName(String name) {
		EntityManager em = JPAConfig.getEntityManager();
		String sql = "SELECT p FROM PopCorn p WHERE namePopCorn = :name";
		try {
			TypedQuery<PopCorn> query = em.createQuery(sql, PopCorn.class);
			query.setParameter("name", name);
			return query.getSingleResult();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		return null;
	}
	@Override
	public List<PopCorn> findAll() {
		EntityManager em = JPAConfig.getEntityManager();
		String query = "SELECT p FROM PopCorn p WHERE p.status = True";
		return em.createQuery(query, PopCorn.class).getResultList();
	}

	@Override
	public List<PopCorn> findByType(String type) {
		EntityManager em = JPAConfig.getEntityManager(); // Lấy EntityManager từ cấu hình
		String query = "SELECT p FROM PopCorn p WHERE p.typePopCorn = :type AND p.status = True";

		// Thực hiện truy vấn với tham số
		return em.createQuery(query, PopCorn.class)
				.setParameter("type", type)
				.getResultList();
	}

}
