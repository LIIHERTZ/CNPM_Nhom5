package com.cinema.controllers.user;

import java.io.IOException;
import java.util.List;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.services.ITicketService;
import com.cinema.services.impl.TicketServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns= "/userTransaction")
public class TransactionController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ITicketService ticketService = new TicketServiceImpl();
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        

//        if ("details".equals(action)) {
//            int ticketID = Integer.parseInt(request.getParameter("ticketID"));
//            List<PopCornPayment> popcornDetails = popCornPaymentService.getPopCornDetails(ticketID);
//
//            request.setAttribute("popcornDetails", popcornDetails);
//            request.getRequestDispatcher("popcornDetails.jsp").forward(request, response);
//        } else {
            int personId = Integer.parseInt(request.getParameter("personId"));
            List<TicketHistoryDTO> ticketHistory = ticketService.getTicketHistory(personId);

            request.setAttribute("ticketHistory", ticketHistory);
            request.getRequestDispatcher("/views/user/transactionhistory.jsp").forward(request, response);
//        }
    }
}
