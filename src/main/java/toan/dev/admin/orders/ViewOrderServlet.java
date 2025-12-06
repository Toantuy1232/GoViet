package toan.dev.admin.orders;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.Impl.OrderImpl;
import toan.dev.data.dao.OrderDao;
import toan.dev.data.model.Order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ViewOrderServlet extends BaseAdminServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/orders");
            return;
        }
        
        try {
            int orderId = Integer.parseInt(idStr);
            OrderDao orderDao = new OrderImpl();
            Order order = orderDao.find(orderId);
            
            if (order == null) {
                response.sendRedirect(request.getContextPath() + "/admin/orders");
                return;
            }
            
            request.setAttribute("order", order);
            request.getRequestDispatcher("/admin/orders/view.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/orders");
        }
    }
}
