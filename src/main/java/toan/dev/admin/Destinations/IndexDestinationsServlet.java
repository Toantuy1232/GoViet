package toan.dev.admin.Destinations;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Destinations;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexDestinationsServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Destinations> destinationsList = DatabaseDao.getInstance().getDestinationsDao().findAll();
        request.setAttribute("destinationsList", destinationsList);
        request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
        request.getRequestDispatcher("admin/destinations/index.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
