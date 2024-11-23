package com.cinema.entity;

import java.sql.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Movie")
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int movieID;

    @Column(nullable = false)
    private String movieName;

    @Column(nullable = false)
    private String category;

    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String description;

    private String image;
    private String movieDuration;
    
    @Column(nullable = false)
    private Date releaseDay;

    @Column(nullable = false, columnDefinition = "BIT DEFAULT 1")
    private boolean status;

    @OneToMany(mappedBy = "movie")
    private List<MovieScreenings> movieScreenings;

    @OneToMany(mappedBy = "movie")
    private List<Review> reviews;

	public int getMovieID() {
		return movieID;
	}

	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMovieDuration() {
		return movieDuration;
	}

	public void setMovieDuration(String movieDuration) {
		this.movieDuration = movieDuration;
	}

	public Date getReleaseDay() {
		return releaseDay;
	}

	public void setReleaseDay(Date releaseDay) {
		this.releaseDay = releaseDay;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<MovieScreenings> getMovieScreenings() {
		return movieScreenings;
	}

	public void setMovieScreenings(List<MovieScreenings> movieScreenings) {
		this.movieScreenings = movieScreenings;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	
    
}