package toan.dev.admin.user;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.OrderDao;
import toan.dev.data.dao.UsersDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteUserServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int userId = Integer.parseInt(request.getParameter("userId"));
        System.out.println("Delete userId = " + request.getParameter("userId"));

        try {
            // Kiểm tra xem user có orders không
            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            boolean hasOrders = !orderDao.findByUserId(userId).isEmpty();
            System.out.println("User " + userId + " has orders: " + hasOrders);

            if (hasOrders) {
                System.out.println("User has orders, redirecting to error page");
                response.sendRedirect("IndexUserServlet?error=user_has_orders");
                return;
            }

            // Nếu không có orders, thử xóa user
            System.out.println("User has no orders, attempting to delete user");
            UsersDao userDao = DatabaseDao.getInstance().getUserDao();
            boolean deleted = userDao.delete(userId);
            System.out.println("User deleted: " + deleted);

            if (deleted) {
                response.sendRedirect("IndexUserServlet");
            } else {
                response.sendRedirect("IndexUserServlet?error=delete_failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception occurred: " + e.getMessage());
            response.sendRedirect("IndexUserServlet?error=delete_failed");
        }
    }
}
