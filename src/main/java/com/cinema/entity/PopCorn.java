package com.cinema.entity;


import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PreRemove;
import jakarta.persistence.Table;

@Entity
@Table(name = "PopCorn")
public class PopCorn {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int popcornID;

    @Column(columnDefinition = "NVARCHAR(500)")
    private String namePopCorn;

    @Column(nullable = false)
    private String typePopCorn;

    @Column(nullable = false)
    private double price;

    @Column(nullable = false)
    private boolean  status;

    @OneToMany(mappedBy = "popcorn", cascade =CascadeType.ALL )
    private List<PopCornPayment> popcornPayments;
	public int getPopcornID() {
		return popcornID;
	}

	public void setPopcornID(int popcornID) {
		this.popcornID = popcornID;
	}

	public String getNamePopCorn() {
		return namePopCorn;
	}

	public void setNamePopCorn(String namePopCorn) {
		this.namePopCorn = namePopCorn;
	}

	public String getTypePopCorn() {
		return typePopCorn;
	}

	public void setTypePopCorn(String typePopCorn) {
		this.typePopCorn = typePopCorn;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}


	public boolean getStatus() {
		return status;
	}

	public boolean isStatus() {

		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<PopCornPayment> getPopcornPayments() {
		return popcornPayments;
	}

	public void setPopcornPayments(List<PopCornPayment> popcornPayments) {
		this.popcornPayments = popcornPayments;
	}



    // Getters and setters
    
    

}
