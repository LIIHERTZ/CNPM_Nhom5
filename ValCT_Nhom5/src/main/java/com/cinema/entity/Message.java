package com.cinema.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name = "Message")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int messageID;

    @ManyToOne
    @JoinColumn(name = "conversationID")
    private Conversation conversation;

    @ManyToOne
    @JoinColumn(name = "senderID", nullable = false)
    private Person person;

    @Column(nullable = false, columnDefinition = "NVARCHAR(MAX)")
    private String content;

    @Column(nullable = false)
    private Date date;

    // Getters and setters
}
