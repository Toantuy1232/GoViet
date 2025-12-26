package toan.dev;

import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.TourDao;
import toan.dev.data.model.Category;
import toan.dev.data.model.Tours;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ToursByCategoryServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("ToursByCategoryServlet.doGet() called");
        
        try {
            setDataAttributes(request);
            
            String categoryIdParam = request.getParameter("categoryId");
            TourDao tourDao = DatabaseDao.getInstance().getTourDao();
            CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
            
            List<Tours> tours;
            Category selectedCategory = null;
            
            // Lấy danh sách tất cả categories để hiển thị trong sidebar
            List<Category> categories = categoryDao.findAll();
            System.out.println("Available categories: " + (categories != null ? categories.size() : "null"));
            
            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                try {
                    int categoryId = Integer.parseInt(categoryIdParam);
                    tours = tourDao.findAllByCategoryId(categoryId);
                    selectedCategory = categoryDao.find(categoryId);
                    System.out.println("Filtering tours by category ID: " + categoryId);
                    System.out.println("Found " + (tours != null ? tours.size() : "null") + " tours");
                } catch (NumberFormatException e) {
                    tours = tourDao.findAll();
                    System.out.println("Invalid category ID, showing all tours");
                } catch (Exception e) {
                    System.err.println("Error finding tours by category: " + e.getMessage());
                    e.printStackTrace();
                    tours = tourDao.findAll();
                }
            } else {
                tours = tourDao.findAll();
                System.out.println("No category filter, showing all " + (tours != null ? tours.size() : "null") + " tours");
            }
            
            // Ensure we have empty lists instead of null
            if (tours == null) tours = new ArrayList<>();
            if (categories == null) categories = new ArrayList<>();
            
            request.setAttribute("tours", tours);
            request.setAttribute("selectedCategory", selectedCategory);
            request.setAttribute("categories", categories);
            
            // Forward to tours.jsp (remove test page logic)
            request.getRequestDispatcher("/tours.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Error in ToursByCategoryServlet: " + e.getMessage());
            e.printStackTrace();
            
            // Fallback error handling
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<html><body>");
            response.getWriter().println("<h1>Lỗi tải trang Tours</h1>");
            response.getWriter().println("<p>Có lỗi xảy ra: " + e.getMessage() + "</p>");
            response.getWriter().println("<p><a href='" + request.getContextPath() + "/'>Về trang chủ</a></p>");
            response.getWriter().println("</body></html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}