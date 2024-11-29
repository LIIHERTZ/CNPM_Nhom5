package com.cinema.dao;

import java.util.List;

import com.cinema.entity.Conversation;
import com.cinema.entity.Message;
import com.cinema.entity.Person;

public interface IChatDao {
    List<Person> findPersonsByRole(String role); // Lấy danh sách Person theo role
    Conversation findOrCreateConversation(int customerId); // Tìm hoặc tạo Conversation
    List<Message> findMessagesByConversationId(int conversationId); // Lấy tin nhắn theo Conversation ID
    
    public Conversation getConversationById(int conversationId);
    public Person getPersonById(int personId);
    public boolean saveMessage(Message message);
}