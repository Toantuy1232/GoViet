package toan.dev.admin.Hotel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.HotelsDao;
import toan.dev.data.model.Hotels;

public class CreateHotelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/hotels/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int destinationId = Integer.parseInt(request.getParameter("destination_id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            double pricePerNight = Double.parseDouble(request.getParameter("price_per_night"));
            int stars = Integer.parseInt(request.getParameter("stars"));
            String imageUrl = request.getParameter("image_url");
            int tourId = Integer.parseInt(request.getParameter("tour_id"));

            Hotels hotel = new Hotels(destinationId, name, address, pricePerNight, stars, imageUrl, tourId);
            hotel.setDestination_id(destinationId);
            hotel.setName(name);
            hotel.setAddress(address);
            hotel.setPrice_per_night(pricePerNight);
            hotel.setStars(stars);
            hotel.setImage_url(imageUrl);
            hotel.setTour_id(tourId);

            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            hotelsDao.insert(hotel);

        
            response.sendRedirect("IndexHotelServlet");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error creating hotel: " + e.getMessage());
            request.getRequestDispatcher("admin/hotels/create.jsp").forward(request, response);
        }
    }
}
