package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.OrderDao;
import toan.dev.data.model.Order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OrderSuccessServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setDataAttributes(request);
        
        String orderCode = request.getParameter("code");
        System.out.println("OrderSuccessServlet - Order code: " + orderCode);
        
        if (orderCode != null && !orderCode.isEmpty()) {
            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            Order order = orderDao.findByOrderCode(orderCode);
            System.out.println("Order found: " + (order != null));
            if (order != null) {
                System.out.println("Order ID: " + order.getOrderId() + ", Total: " + order.getTotalAmount());
            }
            request.setAttribute("order", order);
        }
        
        request.getRequestDispatcher("/order-success.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
