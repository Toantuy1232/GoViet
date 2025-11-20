package toan.dev;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BlogServlet extends BaseServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        setDataAttributes(request);
        java.util.List<toan.dev.data.model.Users> users = toan.dev.data.dao.DatabaseDao.getInstance().getUserDao().findAll();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/blog.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }
}
