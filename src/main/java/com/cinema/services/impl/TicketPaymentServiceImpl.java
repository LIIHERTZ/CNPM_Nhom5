package com.cinema.services.impl;

import com.cinema.dao.ITicketPaymentDAO;
import com.cinema.dao.impl.TicketPaymentDAOImpl;
import com.cinema.entity.TicketPayment;
import com.cinema.services.ITicketPaymentService;

public class TicketPaymentServiceImpl implements ITicketPaymentService {

    private ITicketPaymentDAO ticketPaymentDAO = new TicketPaymentDAOImpl();
    @Override
    public TicketPayment saveTicketPayment(TicketPayment tp) {
        return ticketPaymentDAO.save(tp);
    }
}
