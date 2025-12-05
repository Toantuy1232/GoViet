package toan.dev.admin.hotels;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.HotelsDao;
import toan.dev.data.model.Hotels;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "HotelsEditServlet", urlPatterns = {"/admin/hotels/edit"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class HotelsEditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/hotels");
            return;
        }
        
        try {
            int hotelId = Integer.parseInt(idParam);
            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            Hotels hotel = hotelsDao.find(hotelId);
            
            request.setAttribute("hotel", hotel);
            request.getRequestDispatcher("/admin/hotels/edit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/hotels");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        try {
            int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
            int destinationId = Integer.parseInt(request.getParameter("destination_id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            double pricePerNight = Double.parseDouble(request.getParameter("price_per_night"));
            int stars = Integer.parseInt(request.getParameter("stars"));
            int tourId = Integer.parseInt(request.getParameter("tour_id"));
            
            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            Hotels hotel = hotelsDao.find(hotelId);
            
            // Handle image upload
            Part filePart = request.getPart("image");
            String imageUrl = hotel.getImage_url(); // Keep old image by default
            
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = filePart.getSubmittedFileName();
                String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                String newFileName = UUID.randomUUID().toString() + fileExtension;
                
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "hotels";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                
                String filePath = uploadPath + File.separator + newFileName;
                filePart.write(filePath);
                
                imageUrl = newFileName;
            }
            
            hotel.setDestination_id(destinationId);
            hotel.setName(name);
            hotel.setAddress(address);
            hotel.setPrice_per_night(pricePerNight);
            hotel.setStars(stars);
            hotel.setImage_url(imageUrl);
            hotel.setTour_id(tourId);
            
            boolean success = hotelsDao.update(hotel);
            
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/hotels?success=updated");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/hotels/edit?id=" + hotelId + "&error=update_failed");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/hotels?error=exception");
        }
    }
}
