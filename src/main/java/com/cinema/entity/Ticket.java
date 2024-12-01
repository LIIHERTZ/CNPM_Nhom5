package com.cinema.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.*;

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

    @OneToMany(mappedBy = "ticket", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<TicketPayment> ticketPayments;

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

	public List<TicketPayment> getTicketPayments() {
		return ticketPayments;
	}

	public void setTicketPayments(List<TicketPayment> ticketPayments) {
		this.ticketPayments = ticketPayments;
	}
}
