package toan.dev;

import toan.dev.data.Impl.OrderImpl;
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
        
        if (orderCode != null && !orderCode.isEmpty()) {
            OrderDao orderDao = new OrderImpl();
            Order order = orderDao.findByOrderCode(orderCode);
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
