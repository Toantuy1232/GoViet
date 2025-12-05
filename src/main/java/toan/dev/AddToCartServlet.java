package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.CartItem;
import toan.dev.data.model.Products;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AddToCartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        String itemIdStr = request.getParameter("itemId");
        
        if (itemIdStr == null || itemIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        try {
            int itemId = Integer.parseInt(itemIdStr);
            HttpSession session = request.getSession();
            
            // Get or create cart
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            
            // Get product info
            ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
            Products product = productsDao.find(itemId);
            
            // Check if item already in cart
            boolean found = false;
            for (CartItem item : cart) {
                if (item.getType().equals(type) && item.getItemId() == itemId) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            
            // Add new item if not found
            if (!found) {
                CartItem newItem = new CartItem(
                    type != null ? type : "tour",
                    itemId,
                    product.getName(),
                    product.getPrice(),
                    1,
                    product.getImage_url()
                );
                cart.add(newItem);
            }
            
            session.setAttribute("cart", cart);
            session.setAttribute("cartMessage", "Đã thêm vào giỏ hàng!");
            
            // Redirect back to previous page
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer != null ? referer : request.getContextPath() + "/");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
