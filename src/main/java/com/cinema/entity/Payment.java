package com.cinema.entity;


import java.sql.Date;
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
@Table(name = "Payment")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int paymentID;

    @ManyToOne
    @JoinColumn(name = "perID", nullable = false)
    private Person person;

    @ManyToOne
    @JoinColumn(name = "couponID")
    private Coupon coupon;

    private double totalPrice;
    private Date createdDate;
    private int status;

    @OneToMany(mappedBy = "payment")
    private List<TicketPayment> ticketPayments;

    @OneToMany(mappedBy = "payment")
    private List<PopCornPayment> popcornPayments;

	
    // Getters and setters
}
