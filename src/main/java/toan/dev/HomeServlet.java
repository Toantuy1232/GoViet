package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.CategoryGallery;
import toan.dev.data.model.Destinations;
import toan.dev.data.model.Category;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class HomeServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Sử dụng interface DataProvider để truyền dữ liệu
        setDataAttributes(request);
        List<CategoryGallery> categoryGalleryList = DatabaseDao.getInstance()
                .getCategoryGalleryDao().findAll();
        if (categoryGalleryList != null && !categoryGalleryList.isEmpty()) {
            int randomIndex = (int) (Math.random() * categoryGalleryList.size());
            CategoryGallery randomImage = categoryGalleryList.get(randomIndex);
            request.setAttribute("randomGalleryImage", randomImage);
        }
        
        request.setAttribute("categoryGalleryList", categoryGalleryList);
        request.setAttribute("destinationsList", DatabaseDao.getInstance().getDestinationsDao().findAll());
        request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
        // Forward đến index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests - chuyển về GET
        doGet(request, response);
    }
}
