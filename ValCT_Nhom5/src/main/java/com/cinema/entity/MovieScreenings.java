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

    @ManyToOne
    @JoinColumn(name = "roomID", nullable = false)
    private Room room;

    @ManyToOne
    @JoinColumn(name = "movieID", nullable = false)
    private Movie movie;

    @OneToMany(mappedBy = "movieScreenings")
    private List<Ticket> tickets;

    // Getters and setters
}
