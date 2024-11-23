package com.cinema.services;

import java.util.List;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.PopCornPayment;



public interface ITicketService {
	  List<TicketHistoryDTO> getTicketHistory(int personId);
	  List<PopCornPayment> getPopCornPaymentsByTicketId(int ticketId);
}
