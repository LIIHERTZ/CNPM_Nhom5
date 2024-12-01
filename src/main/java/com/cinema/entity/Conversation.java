package com.cinema.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Conversation")
public class Conversation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int conversationID;

    @ManyToOne
    @JoinColumn(name = "cusID", nullable = false)
    private Person customer;

    @OneToMany(mappedBy = "conversation")
    private List<Message> messages;
    
    @ManyToOne
    @JoinColumn(name = "adminID", nullable = false)
    private Person admin;


	public int getConversationID() {
		return conversationID;
	}

	public void setConversationID(int conversationID) {
		this.conversationID = conversationID;
	}

	public Person getCustomer() {
		return customer;
	}

	public void setCustomer(Person customer) {
		this.customer = customer;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public Person getAdmin() {
		return admin;
	}

	public void setAdmin(Person admin) {
		this.admin = admin;
	}
    
    

    // Getters and setters
}