package toan.dev.admin;

import toan.dev.data.dao.*;
import toan.dev.data.model.Products;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DashboardServlet extends BaseAdminServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DatabaseDao db = DatabaseDao.getInstance();
        UsersDao userDao = db.getUserDao();
        ProductsDao productsDao = db.getProductDao();
        // Số lượng user, sản phẩm, đơn hàng
        int numberUser = userDao.findAll().size();
        List<Products> productsList = productsDao.findAll();
        int numberProducts = productsList.size();

        // Gán attribute để hiển thị ra JSP
        request.setAttribute("numberUser", numberUser);
        request.setAttribute("numberProduct", numberProducts);
        request.setAttribute("productList", productsList);


        // Chart earnings (chưa có API -> set rỗng để tránh lỗi JSP)
        List<String> dateList = new ArrayList<>();
        request.setAttribute("dateList", dateList);
        List<Double> earningEachDay = new ArrayList<>();
        request.setAttribute("earningEachDay", earningEachDay);

        // Forward tới dashboard.jsp
        request.getRequestDispatcher("admin/dashboard.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
