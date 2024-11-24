package com.cinema.services.impl;

import java.util.List;


import com.cinema.dao.ITicketDAO;
import com.cinema.dao.impl.TicketDAOImpl;
import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.PopCornPayment;
import com.cinema.services.ITicketService;

public class TicketServiceImpl implements ITicketService{
	ITicketDAO ticketDao = new TicketDAOImpl();
	@Override
	public List<TicketHistoryDTO> getTicketHistory(int personId) {
		return ticketDao.getTicketHistoryByPersonId(personId);
	}
	@Override
	public List<PopCornPayment> getPopCornPaymentsByTicketId(int ticketId) {
		return ticketDao.getPopCornAndQuantityByTicketId(ticketId);
	}
	@Override
	public List<TicketHistoryDTO> getPaginatedTicketHistory(int personId, int page, int pageSize) {
		return ticketDao.getPaginatedTicketHistory(personId, page, pageSize);
	}
	@Override
	public int countTicketHistory(int personId) {
		return ticketDao.countTicketHistory(personId);
	}

}
