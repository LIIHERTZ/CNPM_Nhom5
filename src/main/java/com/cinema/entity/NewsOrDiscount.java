package com.cinema.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "NewsOrDiscount")
public class NewsOrDiscount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int newsID;

    @Column(nullable = false)
    private String title;

    private String description;

    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String detail;

    private String images;
    private String author;

    @Column(nullable = false)
    private Date date;

    // Getters and setters
}
