package com.cinema.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "TicketPayment")
public class TicketPayment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int detailTicketID;

    @ManyToOne
    @JoinColumn(name = "paymentID", nullable = false)
    private Payment payment;

    @ManyToOne
    @JoinColumn(name = "ticketID", nullable = false)
    private Ticket ticket;

	public int getDetailTicketID() {
		return detailTicketID;
	}

	public void setDetailTicketID(int detailTicketID) {
		this.detailTicketID = detailTicketID;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

    // Getters and setters
}
