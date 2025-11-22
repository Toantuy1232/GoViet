package toan.dev.admin.Hotel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.HotelsDao;
import toan.dev.data.model.Hotels;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class EditHotelServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads/hotels/";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int hotelId = Integer.parseInt(request.getParameter("id"));
            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            Hotels hotel = hotelsDao.find(hotelId);
            
            if (hotel == null) {
                response.sendRedirect("IndexHotelServlet");
                return;
            }
            
            var destinations = DatabaseDao.getInstance().getDestinationsDao().findAll();
            var tours = DatabaseDao.getInstance().getTourDao().findAll();
            request.setAttribute("destinations", destinations);
            request.setAttribute("tours", tours);
            request.setAttribute("hotel", hotel);
            

            try {
                String amenities = (String) hotel.getClass().getMethod("getAmenities").invoke(hotel);
                if (amenities == null) {
                    amenities = "";
                }
                request.setAttribute("hotelAmenities", amenities);
            } catch (Exception e) {
                request.setAttribute("hotelAmenities", "");
            }
            
            request.getRequestDispatcher("admin/hotel/edit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("IndexHotelServlet");
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                String fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
                
                fileName = fileName.replaceAll("\\s+", "");

                String fileExtension = "";
                int lastDot = fileName.lastIndexOf('.');
                if (lastDot > 0) {
                    fileExtension = fileName.substring(lastDot);
                }
                return UUID.randomUUID().toString() + fileExtension;
            }
        }
        return "";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           
            String hotelIdParam = request.getParameter("hotel_id");
            String destinationIdParam = request.getParameter("destination_id");
            String tourIdParam = request.getParameter("tour_id");
            String starsParam = request.getParameter("stars");
            
            if (hotelIdParam == null || destinationIdParam == null || tourIdParam == null || starsParam == null) {
                throw new ServletException("Missing required parameters");
            }
            
            int hotelId = Integer.parseInt(hotelIdParam);
            int destinationId = Integer.parseInt(destinationIdParam);
            int tourId = Integer.parseInt(tourIdParam);
     
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String pricePerNightStr = request.getParameter("price_per_night");
            double pricePerNight = 0;
            if (pricePerNightStr != null && !pricePerNightStr.trim().isEmpty()) {
                pricePerNight = Double.parseDouble(pricePerNightStr.replaceAll("[^\\d.]", ""));
            }
            int stars = Integer.parseInt(starsParam);
            Part filePart = request.getPart("image");
            
     
            String[] amenitiesArray = request.getParameterValues("amenities");
            String amenities = "";
            if (amenitiesArray != null && amenitiesArray.length > 0) {
                amenities = String.join(",", amenitiesArray);
            }
            
            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            Hotels hotel = hotelsDao.find(hotelId);
            
            if (hotel == null) {
                response.sendRedirect("IndexHotelServlet");
                return;
            }
            
    
            String fileName = hotel.getImage_url();
            if (filePart != null && filePart.getSize() > 0) {
              
                if (fileName != null && !fileName.isEmpty()) {
                    String oldFilePath = getServletContext().getRealPath("") + UPLOAD_DIR + File.separator + fileName;
                    File oldFile = new File(oldFilePath);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }
                
             
                String appPath = getServletContext().getRealPath("");
                String uploadPath = appPath + File.separator + UPLOAD_DIR;
               
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                
               
                String targetUploadPath = "d:\\DuLich\\GoViet\\target\\GoViet-1.0-SNAPSHOT\\uploads\\hotels";
                File targetUploadDir = new File(targetUploadPath);
                if (!targetUploadDir.exists()) {
                    targetUploadDir.mkdirs();
                }

                String originalFileName = getFileName(filePart);
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                fileName = UUID.randomUUID().toString() + fileExtension;
            
                File uploadedFile = new File(uploadPath + File.separator + fileName);
                filePart.write(uploadedFile.getAbsolutePath());
                

                File targetFile = new File(targetUploadPath + File.separator + fileName);
                try (InputStream fileContent = filePart.getInputStream();
                     FileOutputStream out = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = fileContent.read(buffer)) > 0) {
                        out.write(buffer, 0, length);
                    }
                }
            }
   
       
            hotel.setName(name);
            hotel.setDestination_id(destinationId);
            hotel.setTour_id(tourId);
            hotel.setAddress(address);
            hotel.setPrice_per_night(pricePerNight);
            hotel.setStars(stars);
            if (fileName != null && !fileName.isEmpty()) {
                hotel.setImage_url(fileName);
            }

            try {
               
                hotel.getClass().getMethod("setAmenities", String.class).invoke(hotel, amenities);
            } catch (Exception e) {
        
                System.out.println("Warning: Could not set amenities - " + e.getMessage());
            }
            
            hotelsDao.update(hotel);
       
            request.getSession().setAttribute("successMessage", "Cập nhật khách sạn thành công!");
            response.sendRedirect("IndexHotelServlet");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật khách sạn: " + e.getMessage());
            var destinations = DatabaseDao.getInstance().getDestinationsDao().findAll();
            var tours = DatabaseDao.getInstance().getTourDao().findAll();
            request.setAttribute("destinations", destinations);
            request.setAttribute("tours", tours);
            request.getRequestDispatcher("admin/hotel/edit.jsp").forward(request, response);
        }
    }
}
