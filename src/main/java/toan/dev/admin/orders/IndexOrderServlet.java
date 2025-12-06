package toan.dev.admin.orders;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.Impl.OrderImpl;
import toan.dev.data.dao.OrderDao;
import toan.dev.data.model.Order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexOrderServlet extends BaseAdminServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        OrderDao orderDao = new OrderImpl();
        String statusFilter = request.getParameter("status");
        
        List<Order> orders;
        if (statusFilter != null && !statusFilter.isEmpty()) {
            orders = orderDao.findByStatus(statusFilter);
        } else {
            orders = orderDao.findAll();
        }
        
        request.setAttribute("orders", orders);
        request.setAttribute("statusFilter", statusFilter);
        request.getRequestDispatcher("/admin/orders/index.jsp").forward(request, response);
    }
}
