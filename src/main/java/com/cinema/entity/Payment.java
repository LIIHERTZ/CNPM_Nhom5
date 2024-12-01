package com.cinema.entity;


import java.util.Date;
import java.util.List;

import jakarta.persistence.*;

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
    @JoinColumn(name = "couponID", nullable = true)
    private Coupon coupon;

    private double totalPrice;
    private Date createdDate;
    private int status;

    @OneToMany(mappedBy = "payment", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<TicketPayment> ticketPayments;

    @OneToMany(mappedBy = "payment", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<PopCornPayment> popCornPayments;

	public int getPaymentID() {
		return paymentID;
	}

	public void setPaymentID(int paymentID) {
		this.paymentID = paymentID;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

    public List<TicketPayment> getTicketPayments() {
        return ticketPayments;
    }

    public void setTicketPayments(List<TicketPayment> ticketPayments) {
        this.ticketPayments = ticketPayments;
    }

    public List<PopCornPayment> getPopCornPayments() {
        return popCornPayments;
    }

    public void setPopCornPayments(List<PopCornPayment> popCornPayments) {
        this.popCornPayments = popCornPayments;
    }
}
