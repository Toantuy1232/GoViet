package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Category;
import toan.dev.data.model.CategoryGallery;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GalleryServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setDataAttributes(request);

        List<CategoryGallery> categoryGalleryList = DatabaseDao.getInstance()
                .getCategoryGalleryDao().findAll();
        List<Category> categoryList = DatabaseDao.getInstance().getCategoryDao().findAll();

        request.setAttribute("categoryGalleryList", categoryGalleryList);
        request.setAttribute("categoryList", categoryList);

        request.getRequestDispatcher("/gallery.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
