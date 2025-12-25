package toan.dev;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import toan.dev.data.dao.BookingDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Booking;
import toan.dev.data.model.Users;

public class OrderDetailServlet extends BaseServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("OrderDetailServlet called");
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        System.out.println("User: " + (user != null ? user.getUser_id() : "null"));
        
        if (user == null) {
            System.out.println("User not logged in, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        
        String orderCode = request.getParameter("code");
        String orderIdStr = request.getParameter("id");
        
        System.out.println("Parameters - code: " + orderCode + ", id: " + orderIdStr);
        
        if (orderCode == null && orderIdStr == null) {
            System.out.println("Missing parameters");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu thông tin đơn hàng");
            return;
        }
        
        try {
            BookingDao bookingDao = DatabaseDao.getInstance().getBookingDao();
            Booking order = null;
            
            if (orderCode != null && !orderCode.trim().isEmpty()) {
                System.out.println("Finding by order code: " + orderCode);
                order = bookingDao.findByOrderCode(orderCode);
                System.out.println("Found by code: " + (order != null));
            } else if (orderIdStr != null && !orderIdStr.trim().isEmpty()) {
                System.out.println("Finding by ID: " + orderIdStr);
                int orderId = Integer.parseInt(orderIdStr);
                order = bookingDao.find(orderId);
                System.out.println("Found by ID: " + (order != null));
            }
            
            if (order == null) {
                System.out.println("Order not found");
                request.setAttribute("errorMessage", "Không tìm thấy đơn hàng");
                request.getRequestDispatcher("order-detail.jsp").forward(request, response);
                return;
            }
            
            System.out.println("Order found - ID: " + order.getId() + ", User: " + order.getUserId());
            
            // Check if user owns this order
            if (order.getUserId() != user.getUser_id()) {
                System.out.println("User doesn't own this order");
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền xem đơn hàng này");
                return;
            }
            
            // Set additional order information for display
            if (order.getOrderCode() == null || order.getOrderCode().isEmpty()) {
                order.setOrderCode("ORD" + order.getId());
            }
            
            // Set default values if missing
            if (order.getPaymentMethod() == null) {
                order.setPaymentMethod("Chuyển khoản");
            }
            
            // Set order information
            request.setAttribute("order", order);
            
            // Set common data attributes
            setDataAttributes(request);
            
            System.out.println("Forwarding to order-detail.jsp");
            request.getRequestDispatcher("order-detail.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            System.err.println("NumberFormatException: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID đơn hàng không hợp lệ");
        } catch (Exception e) {
            System.err.println("Error in OrderDetailServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}