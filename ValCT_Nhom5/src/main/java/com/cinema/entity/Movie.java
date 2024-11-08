package com.cinema.entity;

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

    @OneToMany(mappedBy = "movie")
    private List<MovieScreenings> movieScreenings;

    @OneToMany(mappedBy = "movie")
    private List<Review> reviews;

    // Getters and setters
}
