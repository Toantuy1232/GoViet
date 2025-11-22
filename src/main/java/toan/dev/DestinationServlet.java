package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.DestinationsDao;
import toan.dev.data.model.Destinations;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DestinationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DestinationsDao destinationDao = DatabaseDao.getInstance().getDestinationsDao();
            List<Destinations> destinationList = destinationDao.findAll();
            request.setAttribute("destinations", destinationList);
            request.getRequestDispatcher("/destination.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}