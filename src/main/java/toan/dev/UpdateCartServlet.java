package toan.dev;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import toan.dev.data.dao.CartDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Users;

public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set response content type
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        System.out.println("UpdateCartServlet called");
        System.out.println("User: " + (user != null ? user.getUser_id() : "null"));
        
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"error\": \"Vui lòng đăng nhập\"}");
            return;
        }
        
        String action = request.getParameter("action");
        String itemIdStr = request.getParameter("itemId");
        String type = request.getParameter("type");
        
        System.out.println("Parameters - action: " + action + ", itemId: " + itemIdStr + ", type: " + type);
        
        if (itemIdStr == null || type == null || action == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Thiếu thông tin\"}");
            return;
        }
        
        try {
            int itemId = Integer.parseInt(itemIdStr);
            CartDao cartDao = DatabaseDao.getInstance().getCartDao();
            
            switch (action) {
                case "update":
                    String quantityStr = request.getParameter("quantity");
                    System.out.println("Quantity parameter: " + quantityStr);
                    
                    if (quantityStr == null) {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("{\"error\": \"Thiếu số lượng\"}");
                        return;
                    }
                    
                    int quantity = Integer.parseInt(quantityStr);
                    if (quantity < 1) {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("{\"error\": \"Số lượng phải lớn hơn 0\"}");
                        return;
                    }
                    
                    System.out.println("Updating cart - userId: " + user.getUser_id() + ", itemId: " + itemId + ", quantity: " + quantity);
                    
                    boolean updated = cartDao.updateQuantity(user.getUser_id(), itemId, type, quantity);
                    System.out.println("Update result: " + updated);
                    
                    if (updated) {
                        response.getWriter().write("{\"success\": true, \"message\": \"Cập nhật thành công\"}");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().write("{\"error\": \"Không thể cập nhật giỏ hàng\"}");
                    }
                    break;
                    
                case "remove":
                    System.out.println("Removing from cart - userId: " + user.getUser_id() + ", itemId: " + itemId);
                    
                    boolean removed = cartDao.removeFromCart(user.getUser_id(), itemId, type);
                    System.out.println("Remove result: " + removed);
                    
                    if (removed) {
                        response.getWriter().write("{\"success\": true, \"message\": \"Xóa thành công\"}");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().write("{\"error\": \"Không thể xóa sản phẩm\"}");
                    }
                    break;
                    
                default:
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("{\"error\": \"Hành động không hợp lệ\"}");
                    break;
            }
            
        } catch (NumberFormatException e) {
            System.err.println("NumberFormatException: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Định dạng số không hợp lệ\"}");
        } catch (Exception e) {
            System.err.println("Exception in UpdateCartServlet: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Lỗi server: " + e.getMessage() + "\"}");
        }
    }
}