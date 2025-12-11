package toan.dev.api;

import com.google.gson.Gson;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.Products;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * REST API Servlet for Products
 * Endpoints:
 * - GET /api/products - Get all products
 * - GET /api/products?id=1 - Get product by ID
 * - GET /api/products?categoryId=1 - Get products by category
 */
public class ProductApiServlet extends HttpServlet {
    
    private ProductsDao productDao;
    private Gson gson;
    
    @Override
    public void init() throws ServletException {
        productDao = DatabaseDao.getInstance().getProductDao();
        gson = new Gson();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
        PrintWriter out = response.getWriter();
        
        try {
            String idParam = request.getParameter("id");
            String categoryIdParam = request.getParameter("categoryId");
            
            Map<String, Object> result = new HashMap<>();
            
            // Get product by ID
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                Products product = productDao.find(id);
                
                if (product != null) {
                    result.put("success", true);
                    result.put("data", product);
                    result.put("message", "Product found successfully");
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    result.put("success", false);
                    result.put("message", "Product not found");
                }
            }
            // Get products by category
            else if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                int categoryId = Integer.parseInt(categoryIdParam);
                List<Products> products = productDao.findByCategory(categoryId);
                result.put("success", true);
                result.put("data", products);
                result.put("count", products.size());
                result.put("message", "Products retrieved successfully");
            }
            // Get all products
            else {
                List<Products> products = productDao.findAll();
                result.put("success", true);
                result.put("data", products);
                result.put("count", products.size());
                result.put("message", "All products retrieved successfully");
            }
            
            out.print(gson.toJson(result));
            
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, Object> error = new HashMap<>();
            error.put("success", false);
            error.put("message", "Invalid parameter format");
            out.print(gson.toJson(error));
            
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, Object> error = new HashMap<>();
            error.put("success", false);
            error.put("message", "Internal server error");
            error.put("error", e.getMessage());
            out.print(gson.toJson(error));
            e.printStackTrace();
        }
        
        out.flush();
    }
}
