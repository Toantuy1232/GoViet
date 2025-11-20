package toan.dev.admin.Tours;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Tours;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Time;
import java.sql.Timestamp;

@MultipartConfig
public class CreateTourServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/tour/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double price_old = Double.parseDouble(request.getParameter("price_old"));
        int duration_days = Integer.parseInt(request.getParameter("duration_days"));
        Timestamp start_date = Timestamp.valueOf(request.getParameter("start_date"));
        Timestamp end_date = Timestamp.valueOf(request.getParameter("end_date"));
        int available_slots = Integer.parseInt(request.getParameter("available_slots"));
        String mainImage = null;

        Part filePart = request.getPart("main_image");
        if (filePart != null && filePart.getSize() > 0) {
            String submitted = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (!submitted.isBlank()) {
                String uploadDir = getServletContext().getRealPath("/img");
                Files.createDirectories(Path.of(uploadDir));
                Path dest = Path.of(uploadDir, submitted);
                Files.copy(filePart.getInputStream(), dest, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                mainImage = submitted;
            }
        }

        java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
        Tours tours = new Tours(0, 0, title, description, price, price_old, duration_days, start_date, end_date, available_slots, mainImage,now);

        DatabaseDao.getInstance().getTourDao().insert(tours);
        response.sendRedirect("IndexTourServlet");
    }
}
