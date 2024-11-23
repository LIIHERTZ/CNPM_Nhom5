	package com.cinema.dto;
	import java.util.Date;
	
	public class TicketHistoryDTO {
		private int ticketID;
	    private String movieName;
	    private String cinemaName;
	    private String roomName;
	    private String chairNumber;
	    private Date startHour;
	    private Date endHour;
	    private double priceTicket;
	
	    // Constructor
	    public TicketHistoryDTO(int ticketID, String movieName, String cinemaName, String roomName, String chairNumber,
	                            Date startHour, Date endHour, double priceTicket) {
	        this.ticketID = ticketID;
	        this.movieName = movieName;
	        this.cinemaName = cinemaName;
	        this.roomName = roomName;
	        this.chairNumber = chairNumber;
	        this.startHour = startHour;
	        this.endHour = endHour;
	        this.priceTicket = priceTicket;
	    }
	
	    // Getters and setters
	    public int getTicketID() {
	        return ticketID;
	    }
	
	    public void setTicketID(int ticketID) {
	        this.ticketID = ticketID;
	    }
	
	    public String getMovieName() {
	        return movieName;
	    }
	
	    public void setMovieName(String movieName) {
	        this.movieName = movieName;
	    }
	
	    public String getCinemaName() {
	        return cinemaName;
	    }
	
	    public void setCinemaName(String cinemaName) {
	        this.cinemaName = cinemaName;
	    }
	
	    public String getRoomName() {
	        return roomName;
	    }
	
	    public void setRoomName(String roomName) {
	        this.roomName = roomName;
	    }
	
	    public String getChairNumber() {
	        return chairNumber;
	    }
	
	    public void setChairNumber(String chairNumber) {
	        this.chairNumber = chairNumber;
	    }
	
	    public Date getStartHour() {
	        return startHour;
	    }
	
	    public void setStartHour(Date startHour) {
	        this.startHour = startHour;
	    }
	
	    public Date getEndHour() {
	        return endHour;
	    }
	
	    public void setEndHour(Date endHour) {
	        this.endHour = endHour;
	    }
	
	    public double getPriceTicket() {
	        return priceTicket;
	    }
	
	    public void setPriceTicket(double priceTicket) {
	        this.priceTicket = priceTicket;
	    }
	}
