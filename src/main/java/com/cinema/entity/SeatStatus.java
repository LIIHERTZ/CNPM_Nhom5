package com.cinema.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "SeatStatus")
public class SeatStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int seatStatusId;

    @ManyToOne
    @JoinColumn(name = "seat_id", nullable = false)
    private Seat seat;

    @ManyToOne
    @JoinColumn(name = "screening_id", nullable = false)
    private MovieScreenings screening;

    @Column(name = "status", nullable = false)
    private boolean status;

    // Getters and Setters
    public int getSeatStatusId() {
        return seatStatusId;
    }

    public void setSeatStatusId(int seatStatusId) {
        this.seatStatusId = seatStatusId;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public MovieScreenings getScreening() {
        return screening;
    }

    public void setScreening(MovieScreenings screening) {
        this.screening = screening;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
