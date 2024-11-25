package com.cinema.dto;
	import java.util.Date;
	
	public class TicketHistoryDTO {
		private int paymentId;
		private String movieName;
		private String cinemaName;
		private String roomName;
		private String concatenatedSeats; // For the concatenated chair numbers
		private Date startHour;
		private Date endHour;
		private double totalPrice;

		public TicketHistoryDTO(int paymentId, String movieName, String cinemaName, String roomName,
								String concatenatedSeats, Date startHour, Date endHour, double totalPrice) {
			this.paymentId = paymentId;
			this.movieName = movieName;
			this.cinemaName = cinemaName;
			this.roomName = roomName;
			this.concatenatedSeats = concatenatedSeats;
			this.startHour = startHour;
			this.endHour = endHour;
			this.totalPrice = totalPrice;
		}

		public int getPaymentId() {
			return paymentId;
		}

		public void setPaymentId(int paymentId) {
			this.paymentId = paymentId;
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

		public String getConcatenatedSeats() {
			return concatenatedSeats;
		}

		public void setConcatenatedSeats(String concatenatedSeats) {
			this.concatenatedSeats = concatenatedSeats;
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

		public double getTotalPrice() {
			return totalPrice;
		}

		public void setTotalPrice(double totalPrice) {
			this.totalPrice = totalPrice;
		}
	}