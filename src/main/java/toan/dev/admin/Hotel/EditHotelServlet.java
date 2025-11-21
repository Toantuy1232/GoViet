package toan.dev.admin.Hotel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.HotelsDao;
import toan.dev.data.model.Hotels;

public class EditHotelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            Hotels hotel = hotelsDao.find(hotelId);
            
            if (hotel == null) {
                response.sendRedirect("IndexHotelServlet");
                return;
            }
            
            request.setAttribute("hotel", hotel);
            request.getRequestDispatcher("admin/hotel/edit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("IndexHotelServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
            int destinationId = Integer.parseInt(request.getParameter("destination_id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            double pricePerNight = Double.parseDouble(request.getParameter("price_per_night"));
            int stars = Integer.parseInt(request.getParameter("stars"));
            String imageUrl = request.getParameter("image_url");
            int tourId = Integer.parseInt(request.getParameter("tour_id"));

            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            Hotels hotel = hotelsDao.find(hotelId);
            
            if (hotel == null) {
                response.sendRedirect("IndexHotelServlet");
                return;
            }
      
            hotel.setDestination_id(destinationId);
            hotel.setName(name);
            hotel.setAddress(address);
            hotel.setPrice_per_night(pricePerNight);
            hotel.setStars(stars);
            hotel.setImage_url(imageUrl);
            hotel.setTour_id(tourId);
            
            hotelsDao.update(hotel);
       
            response.sendRedirect("IndexHotelServlet");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating hotel: " + e.getMessage());
            request.getRequestDispatcher("admin/hotel/edit.jsp").forward(request, response);
        }
    }
}
