package com.cinema.controllers.user;

import java.io.IOException;
import java.util.List;

import com.cinema.entity.Conversation;
import com.cinema.entity.Message;
import com.cinema.entity.Person;
import com.cinema.services.IChatService;
import com.cinema.services.impl.ChatServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/userMessage")
public class UserMessageController extends HttpServlet {

    private static final long serialVersionUID = 4317368494648713183L;
    private final IChatService chatService = new ChatServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session != null && session.getAttribute("person") != null) {

            Person person = (Person) session.getAttribute("person");

            if (!person.getRole().toLowerCase().contains("admin")) {
                // Lấy thông tin người dùng từ session
                Person user = (Person) session.getAttribute("person");

                if (user != null) {
                    // Tìm hoặc tạo conversation nếu chưa có
                    Conversation conversation = chatService.findOrCreateConversation(user.getPerID());

                    // Lấy danh sách tin nhắn nếu có
                    List<Message> messages = chatService.getMessagesByConversationId(conversation.getConversationID());
                    req.setAttribute("messages", messages);
                    req.setAttribute("conversationId", conversation.getConversationID());
                } else {
                    req.setAttribute("messages", null); // Người dùng chưa đăng nhập
                    req.setAttribute("conversationId", null);
                }

                // Điều hướng tới trang userMessage.jsp
                RequestDispatcher rd = req.getRequestDispatcher("/views/user/userMessage.jsp");
                rd.forward(req, resp);
                return;
            }
        }
        resp.sendRedirect(req.getContextPath() + "/signin");
    }
}