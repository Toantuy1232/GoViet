package toan.dev.admin.user;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexUserServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        UsersDao userDao = DatabaseDao.getInstance().getUserDao();
        List<Users> userList = userDao.findAll();

        request.setAttribute("userList", userList);

        // Xử lý thông báo lỗi nếu có
        String error = request.getParameter("error");
        if ("delete_failed".equals(error)) {
            request.setAttribute("errorMessage", "Không thể xóa user. Vui lòng thử lại.");
        } else if ("user_has_orders".equals(error)) {
            request.setAttribute("errorMessage", "Không thể xóa user vì user này có đơn hàng. Vui lòng xóa đơn hàng trước.");
        }

        request.getRequestDispatcher("admin/user/index.jsp").include(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
