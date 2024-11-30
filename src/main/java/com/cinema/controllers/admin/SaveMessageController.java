package com.cinema.controllers.admin;

import com.cinema.dto.MessageDTO;
import com.cinema.entity.Message;
import com.cinema.services.IChatService;
import com.cinema.services.impl.ChatServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Date;


@WebServlet(urlPatterns = "/saveMessage")
public class SaveMessageController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IChatService chatService = new ChatServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8"); 

        try {
            // Đọc JSON từ request body
            StringBuilder sb = new StringBuilder();
            String line;
            try (BufferedReader reader = req.getReader()) {
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
            }
            String json = sb.toString();

            // Chuyển đổi JSON thành đối tượng Java (MessageDTO)
            ObjectMapper mapper = new ObjectMapper();

            MessageDTO messageDTO = mapper.readValue(json, MessageDTO.class);
            // Tạo tin nhắn mới
            Message message = new Message();
            message.setContent(messageDTO.getContent());
            message.setDate(new Date());
            message.setConversation(chatService.getConversationById(messageDTO.getConversationId()));
            message.setPerson(chatService.getPersonById(messageDTO.getSenderId())); // Không cần chuyển đổi

            // Lưu tin nhắn vào database
            boolean isSaved = chatService.saveMessage(message);

            // Trả về phản hồi JSON
            resp.getWriter().write("{\"success\": " + isSaved + "}");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"success\": false}");
        }
    }
}
