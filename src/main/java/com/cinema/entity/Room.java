package com.cinema.entity;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "Room")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int roomID;

    @Column(nullable = false)
    private String roomName;

    @Column(nullable = false)
    private String screenType;
    
    private Integer chairNumber;

	@Column(name = "status", nullable = false, columnDefinition = "BIT")
	private boolean status; // New field for cinema status using bit, named "status"
    
    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Seat> seat;

    @ManyToOne
    @JoinColumn(name = "cinemaID", nullable = false)
    private Cinema cinema;

    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<MovieScreenings> movieScreenings;

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<Seat> getSeat() {
		return seat;
	}

	public void setSeat(List<Seat> seat) {
		this.seat = seat;
	}

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

    // Getters and setters
}
