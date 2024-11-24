package com.cinema.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ticketID;

    @Column(nullable = false)
    private double priceTicket;

    @Column(nullable = false)
    private String date;

    @Column(nullable = false)
    private String placeName;

    @Column(nullable = false)
    private String versionName;

    @Column(nullable = false)
    private String chairNumber;

    @ManyToOne
    @JoinColumn(name = "msID")
    private MovieScreenings movieScreenings;

    @OneToMany(mappedBy = "ticket")
    private List<TicketPayment> detailTickets;
    // Getters and setters

}
