package toan.dev.admin.orders;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.Impl.OrderImpl;
import toan.dev.data.dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateOrderStatusServlet extends BaseAdminServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int orderId = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            String type = request.getParameter("type"); // "order" or "payment"
            
            OrderDao orderDao = new OrderImpl();
            boolean success;
            
            if ("payment".equals(type)) {
                success = orderDao.updatePaymentStatus(orderId, status);
            } else {
                success = orderDao.updateOrderStatus(orderId, status);
            }
            
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/orders?success=updated");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/orders?error=failed");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/orders?error=exception");
        }
    }
}
