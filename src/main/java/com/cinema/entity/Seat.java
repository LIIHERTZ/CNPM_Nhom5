package com.cinema.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "Seat")
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int seatID;

    @Column(name = "seat_number", nullable = false)
    private String seatNumber;

    @ManyToOne
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    @OneToMany(mappedBy = "seat", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SeatStatus> seatStatuses;

    @Column(name = "isCouple", nullable = false)
    private boolean isCouple = false;

    // Getters and Setters
    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public List<SeatStatus> getSeatStatuses() {
        return seatStatuses;
    }

    public void setSeatStatuses(List<SeatStatus> seatStatuses) {
        this.seatStatuses = seatStatuses;
    }

    public boolean isCouple() {
        return isCouple;
    }

    public void setCouple(boolean isCouple) {
        this.isCouple = isCouple;
    }
}
