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
		int personId = Integer.parseInt(request.getParameter("personId"));
	    int page = 0;
	    int pageSize = 5;

	    // Lấy thông tin trang hiện tại từ request
	    try {
	        page = Integer.parseInt(request.getParameter("page"));
	    } catch (NumberFormatException e) {
	        // Nếu không có tham số page, mặc định là trang 0
	    }

	    // Lấy danh sách giao dịch phân trang
	    List<TicketHistoryDTO> ticketHistory = ticketService.getPaginatedTicketHistory(personId, page, pageSize);

	    // Tính tổng số trang
	    int totalItems = ticketService.countTicketHistory(personId);
	    int totalPages = (int) Math.ceil((double) totalItems / pageSize);

	    // Gửi dữ liệu đến JSP
	    request.setAttribute("ticketHistory", ticketHistory);
	    request.setAttribute("totalPages", totalPages);
	    request.setAttribute("currentPage", page);
	    request.setAttribute("personId", personId);

	    // Chuyển tiếp đến JSP
	    request.getRequestDispatcher("/views/user/transactionhistory.jsp").forward(request, response);
    }
}
