package toan.dev.admin.ChatAI;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.ChatMessageDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.ChatMessage;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CreateChatAIServlet", urlPatterns = {"/admin/chat-ai/create"})
public class CreateChatAIServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get all users for dropdown
        UsersDao usersDao = DatabaseDao.getInstance().getUserDao();
        List<Users> users = usersDao.findAll();
        
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/chat-ai/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        int senderId = Integer.parseInt(request.getParameter("senderId"));
        int receiverId = Integer.parseInt(request.getParameter("receiverId"));
        String content = request.getParameter("content");
        
        ChatMessage message = new ChatMessage(senderId, receiverId, content);
        
        ChatMessageDao chatMessageDao = DatabaseDao.getInstance().getChatMessageDao();
        boolean success = chatMessageDao.insert(message);
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/chat-ai?message=create_success");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/chat-ai/create?error=create_failed");
        }
    }
}
