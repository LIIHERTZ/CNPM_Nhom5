package com.cinema.services.impl;

import java.util.List;

import com.cinema.dao.IChatDao;
import com.cinema.dao.impl.ChatDaoImpl;
import com.cinema.entity.Conversation;
import com.cinema.entity.Message;
import com.cinema.entity.Person;
import com.cinema.services.IChatService;

public class ChatServiceImpl implements IChatService {
	
	IChatDao chatDao = new ChatDaoImpl();

    @Override
    public List<Person> getAllCustomers() {
        return chatDao.findPersonsByRole("User"); // Lấy tất cả khách hàng
    }

    @Override
    public Conversation findOrCreateConversation(int customerId) {
        return chatDao.findOrCreateConversation(customerId);
    }

    @Override
    public List<Message> getMessagesByConversationId(int conversationId) {
        return chatDao.findMessagesByConversationId(conversationId);
    }

	@Override
	public Conversation getConversationById(int conversationId) {
		return chatDao.getConversationById(conversationId);
	}

	@Override
	public Person getPersonById(int personId) {
		return chatDao.getPersonById(personId);
	}

	@Override
	public boolean saveMessage(Message message) {
		return chatDao.saveMessage(message);
	}
}