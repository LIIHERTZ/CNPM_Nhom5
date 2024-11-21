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
@Table(name = "PopCorn")
public class PopCorn {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int popcornID;

    @Column(nullable = false)
    private String namePopCorn;

    @Column(nullable = false)
    private String typePopCorn;

    @Column(nullable = false)
    private double price;

    @Column(nullable = false)
    private String status;

    @OneToMany(mappedBy = "popcorn")
    private List<DetailPopCorn> detailPopCorns;

    // Getters and setters
}
