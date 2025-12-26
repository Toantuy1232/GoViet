package toan.dev;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import toan.dev.data.dao.BookingDao;
import toan.dev.data.dao.OrderDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Booking;
import toan.dev.data.model.Order;
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
            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            Booking order = null;
            Order orderObj = null;
            
            if (orderCode != null && !orderCode.trim().isEmpty()) {
                System.out.println("Finding by order code: " + orderCode);
                
                orderObj = orderDao.findByOrderCode(orderCode);
                if (orderObj != null) {
                    System.out.println("Found in Order system: " + orderObj.getOrderId());
        
                    order = convertOrderToBooking(orderObj);
                } else {
                 
                    order = bookingDao.findByOrderCode(orderCode);
                    System.out.println("Found in Booking system: " + (order != null));
                }
            } else if (orderIdStr != null && !orderIdStr.trim().isEmpty()) {
                System.out.println("Finding by ID: " + orderIdStr);
                int orderId = Integer.parseInt(orderIdStr);
                
         
                orderObj = orderDao.find(orderId);
                if (orderObj != null) {
                    System.out.println("Found in Order system by ID: " + orderObj.getOrderId());
                    order = convertOrderToBooking(orderObj);
                } else {
                    order = bookingDao.find(orderId);
                    System.out.println("Found in Booking system by ID: " + (order != null));
                }
            }
            
            if (order == null) {
                System.out.println("Order not found in both systems");
                
                BookingDao bookingDao2 = DatabaseDao.getInstance().getBookingDao();
                OrderDao orderDao2 = DatabaseDao.getInstance().getOrderDao();
                
                List<Booking> userBookings = bookingDao2.findByUserId(user.getUser_id());
                List<Order> userOrders = orderDao2.findByUserId(user.getUser_id());
                
                request.setAttribute("errorMessage", "Không tìm thấy đơn hàng");
                request.setAttribute("debugInfo", "User có " + userBookings.size() + " booking và " + userOrders.size() + " order");
                request.setAttribute("userBookings", userBookings);
                request.setAttribute("userOrders", userOrders);
                request.setAttribute("searchCode", orderCode);
                request.setAttribute("searchId", orderIdStr);
                
                request.getRequestDispatcher("order-detail.jsp").forward(request, response);
                return;
            }
            
            System.out.println("Order found - ID: " + order.getId() + ", User: " + order.getUserId());
            
        
            if (order.getUserId() != user.getUser_id()) {
                System.out.println("User doesn't own this order");
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền xem đơn hàng này");
                return;
            }
            
            if (order.getOrderCode() == null || order.getOrderCode().isEmpty()) {
                order.setOrderCode("ORD" + order.getId());
            }
            
        
            if (order.getPaymentMethod() == null) {
                order.setPaymentMethod("Chuyển khoản");
            }
            
       
            request.setAttribute("order", order);
    
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
    
    private Booking convertOrderToBooking(Order orderObj) {
        Booking booking = new Booking();
        booking.setId(orderObj.getOrderId());
        booking.setUserId(orderObj.getUserId());
        booking.setOrderCode(orderObj.getOrderCode());
        booking.setCustomerName(orderObj.getCustomerName());
        booking.setCustomerEmail(orderObj.getCustomerEmail());
        booking.setCustomerPhone(orderObj.getCustomerPhone());
        booking.setAddress(orderObj.getCustomerAddress());
        booking.setTotalPrice(orderObj.getTotalAmount());
        booking.setTotalAmount(orderObj.getTotalAmount());
        booking.setPaymentMethod(orderObj.getPaymentMethod());
        booking.setSpecialRequests(orderObj.getNotes());
        booking.setStatus(orderObj.getOrderStatus());
        booking.setCreatedAt(orderObj.getCreatedAt());
        booking.setUpdatedAt(orderObj.getUpdatedAt());
        
        booking.setBookingType("product");
        booking.setNumberOfPeople(1);
        
        return booking;
    }
}