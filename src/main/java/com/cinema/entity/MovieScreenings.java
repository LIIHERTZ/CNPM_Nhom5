package com.cinema.entity;

import java.util.Date;
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
@Table(name = "MovieScreenings")
public class MovieScreenings {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int msID;

    @Column(nullable = false)
    private Date startHour;

    @Column(nullable = false)
    private Date endHour;
    
    @Column(name = "status", nullable = false, columnDefinition = "BIT")
    private boolean status; // New field for cinema status using bit, named "status"

    @ManyToOne
    @JoinColumn(name = "roomID", nullable = false)
    private Room room;

    @ManyToOne
    @JoinColumn(name = "movieID", nullable = false)
    private Movie movie;

    public int getMsID() {
		return msID;
	}

	public void setMsID(int msID) {
		this.msID = msID;
	}

	public Date getStartHour() {
		return startHour;
	}

	public void setStartHour(Date startHour) {
		this.startHour = startHour;
	}

	public Date getEndHour() {
		return endHour;
	}

	public void setEndHour(Date endHour) {
		this.endHour = endHour;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public List<Ticket> getTickets() {
		return tickets;
	}

	public void setTickets(List<Ticket> tickets) {
		this.tickets = tickets;
	}

	@OneToMany(mappedBy = "movieScreenings")
    private List<Ticket> tickets;

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

    // Getters and setters
}
