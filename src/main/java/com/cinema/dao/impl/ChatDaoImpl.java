package com.cinema.dao.impl;

import java.util.List;

import com.cinema.dao.IChatDao;
import com.cinema.entity.Conversation;
import com.cinema.entity.Message;
import com.cinema.entity.Person;
import com.cinema.configs.JPAConfig;

import jakarta.persistence.EntityManager;

public class ChatDaoImpl implements IChatDao {

    @Override
    public List<Person> findPersonsByRole(String role) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return em.createQuery("SELECT p FROM Person p WHERE p.role = :role", Person.class)
                     .setParameter("role", role)
                     .getResultList();
        } finally {
            em.close(); // Đóng EntityManager để tránh rò rỉ tài nguyên
        }
    }

    @Override
    public Conversation findOrCreateConversation(int customerId) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin(); // Bắt đầu transaction

            // Tìm conversation
            Conversation conversation = em.createQuery(
                    "SELECT c FROM Conversation c WHERE c.customer.perID = :customerId", Conversation.class)
                    .setParameter("customerId", customerId)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);

            // Nếu không tồn tại, tạo mới
            if (conversation == null) {
                Person customer = em.find(Person.class, customerId); // Tìm thông tin khách hàng
                if (customer == null) {
                    throw new IllegalArgumentException("Customer with ID " + customerId + " not found.");
                }
                
             // Tìm admin mặc định
                Person admin = em.createQuery(
                        "SELECT p FROM Person p WHERE p.role = :role", Person.class)
                        .setParameter("role", "admin")
                        .setMaxResults(1) // Chỉ lấy 1 admin
                        .getSingleResult();

                if (admin == null) {
                    throw new IllegalStateException("No admin found in the database.");
                }
                
                conversation = new Conversation();
                conversation.setCustomer(customer);
                conversation.setAdmin(admin);
                em.persist(conversation); // Lưu conversation mới
            }

            em.getTransaction().commit(); // Commit transaction
            return conversation;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback(); // Rollback nếu xảy ra lỗi
            }
            throw e; // Ném lại ngoại lệ
        } finally {
            em.close(); // Đóng EntityManager
        }
    }

    @Override
    public List<Message> findMessagesByConversationId(int conversationId) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return em.createQuery("SELECT m FROM Message m WHERE m.conversation.conversationID = :conversationId ORDER BY m.date ASC", Message.class)
                     .setParameter("conversationId", conversationId)
                     .getResultList();
        } finally {
            em.close(); // Đóng EntityManager
        }
    }

	@Override
	public Conversation getConversationById(int conversationId) {
		EntityManager em = JPAConfig.getEntityManager();
	    try {
	        return em.find(Conversation.class, conversationId);
	    } finally {
	        em.close();
	    }
	}

	@Override
	public Person getPersonById(int personId) {
		EntityManager em = JPAConfig.getEntityManager();
	    try {
	        return em.find(Person.class, personId);
	    } finally {
	        em.close();
	    }
	}

	@Override
	public boolean saveMessage(Message message) {
		EntityManager em = JPAConfig.getEntityManager();
	    try {
	        em.getTransaction().begin();
	        em.persist(message);
	        em.getTransaction().commit();
	        return true;
	    } catch (Exception e) {
	        em.getTransaction().rollback();
	        e.printStackTrace();
	        return false;
	    } finally {
	        em.close();
	    }
	}
}