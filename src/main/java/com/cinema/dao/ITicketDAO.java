package com.cinema.dao;

import java.util.List;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.PopCornPayment;
import com.cinema.entity.Ticket;

public interface ITicketDAO {
	List<TicketHistoryDTO> getPaginatedTicketHistory(int personId, int page, int pageSize);

	int countTicketHistory(int personId);

	List<PopCornPayment> getPopCornAndQuantityByPaymentId(int paymentId);
	
	Ticket saveTicket(Ticket ticket);
	
	List<TicketHistoryDTO> getTicketHistory(int personId);
}
