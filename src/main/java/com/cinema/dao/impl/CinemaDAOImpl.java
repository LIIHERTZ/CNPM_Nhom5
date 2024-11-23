package com.cinema.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.cinema.configs.JPAConfig;
import com.cinema.dao.ICinemaDAO;
import com.cinema.entity.Cinema;
import com.cinema.entity.MovieScreenings;
import com.cinema.entity.Person;
import com.cinema.entity.Cinema;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class CinemaDAOImpl implements ICinemaDAO {

	@Override
    public List<Cinema> getAllCinema() {
        EntityManager em = JPAConfig.getEntityManager();
        List<Cinema> listCinema = new ArrayList<>();

        try {
            String jpql = "SELECT c FROM Cinema c";
            TypedQuery<Cinema> query = em.createQuery(jpql, Cinema.class);
            listCinema = query.getResultList();
        } catch (Exception e) {
            System.err.println("Error retrieving cinemas: " + e.getMessage());
        } finally {
            em.close();
        }

        return listCinema;
    }

    @Override
    public Cinema getOneCinema(int id) {
        return getCinemaById(id);
    }

    @Override
    public boolean insertCinema(Cinema cinema) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(cinema);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.err.println("Error inserting cinema: " + e.getMessage());
        } finally {
            em.close();
        }
        return false;
    }

    @Override
    public boolean updateCinema(Cinema cinema) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(cinema);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.err.println("Error updating cinema: " + e.getMessage());
        } finally {
            em.close();
        }
        return false;
    }

    @Override
    public boolean deleteCinema(int cinemaId) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            Cinema cinema = em.find(Cinema.class, cinemaId);
            if (cinema != null) {
                em.remove(cinema);
                em.getTransaction().commit();
                return true;
            }
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.err.println("Error deleting cinema: " + e.getMessage());
        } finally {
            em.close();
        }
        return false;
    }

    @Override
    public List<Cinema> getCinemaByLocation(String location) {
        EntityManager em = JPAConfig.getEntityManager();
        List<Cinema> listCinema = new ArrayList<>();
        try {
            String jpql = "SELECT c FROM Cinema c WHERE c.location = :location";
            TypedQuery<Cinema> query = em.createQuery(jpql, Cinema.class);
            query.setParameter("location", location);
            listCinema = query.getResultList();
        } catch (Exception e) {
            System.err.println("Error retrieving cinemas by location: " + e.getMessage());
        } finally {
            em.close();
        }
        return listCinema;
    }

    @Override
    public Cinema getCinemaById(int id) {
        EntityManager em = JPAConfig.getEntityManager();
        Cinema cinema = null;
        try {
            cinema = em.find(Cinema.class, id);
        } catch (NoResultException e) {
            System.err.println("No cinema found with id: " + id);
        } finally {
            em.close();
        }
        return cinema;
    }

    @Override
    public List<Cinema> getCinemas(int offset, int noOfRecords) {
        EntityManager em = JPAConfig.getEntityManager();
        List<Cinema> listCinema = new ArrayList<>();
        try {
            String jpql = "SELECT c FROM Cinema c";
            TypedQuery<Cinema> query = em.createQuery(jpql, Cinema.class);
            query.setFirstResult(offset);
            query.setMaxResults(noOfRecords);
            listCinema = query.getResultList();
        } catch (Exception e) {
            System.err.println("Error retrieving paginated cinemas: " + e.getMessage());
        } finally {
            em.close();
        }
        return listCinema;
    }

    @Override
    public int getNoOfRecords() {
        EntityManager em = JPAConfig.getEntityManager();
        int noOfRecords = 0;
        try {
            String jpql = "SELECT COUNT(c) FROM Cinema c";
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            noOfRecords = query.getSingleResult().intValue();
        } catch (Exception e) {
            System.err.println("Error retrieving number of records: " + e.getMessage());
        } finally {
            em.close();
        }
        return noOfRecords;
    }

//    @Override
//    public List<Cinema> searchCinemas(String keyword) {
//        EntityManager em = JPAConfig.getEntityManager();
//        List<Cinema> listCinema = new ArrayList<>();
//        try {
//            String jpql = "SELECT c FROM Cinema c WHERE c.location LIKE :keyword";
//            TypedQuery<Cinema> query = em.createQuery(jpql, Cinema.class);
//            query.setParameter("keyword", "%" + keyword + "%");
//            listCinema = query.getResultList();
//        } catch (Exception e) {
//            System.err.println("Error searching cinemas: " + e.getMessage());
//        } finally {
//            em.close();
//        }
//        return listCinema;
//    }
    @Override
    public List<Cinema> searchCinemas(String keyword, int offset, int limit) {
        EntityManager em = JPAConfig.getEntityManager();
        List<Cinema> listCinema = new ArrayList<>();
        try {
            // Truy vấn với LIKE để tìm kiếm theo từ khóa và LIMIT/OFFSET để phân trang
            String jpql = "SELECT c FROM Cinema c WHERE c.location LIKE :keyword";
            TypedQuery<Cinema> query = em.createQuery(jpql, Cinema.class);
            query.setParameter("keyword", "%" + keyword + "%");

            // Áp dụng phân trang
            query.setFirstResult(offset);  // offset: bắt đầu từ đâu
            query.setMaxResults(limit);    // limit: số bản ghi trả về

            listCinema = query.getResultList();
        } catch (Exception e) {
            System.err.println("Error searching cinemas: " + e.getMessage());
        } finally {
            em.close();
        }
        return listCinema;
    }
    @Override
    public int getNoOfSearchResults(String keyword) {
        EntityManager em = JPAConfig.getEntityManager();
        int count = 0;
        try {
            // Truy vấn đếm số lượng kết quả tìm kiếm theo từ khóa
            String jpql = "SELECT COUNT(c) FROM Cinema c WHERE c.location LIKE :keyword";
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            query.setParameter("keyword", "%" + keyword + "%");
            
            // Lấy kết quả đếm
            count = query.getSingleResult().intValue();
        } catch (Exception e) {
            System.err.println("Error counting search results: " + e.getMessage());
        } finally {
            em.close();
        }
        return count;
    }
    
    
    @Override
    public List<Cinema> getAllCinemas(int offset, int recordsPerPage) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT c FROM Cinema c";
            return em.createQuery(jpql, Cinema.class)
                    .setFirstResult(offset)
                    .setMaxResults(recordsPerPage)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public int getTotalNumberOfCinemas() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(c) FROM Cinema c";
            Long count = em.createQuery(jpql, Long.class).getSingleResult();
            return count.intValue();
        } finally {
            em.close();
        }
    }

    public List<Cinema> searchCinemasByLocation(String location, int offset, int limit) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT c FROM Cinema c WHERE c.location = :location";
            return em.createQuery(jpql, Cinema.class)
                     .setParameter("location", location)
                     .setFirstResult(offset)
                     .setMaxResults(limit)
                     .getResultList();
        } finally {
            em.close();
        }
    }




}
