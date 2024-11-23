package com.cinema.dao;

import java.util.List;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.PopCornPayment;




public interface ITicketDAO{
	  List<TicketHistoryDTO> getTicketHistoryByPersonId(int personId);
	 
	List<PopCornPayment> getPopCornAndQuantityByTicketId(int ticketId);
}
