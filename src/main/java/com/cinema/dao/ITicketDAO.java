package com.cinema.dao;

import java.util.List;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.PopCornPayment;




public interface ITicketDAO{
	  List<TicketHistoryDTO> getTicketHistoryByPersonId(int personId);
	  List<TicketHistoryDTO> getPaginatedTicketHistory(int personId, int page, int pageSize);
	  int countTicketHistory(int personId);
	List<PopCornPayment> getPopCornAndQuantityByPaymentId(int paymentId);
}
