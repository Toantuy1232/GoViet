package toan.dev.admin.Tours;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Tours;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexTourServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Tours> toursList = DatabaseDao.getInstance().getTourDao().findAll();
        request.setAttribute("toursList", toursList);
        request.getRequestDispatcher("admin/tour/index.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
