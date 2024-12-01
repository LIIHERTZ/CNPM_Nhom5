package com.cinema.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;

@Entity
@Table(name = "NewsOrDiscount")
@NamedQuery(name = "NewsOrDiscount.findAll", query = "SELECT n FROM NewsOrDiscount n")
public class NewsOrDiscount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int newsID;

    @Column(columnDefinition = "NVARCHAR(500)")
    private String title;

    @Column(columnDefinition = "NVARCHAR(500)")
    private String description;

    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String detail;

    @Column(columnDefinition = "NVARCHAR(500)")
    private String images;
    @Column(columnDefinition = "NVARCHAR(500)")
    private String author;

    @Column(nullable = false)
    private Date date;

	public NewsOrDiscount() {
	
	}

	public int getNewsID() {
		return newsID;
	}

	public void setNewsID(int newsID) {
		this.newsID = newsID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
    
	
    

    // Getters and setters
}
