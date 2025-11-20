package toan.dev.admin.CategoryGallery;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class DeleteCategoryGalleryServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        DatabaseDao.getInstance().getCategoryGalleryDao().delete(categoryId);
        response.sendRedirect("IndexCategoryGalleryServlet");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
