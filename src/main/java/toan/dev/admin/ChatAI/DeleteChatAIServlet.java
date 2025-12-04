package toan.dev.admin.ChatAI;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.ChatMessageDao;
import toan.dev.data.dao.DatabaseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteChatAIServlet", urlPatterns = {"/admin/chat-ai/delete"})
public class DeleteChatAIServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ChatMessageDao chatMessageDao = DatabaseDao.getInstance().getChatMessageDao();
        boolean success = chatMessageDao.delete(id);
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/chat-ai?message=delete_success");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/chat-ai?error=delete_failed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
