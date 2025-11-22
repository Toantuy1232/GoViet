package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.CategoryGallery;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AboutServlet extends BaseServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        setDataAttributes(request);
        List<CategoryGallery> categoryGalleryList = DatabaseDao.getInstance()
                .getCategoryGalleryDao().findAll();
        if (categoryGalleryList != null && !categoryGalleryList.isEmpty()) {
            int randomIndex = (int) (Math.random() * categoryGalleryList.size());
            CategoryGallery randomImage = categoryGalleryList.get(randomIndex);
            request.setAttribute("randomGalleryImage", randomImage);
        }
        request.setAttribute("categoryGalleryList", categoryGalleryList);
        request.getRequestDispatcher("/about.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }
}
