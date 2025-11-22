package toan.dev.admin.Hotel;

import java.io.File;
import java.io.IOException;
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
public class CreateHotelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            var destinations = DatabaseDao.getInstance().getDestinationsDao().findAll();
            var tours = DatabaseDao.getInstance().getTourDao().findAll();
            request.setAttribute("destinations", destinations);
            request.setAttribute("tours", tours);
            request.getRequestDispatcher("admin/hotel/create.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("IndexHotelServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            int destinationId = Integer.parseInt(request.getParameter("destination_id"));
            int tourId = Integer.parseInt(request.getParameter("tour_id"));
            String address = request.getParameter("address");
            double pricePerNight = Double.parseDouble(request.getParameter("price_per_night").replaceAll("[^\\d.]", ""));
            int stars = Integer.parseInt(request.getParameter("stars"));
            String description = request.getParameter("description");
            Part filePart = request.getPart("image");
            String fileName = null;

            if (filePart != null && filePart.getSize() > 0) {
                String appPath = getServletContext().getRealPath("");
                String uploadPath = appPath + ".." + File.separator + "assets" + File.separator + "images";
                uploadPath = new File(uploadPath).getCanonicalPath();
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                fileName = getFileName(filePart);

                File uploadedFile = new File(uploadPath + File.separator + fileName);
                filePart.write(uploadedFile.getAbsolutePath());
                
                if (!uploadedFile.exists()) {
                    throw new IOException("Failed to save uploaded file: " + uploadedFile.getAbsolutePath());
                }
            }

            Hotels hotel = new Hotels(
                    destinationId,
                    name,
                    address,
                    pricePerNight,
                    stars,
                    fileName,
                    tourId
            );
            hotel.setHotel_id(0); 

            HotelsDao hotelsDao = DatabaseDao.getInstance().getHotelsDao();
            hotelsDao.insert(hotel);

            request.getSession().setAttribute("successMessage", "Thêm khách sạn thành công!");
            response.sendRedirect("IndexHotelServlet");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            var destinations = DatabaseDao.getInstance().getDestinationsDao().findAll();
            var tours = DatabaseDao.getInstance().getTourDao().findAll();
            request.setAttribute("destinations", destinations);
            request.setAttribute("tours", tours);
            request.getRequestDispatcher("admin/hotel/create.jsp").forward(request, response);
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                String fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
                fileName = fileName.replaceAll("[^a-zA-Z0-9.-]", "_");
                return fileName;
            }
        }
        return "";
    }
}