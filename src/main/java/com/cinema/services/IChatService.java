package com.cinema.services;

import java.util.List;

import com.cinema.entity.Conversation;
import com.cinema.entity.Message;
import com.cinema.entity.Person;

public interface IChatService {
    List<Person> getAllCustomers(); // Lấy danh sách khách hàng
    Conversation findOrCreateConversation(int customerId); // Tìm hoặc tạo Conversation
    List<Message> getMessagesByConversationId(int conversationId); // Lấy tin nhắn của một Conversation
    
    public Conversation getConversationById(int conversationId);
    public Person getPersonById(int personId);
    public boolean saveMessage(Message message);
}