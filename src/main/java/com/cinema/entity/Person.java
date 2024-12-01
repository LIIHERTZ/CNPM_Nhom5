package com.cinema.entity;

import java.util.List;
import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "Person")
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected int perID;

    @Column(columnDefinition = "nvarchar(50)", nullable = true) // Cho phép null
    protected String fullName;

    @Column(nullable = false, unique = true, columnDefinition = "nvarchar(50)") // email vẫn không cho phép null
    protected String email;

    @Column(nullable = false, columnDefinition = "nvarchar(50)") // password vẫn không cho phép null
    protected String password;

    @Column(columnDefinition = "nvarchar(15)", nullable = true) // Cho phép null
    protected String phone;

    @Column(columnDefinition = "nvarchar(20)", nullable = true) // Cho phép null
    protected String role;

    @Column(nullable = true) // Cho phép null
    protected Integer gender; // Sử dụng Integer thay vì int để cho phép null

    @Column(nullable = true) // Cho phép null
    protected Date birthDate;

    @Column(columnDefinition = "nvarchar(50)", nullable = true) // Cho phép null
    protected String region;

    @OneToMany(mappedBy = "person", cascade = CascadeType.ALL)
    private List<Review> reviews;

    @OneToMany(mappedBy = "person", cascade = CascadeType.ALL)
    private List<Payment> payments;

    @OneToMany(mappedBy = "person", cascade = CascadeType.ALL)
    private List<Message> messages;
    

    // Getters và Setters
    public int getPerID() {
        return perID;
    }

    public void setPerID(int perID) {
        this.perID = perID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }
}

