package toan.dev.api;

import com.google.gson.Gson;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.TourDao;
import toan.dev.data.model.Tours;

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
 * REST API Servlet for Tours
 * Endpoints:
 * - GET /api/tours - Get all tours
 * - GET /api/tours?id=1 - Get tour by ID
 * - GET /api/tours?search=hanoi - Search tours
 * - GET /api/tours?categoryId=1 - Get tours by category
 */
public class TourApiServlet extends HttpServlet {
    
    private TourDao tourDao;
    private Gson gson;
    
    @Override
    public void init() throws ServletException {
        tourDao = DatabaseDao.getInstance().getTourDao();
        gson = new Gson();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // Enable CORS (if needed for frontend)
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        
        PrintWriter out = response.getWriter();
        
        try {
            String idParam = request.getParameter("id");
            String searchParam = request.getParameter("search");
            String categoryIdParam = request.getParameter("categoryId");
            
            Map<String, Object> result = new HashMap<>();
            
            // Get tour by ID
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                Tours tour = tourDao.find(id);
                
                if (tour != null) {
                    result.put("success", true);
                    result.put("data", tour);
                    result.put("message", "Tour found successfully");
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    result.put("success", false);
                    result.put("message", "Tour not found");
                }
            }
            // Search tours
            else if (searchParam != null && !searchParam.isEmpty()) {
                List<Tours> tours = tourDao.findBySearchTerm(searchParam);
                result.put("success", true);
                result.put("data", tours);
                result.put("count", tours.size());
                result.put("message", "Search completed successfully");
            }
            // Get tours by category
            else if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                int categoryId = Integer.parseInt(categoryIdParam);
                List<Tours> tours = tourDao.findByCategoryAndSearchTerm(categoryId, "");
                result.put("success", true);
                result.put("data", tours);
                result.put("count", tours.size());
                result.put("message", "Tours retrieved successfully");
            }
            // Get all tours
            else {
                List<Tours> tours = tourDao.findAll();
                result.put("success", true);
                result.put("data", tours);
                result.put("count", tours.size());
                result.put("message", "All tours retrieved successfully");
            }
            
            out.print(gson.toJson(result));
            
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, Object> error = new HashMap<>();
            error.put("success", false);
            error.put("message", "Invalid parameter format");
            error.put("error", e.getMessage());
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
    
    @Override
    protected void doOptions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle CORS preflight request
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
