package com.cinema.controllers.admin;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

import com.cinema.services.*;
import com.cinema.services.impl.ChatServiceImpl;
import com.cinema.entity.*;


@WebServlet(urlPatterns = "/adminMessage")
public class AdminMessageController extends HttpServlet {

	
	private static final long serialVersionUID = 4317368494648713183L;
	IChatService chatService = new ChatServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Person> customers = chatService.getAllCustomers();
        req.setAttribute("customers", customers);

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminMessage.jsp");
        rd.forward(req, resp);
	}
	
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Person> customers = chatService.getAllCustomers();
        req.setAttribute("customers", customers);
        
        int customerId = Integer.parseInt(req.getParameter("customerId"));
        Conversation conversation = chatService.findOrCreateConversation(customerId);

        List<Message> messages = chatService.getMessagesByConversationId(conversation.getConversationID());
        req.setAttribute("messages", messages);
        
        // Truyền thêm customerId và conversationId xuống JSP
        req.setAttribute("selectedCustomerId", customerId);
        req.setAttribute("selectedConversationId", conversation.getConversationID());

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/adminMessage.jsp");
        rd.forward(req, resp);
    }
}