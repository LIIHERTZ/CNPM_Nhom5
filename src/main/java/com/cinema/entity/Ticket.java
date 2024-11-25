package com.cinema.entity;

import java.sql.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PreRemove;
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
    private Date date;

    @Column(nullable = false)
    private String placeName;

    @Column(nullable = false)
    private String versionName;

    @Column(nullable = false)
    private String chairNumber;

    @ManyToOne
    @JoinColumn(name = "msID")
    private MovieScreenings movieScreenings;

    @OneToMany(mappedBy = "ticket",orphanRemoval = false)
    private List<TicketPayment> ticketPayments;
    @PreRemove
    private void preRemove() {
        // Hủy liên kết với tất cả các Payment trước khi xóa Coupon
        for (TicketPayment ticketPayment : ticketPayments) {
        	ticketPayment.setTicket(null);
        }
    }
	public List<TicketPayment> getTicketPayments() {
		return ticketPayments;
	}

	public void setTicketPayments(List<TicketPayment> ticketPayments) {
		this.ticketPayments = ticketPayments;
	}

	public int getTicketID() {
		return ticketID;
	}

	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}

	public double getPriceTicket() {
		return priceTicket;
	}

	public void setPriceTicket(double priceTicket) {
		this.priceTicket = priceTicket;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getVersionName() {
		return versionName;
	}

	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}

	public String getChairNumber() {
		return chairNumber;
	}

	public void setChairNumber(String chairNumber) {
		this.chairNumber = chairNumber;
	}

	public MovieScreenings getMovieScreenings() {
		return movieScreenings;
	}

	public void setMovieScreenings(MovieScreenings movieScreenings) {
		this.movieScreenings = movieScreenings;
	}


    // Getters and setters
    
    
}
