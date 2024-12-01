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
	public List<PopCornPayment> getPopCornPaymentsByPaymentId(int paymentId) {
		return ticketDao.getPopCornAndQuantityByPaymentId(paymentId);
	}
	@Override
	public List<TicketHistoryDTO> getPaginatedTicketHistory(int personId, int page, int pageSize) {
		return ticketDao.getPaginatedTicketHistory(personId, page, pageSize);
	}
	@Override
	public int countTicketHistory(int personId) {
		return ticketDao.countTicketHistory(personId);
	}
	
	public List<TicketHistoryDTO> getTicketHistory(int personId)
	{
		return ticketDao.getTicketHistory(personId);
	}
}
