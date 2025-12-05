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

@WebServlet(name = "EditChatAIServlet", urlPatterns = {"/admin/chat-ai/edit"})
public class EditChatAIServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ChatMessageDao chatMessageDao = DatabaseDao.getInstance().getChatMessageDao();
        ChatMessage message = chatMessageDao.find(id);
        
        UsersDao usersDao = DatabaseDao.getInstance().getUserDao();
        List<Users> users = usersDao.findAll();
        
        request.setAttribute("message", message);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/chat-ai/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        int senderId = Integer.parseInt(request.getParameter("senderId"));
        int receiverId = Integer.parseInt(request.getParameter("receiverId"));
        String content = request.getParameter("content");
        
        ChatMessage message = new ChatMessage(senderId, receiverId, content);
        message.setId(id);
        
        ChatMessageDao chatMessageDao = DatabaseDao.getInstance().getChatMessageDao();
        boolean success = chatMessageDao.update(message);
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/chat-ai?message=update_success");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/chat-ai/edit?id=" + id + "&error=update_failed");
        }
    }
}
