package toan.dev;

import toan.dev.data.dao.CartDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.CartItem;
import toan.dev.data.model.Products;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddToCartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI() + "?" + request.getQueryString());
            session.setAttribute("errors", "Vui lòng đăng nhập để thêm vào giỏ hàng!");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        
        String itemIdStr = request.getParameter("itemId");
        
        if (itemIdStr == null || itemIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        try {
            int itemId = Integer.parseInt(itemIdStr);
            int userId = user.getUser_id();

            ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
            Products product = productsDao.find(itemId);
            
            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/");
                return;
            }
            
            CartDao cartDao = DatabaseDao.getInstance().getCartDao();

            CartItem existingItem = cartDao.findByUserAndProduct(userId, itemId);
            
            if (existingItem != null) {
                existingItem.setQuantity(existingItem.getQuantity() + 1);
                cartDao.update(existingItem);
            } else {
                CartItem newItem = new CartItem(
                    userId,
                    itemId,
                    product.getName(),
                    product.getImage_url(),
                    product.getPrice(),
                    1
                );
                cartDao.insert(newItem);
            }
            
            session.setAttribute("cartMessage", "Đã thêm vào giỏ hàng!");
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer != null ? referer : request.getContextPath() + "/");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
