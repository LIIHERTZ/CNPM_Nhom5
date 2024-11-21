package com.cinema.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "chair")
public class Chair {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int chairID;
	 
	 private String chairName;
	 
	 private Boolean status;
	 
	 public int getChairID() {
		return chairID;
	}

	public void setChairID(int chairID) {
		this.chairID = chairID;
	}

	public String getChairName() {
		return chairName;
	}

	public void setChairName(String chairName) {
		this.chairName = chairName;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@ManyToOne
	 @JoinColumn(name = "roomID")
	 private Room room;
	 
}
