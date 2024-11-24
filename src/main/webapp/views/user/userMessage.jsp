<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cinema.entity.Person" %>
<%
    Person person = (Person) session.getAttribute("person");
    String username = (person != null) ? person.getFullName() : "Guest";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chat with Admin</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <style>
        .contact-form textarea {
            background-color: #121212;
            color: #fff;
            border: 1px solid #444;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            height: 300px;
            resize: none;
        }

        .contact-form input[type="text"] {
            background-color: #121212;
            color: #fff;
            border: 1px solid #444;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
        }

        .contact-form input[type="submit"] {
            background: linear-gradient(45deg, #ff6b6b, #f06595);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
            text-transform: uppercase;
            transition: background 0.3s ease;
        }

        .contact-form input[type="submit"]:hover {
            background: linear-gradient(45deg, #f06595, #ff6b6b);
        }
    </style>
</head>
<body>
<section class="contact-section padding-top">
    <div class="container">
        <div class="section-header-3 left-style">
            <h2 class="title">Chat with Admin</h2>
        </div>
        <form class="contact-form" onsubmit="sendData(); return false;">
            <!-- Phần hiển thị chat -->
            <div class="form-group">
                <label for="content">Chat Messages</label>
                <textarea id="content" placeholder="Chat messages will appear here..." readonly></textarea>
            </div>
            <!-- Phần nhập tin nhắn -->
            <div class="col-12">
                <label for="inputText">Enter Your Message</label>
                <input type="text" id="inputText" placeholder="Type your message...">
            </div>
            <!-- Nút gửi -->
            <div class="form-group col-3">
                <input type="submit" value="Send Message"
                style="width: 100%; padding: 10px; border-radius: 30px; background: linear-gradient(45deg, #ff6b6b, #f06595); color: white; border: none; font-weight: bold; text-transform: uppercase; cursor: pointer; transition: background 0.3s ease;">
            </div>
        </form>
    </div>
</section>
<script>
    // Lấy thông tin người dùng từ session
    var username = "<%= username %>";

    // Khởi tạo WebSocket
    var websocket = new WebSocket("ws://localhost:8181");

    websocket.onopen = function () {
        addMessage("Server connected!", "other");
        addMessage(username + " đã vào đoạn chat!", "user");
    };

    websocket.onmessage = function (message) {
        const sender = message.data.split(":")[0].trim();
        const type = sender === username.trim() ? "user" : "other";
        addMessage(message.data, type);
    };

    websocket.onclose = function () {
        addMessage(username + " đã rời đoạn chat!", "other");
    };

    websocket.onerror = function (message) {
        addMessage("Error: " + message, "other");
    };

    function addMessage(text, type) {
        const content = document.getElementById("content");
        content.value += text + "\n";
        content.scrollTop = content.scrollHeight;
    }

    function sendData() {
        const input = document.getElementById("inputText");
        if (input.value.trim() !== "") {
            const mes = username + ": " + input.value;
            websocket.send(mes);
            input.value = "";
        }
    }
</script>
</body>
</html>