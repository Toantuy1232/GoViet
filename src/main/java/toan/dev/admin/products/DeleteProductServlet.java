package toan.dev.admin.products;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/admin/products/delete", "/DeleteProductServlet"})
public class DeleteProductServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
        boolean success = productsDao.delete(id);
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/products?message=delete_success");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/products?error=delete_failed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
