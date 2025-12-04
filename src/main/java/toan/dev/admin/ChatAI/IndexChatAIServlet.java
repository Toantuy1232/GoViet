package toan.dev.admin.ChatAI;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.ChatMessageDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.ChatMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexChatAIServlet", urlPatterns = {"/admin/chat-ai"})
public class IndexChatAIServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ChatMessageDao chatMessageDao = DatabaseDao.getInstance().getChatMessageDao();
        List<ChatMessage> messages = chatMessageDao.findAll();
        
        request.setAttribute("messages", messages);
        request.getRequestDispatcher("/admin/chat-ai/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
