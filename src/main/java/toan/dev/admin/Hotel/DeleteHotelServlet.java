package toan.dev.admin.Hotel;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteHotelServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int HotelId = Integer.parseInt(request.getParameter("HotelId"));
        DatabaseDao.getInstance().getHotelsDao().delete(HotelId);
        response.sendRedirect("IndexHotelServlet");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
