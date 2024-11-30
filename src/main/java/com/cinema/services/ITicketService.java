package com.cinema.services;

import java.util.List;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.PopCornPayment;



public interface ITicketService {
	  List<PopCornPayment> getPopCornPaymentsByPaymentId(int paymentId);
	  List<TicketHistoryDTO> getPaginatedTicketHistory(int personId, int page, int pageSize);
	  int countTicketHistory(int personId);
	  List<TicketHistoryDTO> getTicketHistory(int personId);
}
