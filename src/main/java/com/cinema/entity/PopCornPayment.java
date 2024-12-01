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
    private int paymentPopCornID;

    @ManyToOne
    @JoinColumn(name = "paymentID", nullable = false)
    private Payment payment;

    @ManyToOne
    @JoinColumn(name = "popcornID", nullable = false)
    private PopCorn popcorn;

    @Column(nullable = false)
    private int quantity;


    

	public int getPaymentPopCornID() {
		return paymentPopCornID;
	}

	public void setPaymentPopCornID(int paymentPopCornID) {
		this.paymentPopCornID = paymentPopCornID;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public PopCorn getPopcorn() {
		return popcorn;
	}

	public void setPopcorn(PopCorn popcorn) {
		this.popcorn = popcorn;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

    // Getters and setters
    
}
