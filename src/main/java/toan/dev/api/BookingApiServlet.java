package toan.dev.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import toan.dev.data.dao.BookingDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Booking;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * REST API Servlet for Bookings
 * Endpoints:
 * - GET /api/bookings - Get all bookings (admin) or user's bookings
 * - GET /api/bookings?id=1 - Get booking by ID
 * - GET /api/bookings?status=pending - Get bookings by status
 * - GET /api/bookings?userId=1 - Get bookings by user ID (admin only)
 */
public class BookingApiServlet extends HttpServlet {
    
    private BookingDao bookingDao;
    private Gson gson;
    
    @Override
    public void init() throws ServletException {
        bookingDao = DatabaseDao.getInstance().getBookingDao();
        gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd HH:mm:ss")
                .create();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        try {
            // Check if user is logged in
            if (user == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                Map<String, Object> error = new HashMap<>();
                error.put("success", false);
                error.put("message", "Unauthorized. Please login.");
                out.print(gson.toJson(error));
                out.flush();
                return;
            }
            
            String idParam = request.getParameter("id");
            String statusParam = request.getParameter("status");
            String userIdParam = request.getParameter("userId");
            
            Map<String, Object> result = new HashMap<>();
            boolean isAdmin = "admin".equals(user.getRole());
            
            // Get booking by ID
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                Booking booking = bookingDao.find(id);
                
                if (booking != null) {
                    // Check permission: user can only see their own bookings
                    if (!isAdmin && booking.getUserId() != user.getUser_id()) {
                        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                        result.put("success", false);
                        result.put("message", "Access denied");
                    } else {
                        result.put("success", true);
                        result.put("data", booking);
                        result.put("message", "Booking found successfully");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    result.put("success", false);
                    result.put("message", "Booking not found");
                }
            }
            // Get bookings by status (admin only)
            else if (statusParam != null && !statusParam.isEmpty()) {
                if (!isAdmin) {
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                    result.put("success", false);
                    result.put("message", "Admin access required");
                } else {
                    List<Booking> bookings = bookingDao.findByStatus(statusParam);
                    result.put("success", true);
                    result.put("data", bookings);
                    result.put("count", bookings.size());
                    result.put("message", "Bookings retrieved successfully");
                }
            }
            // Get bookings by user ID (admin only)
            else if (userIdParam != null && !userIdParam.isEmpty()) {
                if (!isAdmin) {
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                    result.put("success", false);
                    result.put("message", "Admin access required");
                } else {
                    int userId = Integer.parseInt(userIdParam);
                    List<Booking> bookings = bookingDao.findByUserId(userId);
                    result.put("success", true);
                    result.put("data", bookings);
                    result.put("count", bookings.size());
                    result.put("message", "Bookings retrieved successfully");
                }
            }
            // Get all bookings (admin) or user's bookings
            else {
                List<Booking> bookings;
                if (isAdmin) {
                    bookings = bookingDao.findAll();
                    result.put("message", "All bookings retrieved successfully");
                } else {
                    bookings = bookingDao.findByUserId(user.getUser_id());
                    result.put("message", "Your bookings retrieved successfully");
                }
                result.put("success", true);
                result.put("data", bookings);
                result.put("count", bookings.size());
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
