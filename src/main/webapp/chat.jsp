<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat AI - GoViet</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    
    <style>
        body {
            background: #f8f9fa;
        }
        .chat-container {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .chat-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            text-align: center;
        }
        .chat-messages {
            height: 500px;
            overflow-y: auto;
            padding: 20px;
            background: #f8f9fa;
        }
        .message {
            margin-bottom: 15px;
            display: flex;
            align-items: flex-start;
        }
        .message.user {
            justify-content: flex-end;
        }
        .message-content {
            max-width: 70%;
            padding: 12px 18px;
            border-radius: 18px;
            position: relative;
        }
        .message.ai .message-content {
            background: white;
            border: 1px solid #e0e0e0;
            margin-left: 10px;
        }
        .message.user .message-content {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            margin-right: 10px;
        }
        .message-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .message.ai .message-avatar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .message.user .message-avatar {
            background: #e0e0e0;
            color: #666;
        }
        .chat-input {
            padding: 20px;
            background: white;
            border-top: 1px solid #e0e0e0;
        }
        .chat-input form {
            display: flex;
            gap: 10px;
        }
        .chat-input input {
            flex: 1;
            border: 1px solid #e0e0e0;
            border-radius: 25px;
            padding: 12px 20px;
        }
        .chat-input button {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            border: none;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            cursor: pointer;
            transition: transform 0.2s;
        }
        .chat-input button:hover {
            transform: scale(1.1);
        }
        .typing-indicator {
            display: none;
            padding: 10px;
            font-style: italic;
            color: #999;
        }
        .typing-indicator.active {
            display: block;
        }
    </style>
</head>
<body>

    <%@include file="./inc/header.jsp" %>

    <div class="chat-container">
        <div class="chat-header">
            <h3><i class="fas fa-robot"></i> Chat với AI Assistant</h3>
            <p class="mb-0">Hỏi tôi bất cứ điều gì về du lịch!</p>
        </div>
        
        <div class="chat-messages" id="chatMessages">
            <div class="message ai">
                <div class="message-avatar">
                    <i class="fas fa-robot"></i>
                </div>
                <div class="message-content">
                    Xin chào! Tôi là trợ lý ảo của GoViet. Tôi có thể giúp gì cho bạn hôm nay?
                </div>
            </div>
        </div>
        
        <div class="typing-indicator" id="typingIndicator">
            <i class="fas fa-robot"></i> AI đang trả lời...
        </div>
        
        <div class="chat-input">
            <form id="chatForm">
                <input type="text" id="messageInput" placeholder="Nhập tin nhắn..." required autocomplete="off">
                <button type="submit">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        $(document).ready(function() {
            const chatMessages = $('#chatMessages');
            const chatForm = $('#chatForm');
            const messageInput = $('#messageInput');
            const typingIndicator = $('#typingIndicator');
            
            // Auto scroll to bottom
            function scrollToBottom() {
                chatMessages.scrollTop(chatMessages[0].scrollHeight);
            }
            
            // Add message to chat
            function addMessage(content, isUser) {
                const messageHtml = `
                    <div class="message ${isUser ? 'user' : 'ai'}">
                        ${!isUser ? '<div class="message-avatar"><i class="fas fa-robot"></i></div>' : ''}
                        <div class="message-content">${content}</div>
                        ${isUser ? '<div class="message-avatar"><i class="fas fa-user"></i></div>' : ''}
                    </div>
                `;
                chatMessages.append(messageHtml);
                scrollToBottom();
            }
            
            // Handle form submit
            chatForm.submit(function(e) {
                e.preventDefault();
                
                const message = messageInput.val().trim();
                if (!message) return;
                
                // Add user message
                addMessage(message, true);
                messageInput.val('');
                
                // Show typing indicator
                typingIndicator.addClass('active');
                
                // Send to server
                $.ajax({
                    url: '${pageContext.request.contextPath}/chat',
                    method: 'POST',
                    data: {
                        action: 'sendToAI',
                        message: message
                    },
                    success: function(response) {
                        typingIndicator.removeClass('active');
                        if (response.success) {
                            addMessage(response.message, false);
                        } else {
                            addMessage('Xin lỗi, đã có lỗi xảy ra. Vui lòng thử lại.', false);
                        }
                    },
                    error: function() {
                        typingIndicator.removeClass('active');
                        addMessage('Xin lỗi, không thể kết nối đến server.', false);
                    }
                });
            });
            
            // Focus input on load
            messageInput.focus();
        });
    </script>

</body>
</html>
