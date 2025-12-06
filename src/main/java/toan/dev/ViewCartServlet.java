package toan.dev;

import toan.dev.data.dao.CartDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.CartItem;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ViewCartServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setDataAttributes(request);
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        List<CartItem> cart = new ArrayList<>();
        double total = 0;
        
        if (user != null) {
            CartDao cartDao = DatabaseDao.getInstance().getCartDao();
            cart = cartDao.findByUserId(user.getUser_id());
            
            System.out.println("=== VIEW CART DEBUG ===");
            System.out.println("User ID: " + user.getUser_id());
            System.out.println("Cart size: " + (cart != null ? cart.size() : 0));
            
            if (cart != null && !cart.isEmpty()) {
                for (CartItem item : cart) {
                    System.out.println("Item: " + item.getItemName() + " - Price: " + item.getPrice() + " - Qty: " + item.getQuantity());
                    total += item.getTotal();
                }
            }
            System.out.println("Total: " + total);
            System.out.println("===================");
        }
        
        request.setAttribute("cart", cart);
        request.setAttribute("cartTotal", total);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
