package com.cinema.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Room")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int roomID;

    @Column(nullable = false , columnDefinition = "NVARCHAR(500)")
    private String roomName;

    @Column(nullable = false , columnDefinition = "NVARCHAR(500)")
    private String screenType;
    
    
    private Integer chairNumber;
    
    @Column(name = "status", nullable = false, columnDefinition = "BIT")
    private boolean status; // New field for cinema status using bit, named "status"
    

    @ManyToOne
    @JoinColumn(name = "cinemaID", nullable = false)
    private Cinema cinema;

    public int getRoomID() {
		return roomID;
	}

	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getScreenType() {
		return screenType;
	}

	public void setScreenType(String screenType) {
		this.screenType = screenType;
	}

	public Integer getChairNumber() {
		return chairNumber;
	}

	public void setChairNumber(Integer chairNumber) {
		this.chairNumber = chairNumber;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}


	public Cinema getCinema() {
		return cinema;
	}

	public void setCinema(Cinema cinema) {
		this.cinema = cinema;
	}

	public List<MovieScreenings> getMovieScreenings() {
		return movieScreenings;
	}

	public void setMovieScreenings(List<MovieScreenings> movieScreenings) {
		this.movieScreenings = movieScreenings;
	}

	@OneToMany(mappedBy = "room", fetch = FetchType.LAZY)
    private List<MovieScreenings> movieScreenings;

    // Getters and setters
}
