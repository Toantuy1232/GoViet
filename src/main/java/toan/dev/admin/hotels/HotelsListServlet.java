package toan.dev.admin.hotels;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.HotelsDao;
import toan.dev.data.model.Hotels;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HotelsListServlet", urlPatterns = {"/admin/hotels"})
public class HotelsListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
        List<Hotels> hotelsList = hotelsDao.findAll();
        
        request.setAttribute("hotelsList", hotelsList);
        request.getRequestDispatcher("/admin/hotels/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
