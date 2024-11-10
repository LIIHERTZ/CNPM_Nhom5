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
	 
	 @ManyToOne
	 @JoinColumn(name = "roomID")
	 private Room room;
	 
}
