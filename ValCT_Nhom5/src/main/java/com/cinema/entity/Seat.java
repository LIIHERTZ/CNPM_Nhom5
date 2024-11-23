package com.cinema.entity;

import java.util.List;

import jakarta.persistence.*;
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
	    private Boolean isCouple = false;  // Dùng Boolean thay vì boolean
//	    @Column(name = "isCouple", nullable = false)
//	    private int isCouple;  // 1 cho ghế đôi, 0 cho ghế đơn

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
	    public int getCouple() {
	        return isCouple ? 1 : 0; // Trả về 1 nếu là ghế đôi, ngược lại trả về 0
	    }
	    	public void setCouple(boolean isCouple) {
	        this.isCouple = isCouple;
	    }
	        // Thêm setter kiểu int để xử lý giá trị 0/1 từ cơ sở dữ liệu
	        public void setCouple(int isCouple) {
	            // Chuyển đổi giá trị int thành boolean (1 -> true, 0 -> false)
	            this.isCouple = (isCouple == 1);
	        }
	    
//	 // Getters and Setters
//	    public int getIsCouple() {
//	        return isCouple;
//	    }
//
//	    public void setIsCouple(int isCouple) {
//	        this.isCouple = isCouple;
//	    }
}
