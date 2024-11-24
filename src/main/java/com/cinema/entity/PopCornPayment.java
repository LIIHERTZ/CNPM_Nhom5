package com.cinema.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
@Entity
@Table(name = "PopcornPayment")
public class PopCornPayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int detailPopCornID;

    @ManyToOne
    @JoinColumn(name = "paymentID", nullable = false)
    private Payment payment;

    @ManyToOne
    @JoinColumn(name = "popcornID", nullable = false)
    private PopCorn popcorn;

    @Column(nullable = false)
    private int quantity;

    // Getters and setters
}
