package toan.dev;

import com.google.gson.Gson;
import toan.dev.data.dao.ChatMessageDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.ChatMessage;
import toan.dev.data.model.Users;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ChatServlet", urlPatterns = {"/chat"})
public class ChatServlet extends HttpServlet {

    private ChatMessageDao chatMessageDao;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        chatMessageDao = DatabaseDao.getInstance().getChatMessageDao();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("getMessages".equals(action)) {
            getMessages(request, response, currentUser);
        } else if ("getUnreadCount".equals(action)) {
            getUnreadCount(response, currentUser);
        } else {

            request.getRequestDispatcher("/chat.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("user");

        if (currentUser == null) {
            sendJsonResponse(response, false, "Vui lòng đăng nhập");
            return;
        }

        String action = request.getParameter("action");

        if ("sendMessage".equals(action)) {
            sendMessage(request, response, currentUser);
        } else if ("sendToAI".equals(action)) {
            sendToAI(request, response, currentUser);
        }
    }

    private void getMessages(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        
        String receiverIdStr = request.getParameter("receiverId");
        
        if (receiverIdStr != null) {
            int receiverId = Integer.parseInt(receiverIdStr);
            List<ChatMessage> messages = chatMessageDao.findConversation(currentUser.getUser_id(), receiverId);
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(messages));
            out.flush();
        } else {
            List<ChatMessage> messages = chatMessageDao.findByUserId(currentUser.getUser_id());
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(messages));
            out.flush();
        }
    }

    private void getUnreadCount(HttpServletResponse response, Users currentUser) throws IOException {
        int count = chatMessageDao.countUnreadMessages(currentUser.getUser_id());
        
        Map<String, Object> result = new HashMap<>();
        result.put("count", count);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(result));
        out.flush();
    }

    private void sendMessage(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        
        String content = request.getParameter("content");
        String receiverIdStr = request.getParameter("receiverId");
        
        if (content == null || content.trim().isEmpty()) {
            sendJsonResponse(response, false, "Nội dung tin nhắn không được để trống");
            return;
        }

        int receiverId = Integer.parseInt(receiverIdStr);
        
        ChatMessage message = new ChatMessage(currentUser.getUser_id(), receiverId, content);
        boolean success = chatMessageDao.insert(message);
        
        if (success) {
            sendJsonResponse(response, true, "Gửi tin nhắn thành công");
        } else {
            sendJsonResponse(response, false, "Gửi tin nhắn thất bại");
        }
    }

    private void sendToAI(HttpServletRequest request, HttpServletResponse response, Users currentUser)
            throws IOException {
        
        String userMessage = request.getParameter("message");
        
        System.out.println("DEBUG: Received message from user: " + userMessage);
        
        if (userMessage == null || userMessage.trim().isEmpty()) {
            sendJsonResponse(response, false, "Tin nhắn không được để trống");
            return;
        }

        // Don't save AI chat messages to database (to avoid foreign key constraint)
        // Just generate and return AI response directly
        
        // Generate AI response (simple rule-based for now)
        String aiResponse = generateAIResponse(userMessage);
        
        System.out.println("DEBUG: AI Response: " + aiResponse);

        // Return AI response
        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("message", aiResponse);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(result));
        out.flush();
    }

    private String generateAIResponse(String userMessage) {
        String message = userMessage.toLowerCase().trim();
        
        // Simple rule-based responses
        if (message.contains("xin chào") || message.contains("hello") || message.contains("hi")) {
            return "Xin chào! Tôi là trợ lý ảo của GoViet. Tôi có thể giúp gì cho bạn?";
        } else if (message.contains("tour") || message.contains("du lịch")) {
            return "Chúng tôi có nhiều tour du lịch hấp dẫn! Bạn muốn đi du lịch ở đâu? Trong nước hay nước ngoài?";
        } else if (message.contains("giá") || message.contains("chi phí")) {
            return "Giá tour phụ thuộc vào điểm đến và thời gian. Bạn có thể xem chi tiết giá tại trang Packages hoặc liên hệ hotline: 0123 456 789";
        } else if (message.contains("đặt") || message.contains("booking")) {
            return "Để đặt tour, bạn vui lòng truy cập trang Booking hoặc liên hệ trực tiếp với chúng tôi qua hotline: 0123 456 789";
        } else if (message.contains("cảm ơn") || message.contains("thank")) {
            return "Rất vui được hỗ trợ bạn! Chúc bạn có chuyến đi vui vẻ!";
        } else {
            return "Cảm ơn bạn đã liên hệ! Để được tư vấn chi tiết hơn, vui lòng liên hệ hotline: 0123 456 789 hoặc email: toan@gmail.com";
        }
    }

    private void sendJsonResponse(HttpServletResponse response, boolean success, String message) throws IOException {
        Map<String, Object> result = new HashMap<>();
        result.put("success", success);
        result.put("message", message);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(result));
        out.flush();
    }
}
