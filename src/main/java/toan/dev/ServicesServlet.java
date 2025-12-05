package toan.dev;

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

@WebServlet(name = "ServicesServlet", urlPatterns = {"/services", "/ServicesServlet"})
public class ServicesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
        List<Hotels> hotels = hotelsDao.findAll();
        
        System.out.println("DEBUG: Found " + (hotels != null ? hotels.size() : 0) + " hotels");
        
        // Debug: Print hotel details
        if (hotels != null && !hotels.isEmpty()) {
            for (Hotels hotel : hotels) {
                System.out.println("Hotel: " + hotel.getName() + 
                    " - Price: " + hotel.getPrice_per_night() + 
                    " - Image: " + hotel.getImage_url());
            }
        }
        
        request.setAttribute("hotels", hotels);
        request.getRequestDispatcher("/services.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
