<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cinema.entity.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat Application</title>
    <link href="assets2/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets2/css/admin.css" rel="stylesheet">
    <style>
        textarea {
            font-family: monospace;
            font-size: 14px;
            line-height: 1.5;
            white-space: pre-wrap; /* Giữ định dạng xuống dòng */
            background-color: #1d1d1d;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
            height: 300px;
            overflow-y: auto;
        }

        textarea:focus {
            outline: none;
        }

        .chat-input {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .chat-input .sign__input {
            flex: 1;
            padding: 10px;
            border-radius: 5px;
            background-color: #1d1d1d;
            color: #fff;
            border: none;
        }

        .chat-input button {
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #ffb74d;
            border: none;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .chat-input button:hover {
            background-color: #ff9800;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
<!--             <div class="col-3"> -->
<!--                 <div class="main__title"> -->
<!--                     <h2>Danh Sách Khách hàng</h2> -->
<!--                 </div> -->
<!--             </div> -->

            <!-- Chat Section -->
            <div class="col-12">
                <div class="main__title">
                    <h2>Chat Application</h2>
                </div>
                <div class="chat-container">
                    <!-- Chat Content -->
                    <div class = "col-12"><textarea id="content" class="sign__textarea" 
                              placeholder="Chat" style="width: 100%; height: 300px;" readonly></textarea></div>
                    
                    <!-- Input Message -->
                    <div class="col-12">
                        <input id="inputText" type="text" class="sign__input"
                               placeholder="Type your message..." onkeypress="checkEnter(event)">
                        <button id="sendButton" class="sign__btn sign__btn--small" onclick="sendData()">Send</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Lấy tên từ session
        var username = "<%= ((Person) session.getAttribute("person")).getFullName() %>";

        var websocket = new WebSocket("ws://localhost:8181");

        websocket.onopen = function () {
            addMessage("Server connected!", "other");
            addMessage(username + " đã vào đoạn chat!", "other");
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
            addMessage("Lỗi: " + message, "other");
        };

        function addMessage(text, type) {
            const content = document.getElementById("content");
            if (type === "user") {
                content.value += text + "\n"; // Tin nhắn của bạn căn phải
            } else {
                content.value += text + "\n"; // Tin nhắn khác căn trái
            }
            content.scrollTop = content.scrollHeight; // Tự động cuộn xuống
        }

        function checkEnter(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                sendData();
            }
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
