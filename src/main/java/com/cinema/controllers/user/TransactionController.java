package com.cinema.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.cinema.dto.TicketHistoryDTO;
import com.cinema.entity.Person;
import com.cinema.services.ITicketService;
import com.cinema.services.impl.TicketServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("person") != null) {

			Person person = (Person) session.getAttribute("person");

			if (!person.getRole().toLowerCase().contains("admin")) {
				int personId = Integer.parseInt(request.getParameter("personId"));
				int page = 0;
				int pageSize = 70;

				// Lấy thông tin trang hiện tại từ request
				try {
					page = Integer.parseInt(request.getParameter("page"));
				} catch (NumberFormatException e) {
					// Nếu không có tham số page, mặc định là trang 0
				}

				// Lấy danh sách giao dịch phân trang
				List<TicketHistoryDTO> ticketHistory = ticketService.getPaginatedTicketHistory(personId, page, pageSize);

				ticketHistory = groupSeatsByPaymentId(ticketHistory);
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
				return;
			}
		}
		response.sendRedirect(request.getContextPath() + "/signin");
    }
	public List<TicketHistoryDTO> groupSeatsByPaymentId(List<TicketHistoryDTO> ticketHistoryList) {
		Map<Integer, TicketHistoryDTO> groupedHistory = new LinkedHashMap<>();

		for (TicketHistoryDTO ticket : ticketHistoryList) {
			int paymentId = ticket.getPaymentId();
			if (!groupedHistory.containsKey(paymentId)) {
				// Nếu chưa có paymentId trong map, thêm mới
				groupedHistory.put(paymentId, new TicketHistoryDTO(
						paymentId,
						ticket.getMovieName(),
						ticket.getCinemaName(),
						ticket.getRoomName(),
						ticket.getConcatenatedSeats(), // Ghế đầu tiên
						ticket.getStartHour(),
						ticket.getEndHour(),
						ticket.getTotalPrice()
				));
			} else {
				// Nếu đã có, cập nhật
				TicketHistoryDTO existing = groupedHistory.get(paymentId);
				// Gộp ghế
				existing.setConcatenatedSeats(
						existing.getConcatenatedSeats() + ", " + ticket.getConcatenatedSeats()
				);
			}
		}

		// Trả về danh sách đã được gộp
		return new ArrayList<>(groupedHistory.values());
	}

}
