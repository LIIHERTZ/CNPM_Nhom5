package com.cinema.controllers.user;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Person;
import com.cinema.entity.PopCornPayment;
import com.cinema.services.ITicketService;
import com.cinema.services.impl.TicketServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns= "/userTransactionDetail")
public class TransactionDetailsController extends HttpServlet{

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
				 try {
					 // Lấy paymentId từ request
					 int paymentId = Integer.parseInt(request.getParameter("paymentId"));

					 // Gọi service để lấy dữ liệu
					 List<PopCornPayment> popcornDetails = ticketService.getPopCornPaymentsByPaymentId(paymentId);

					 // Log kiểm tra dữ liệu
					 System.out.println("Controller PopcornDetails Size: " + popcornDetails.size());
					 for (PopCornPayment p : popcornDetails) {
						 System.out.println("Popcorn Name: " + p.getPopcorn().getNamePopCorn() + ", Quantity: " + p.getQuantity());
					 }

					 // Truyền dữ liệu vào request
					 request.setAttribute("popcornDetails", popcornDetails);

					 // Chuyển hướng tới JSP
					 RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/transactionhistory-details.jsp");
					 dispatcher.forward(request, response);
				 } catch (Exception e) {
					 e.printStackTrace();
					 response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching transaction details.");
				 }
				 return;
			 }
		 }
		 response.sendRedirect(request.getContextPath() + "/signin");
	 }
}
