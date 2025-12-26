package toan.dev;

import toan.dev.data.dao.CartDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.OrderDao;
import toan.dev.data.model.CartItem;
import toan.dev.data.model.Order;
import toan.dev.data.model.OrderItem;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CheckoutServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setDataAttributes(request);
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            session.setAttribute("redirectAfterLogin", request.getContextPath() + "/checkout");
            session.setAttribute("errors", "Vui lòng đăng nhập để thanh toán!");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        CartDao cartDao = DatabaseDao.getInstance().getCartDao();
        List<CartItem> cart = cartDao.findByUserId(user.getUser_id());
        
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        
        //Tính Tổng Tiền
        double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();
        
        request.setAttribute("cart", cart);
        request.setAttribute("total", total);
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet");
                return;
            }
            

            CartDao cartDao = DatabaseDao.getInstance().getCartDao();
            List<CartItem> cart = cartDao.findByUserId(user.getUser_id());
            
            if (cart == null || cart.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }
            
            // Lấy từ database
            String customerName = request.getParameter("customerName");
            String customerEmail = request.getParameter("customerEmail");
            String customerPhone = request.getParameter("customerPhone");
            String customerAddress = request.getParameter("customerAddress");
            String paymentMethod = request.getParameter("paymentMethod");
            String notes = request.getParameter("notes");
            
            // tính tổng tền
            double totalAmount = cart.stream().mapToDouble(CartItem::getSubtotal).sum();
            
            // tạo mã order
            String orderCode = "ORD" + System.currentTimeMillis();
            
            // tạo order
            Order order = new Order(user.getUser_id(), orderCode, customerName, customerEmail,
                    customerPhone, customerAddress, totalAmount, paymentMethod, notes);
            
            // thêm vào giỏ hàng
            for (CartItem cartItem : cart) {
                OrderItem orderItem = new OrderItem(0, cartItem.getProductId(),
                        cartItem.getProductName(), cartItem.getProductImage(),
                        cartItem.getQuantity(), cartItem.getPrice());
                order.addOrderItem(orderItem);
            }
            
            // Lưu order
            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            System.out.println("Attempting to save order with code: " + orderCode);
            System.out.println("Order details - User: " + user.getUser_id() + ", Total: " + totalAmount + ", Items: " + cart.size());
            
            boolean success = orderDao.insert(order);
            System.out.println("Order save result: " + success);
            
            if (success) {
                System.out.println("Order saved successfully, clearing cart for user: " + user.getUser_id());
                // xoá giỏ hàng trong database
                cartDao.clearCart(user.getUser_id());
                session.setAttribute("message", "Đặt hàng thành công! Mã đơn hàng: " + orderCode);
                response.sendRedirect(request.getContextPath() + "/order-success?code=" + orderCode);
            } else {
                System.out.println("Failed to save order");
                request.setAttribute("error", "Đặt hàng thất bại. Vui lòng thử lại!");
                doGet(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            doGet(request, response);
        }
    }
}
