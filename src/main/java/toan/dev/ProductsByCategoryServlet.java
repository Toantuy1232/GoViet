package toan.dev;

import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.Category;
import toan.dev.data.model.Products;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductsByCategoryServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setDataAttributes(request);
        
        String categoryIdParam = request.getParameter("categoryId");
        ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        
        List<Products> products;
        Category selectedCategory = null;
        
        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryIdParam);
                products = productsDao.findAllByCategoryId(categoryId);
                selectedCategory = categoryDao.find(categoryId);
            } catch (NumberFormatException e) {
                products = productsDao.findAll();
            }
        } else {
            products = productsDao.findAll();
        }
        
        request.setAttribute("products", products);
        request.setAttribute("selectedCategory", selectedCategory);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
