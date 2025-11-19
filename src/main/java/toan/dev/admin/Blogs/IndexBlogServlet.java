package toan.dev.admin.Blogs;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Blogposts;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexBlogServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Blogposts> blogpostsList = DatabaseDao.getInstance().getBlogDao().findAll();
        request.setAttribute("blogpostsList", blogpostsList);
        request.getRequestDispatcher("admin/blog/index.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
