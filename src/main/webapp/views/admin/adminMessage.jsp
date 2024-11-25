<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cinema.entity.Message"%>
<%@ page import="com.cinema.entity.Person"%>
<%@ page import="java.util.List"%>
<%
    List<Person> customers = (List<Person>) request.getAttribute("customers");
	List<Message> messages = (List<Message>) request.getAttribute("messages");
	
	// Lấy customerId và conversationId được truyền từ controller
    Integer selectedCustomerId = (Integer) request.getAttribute("selectedCustomerId");
    Integer selectedConversationId = (Integer) request.getAttribute("selectedConversationId");
%>
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
			<div class="col-3">
				<div class="main__title">
					<h2>Danh Sách Khách hàng</h2>
				</div>
				<ul class="list-group">
					<%
					if (customers != null && !customers.isEmpty()) {
						for (Person customer : customers) {
					%>
					<li class="list-group-item">
						<form action="${pageContext.request.contextPath}/adminMessage" method="post"
							style="margin: 0; padding: 0;">
							<input type="hidden" id="customerId" name="customerId"
								value="<%=customer.getPerID()%>">
<!-- 							<input type="hidden" id="conversationId" name="conversationId"  -->
<%-- 								value="<%= (messages != null && !messages.isEmpty()) ? messages.get(0).getConversation().getConversationID() : "" %>"> --%>
							<button type="submit" class="btn btn-link">
<%-- 							onclick="selectCustomer('<%=customer.getPerID()%>',  --%>
<%-- 							    '<%= (messages != null && !messages.isEmpty()) ? messages.get(0).getConversation().getConversationID() : "" %>')"> --%>
								<%=customer.getFullName()%>
							</button>	
						</form>
					</li>
					<%
					}
					} else {
					%>
					<li class="list-group-item">Không có khách hàng nào</li>
					<%
					}
					%>
				</ul>
			</div>

			<!-- Chat Section -->
			<div class="col-9">
				<div class="main__title">
					<h2>Chat Application</h2>
				</div>
				<div class="chat-container">
					<!-- Chat Content -->
					<div class="col-12">
						<textarea id="content" class="sign__textarea" placeholder="Chat"
							style="width: 100%; height: 300px;" readonly>
<%
    if (messages != null && !messages.isEmpty()) {
        for (Message message : messages) {
            out.print(message.getPerson().getFullName() + ": " + message.getContent() + "\n");
        }
    } else {
        out.print("Hãy chọn một người dùng để tiến hành giải đáp thắc mắc...");
    }
%>										
							</textarea>
					</div>

					<!-- Input Message -->
					<div class="col-12">
						<input id="inputText" type="text" class="sign__input"
							placeholder="Type your message..." onkeypress="checkEnter(event)">
						<button id="sendButton" class="sign__btn sign__btn--small"
							onclick="sendData()">Send</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		// Gán customerId và conversationId từ JSP vào JavaScript
	    const currentCustomerId = <%= (selectedCustomerId != null) ? selectedCustomerId : "null" %>;
	    const currentConversationId = <%= (selectedConversationId != null) ? selectedConversationId : "null" %>;
		
		function selectCustomer(customerId, conversationId) {
			currentCustomerId = customerId;
			currentConversationId = conversationId;
		}
		
        // Lấy tên từ session
        var username = "<%=((Person) session.getAttribute("person")).getFullName()%>";

		var websocket = new WebSocket("ws://localhost:8181");

		websocket.onopen = function() {
			addMessage("<--------------------------------------------------------------------Server connected!-------------------------------------------------------------------->", "other");
			addMessage(username + " đã vào đoạn chat!", "other");
		};

		websocket.onmessage = function(message) {
// 			const sender = message.data.split(":")[0].trim();
// 			const type = sender === username.trim() ? "user" : "other";
// 			addMessage(message.data, type);
// 			addMessage(message.data, "other");
			console.log("Dữ liệu nhận từ WebSocket:", message.data);
			
			try {
			        const parsedMessage = JSON.parse(message.data);
			        if (parsedMessage.username && parsedMessage.content) {
			        	console.log("Username:", parsedMessage.username); // Kiểm tra giá trị username
			            console.log("Content:", parsedMessage.content);
// 			            const displayMessage = `${parsedMessage.username}: ${parsedMessage.content}`;
						const displayMessage = parsedMessage.username + ": " + parsedMessage.content;
			            console.log("DisplayMessage: ", displayMessage );
			            addMessage(displayMessage, "other");
			        } else {
			            console.error("Dữ liệu JSON không hợp lệ:", message.data);
			        }
			    } catch (e) {
			        console.error("Lỗi khi phân tích JSON:", e, message.data);
			    }
		};

		websocket.onclose = function() {
			addMessage(username + " đã rời đoạn chat!", "other");
		};

		websocket.onerror = function(message) {
			addMessage("Lỗi: " + message, "other");
		};

		function addMessage(text, type) {
// 			const content = document.getElementById("content");
// 			if (type === "user") {
// 				content.value += text + "\n"; 
// 			} else {
// 				content.value += text + "\n"; 
// 			}
// 			content.scrollTop = content.scrollHeight; // Tự động cuộn xuống
			const content = document.getElementById("content");
// 			content.value += text.trim() + "\n";

// 			content.value = '${content.value.trim()}\n${text}';
			content.value = content.value.trim() + "\n" + text.trim();
			content.scrollTop = content.scrollHeight;
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
		        const messageContent = input.value.trim();

		        // Kiểm tra nếu customerId và conversationId không null
		        if (!currentCustomerId || !currentConversationId) {
		            alert("Vui lòng chọn một đoạn chat!");
		            return;
		        }

		        const messageData = {
		            content: messageContent,		            
		            conversationId: currentConversationId, // Sử dụng giá trị đã lưu
		            senderId: "<%= ((Person) session.getAttribute("person")).getPerID() %>", // ID người gửi (admin)
		        };
		        
		        
		        console.log(messageData);
		        
		        // Gửi dữ liệu qua AJAX để lưu vào database
		        fetch("/ValCT_Nhom5/saveMessage", {
		            method: "POST",
		            headers: {
		                "Content-Type": "application/json",
		            },
		            body: JSON.stringify(messageData),
		        })
		            .then((response) => response.json())
		            .then((data) => {
		                if (data.success) {
// 		                    addMessage("Bạn: " + messageContent, "user");
// 		                    input.value = ""; // Xóa nội dung input
		                	// Sau khi lưu thành công, gửi qua WebSocket
		                    const mes = JSON.stringify({
		                        username: "<%= ((Person) session.getAttribute("person")).getFullName() %>",
		                        content: messageContent,
		                    });
		                    websocket.send(mes);
		                    console.log(mes);

		                    // Xóa nội dung input
		                    input.value = "";
		                } else {
		                    alert("Lỗi khi lưu tin nhắn");
		                }
		            })
		            .catch((error) => console.error("Error:", error));
		    }
		}
	</script>
</body>
</html>
