package com.cinema.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Cinema")
public class Cinema {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cinemaID;

    @Column(nullable = false , columnDefinition = "NVARCHAR(500)")
    private String cinemaName;
    @Column(columnDefinition = "NVARCHAR(500)")
    private String address;
    @Column(columnDefinition = "NVARCHAR(500)")
    private String location;
    
    @Column(name = "status", nullable = false, columnDefinition = "BIT")
    private boolean status; // New field for cinema status using bit, named "status"

    @Column(nullable = false)
    private int roomCount; // New field for the number of rooms
    
    @OneToMany(mappedBy = "cinema" ,cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Room> rooms;

	public int getCinemaID() {
		return cinemaID;
	}

	public void setCinemaID(int cinemaID) {
		this.cinemaID = cinemaID;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}
	
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getRoomCount() {
        return roomCount;
    }

    public void setRoomCount(int roomCount) {
        this.roomCount = roomCount;
    }

    // Getters and setters
    
}
