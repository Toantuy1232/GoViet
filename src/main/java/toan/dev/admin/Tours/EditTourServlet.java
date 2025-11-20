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
import java.sql.Timestamp;

@MultipartConfig
public class EditTourServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("tourId");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect("IndexTourServlet");
            return;
        }
        int tourId = Integer.parseInt(idParam);
        Tours tours = DatabaseDao.getInstance().getTourDao().find(tourId);
        request.setAttribute("tour", tours);
        request.getRequestDispatcher("admin/tour/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tourId = Integer.parseInt(request.getParameter("tourId"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double price_old = Double.parseDouble(request.getParameter("price_old"));
        int duration_days = Integer.parseInt(request.getParameter("duration_days"));
        Timestamp start_date = Timestamp.valueOf(request.getParameter("start_date"));
        Timestamp end_date = Timestamp.valueOf(request.getParameter("end_date"));
        int available_slots = Integer.parseInt(request.getParameter("available_slots"));
        Tours existing = DatabaseDao.getInstance().getTourDao().find(tourId);

        String mainImage = existing != null ? existing.getMain_image() : null;

        Part filePart = request.getPart("cover_file");
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
        Tours tours = new Tours(tourId, title, description, price, price_old, duration_days, start_date, end_date, available_slots, mainImage, now);

        DatabaseDao.getInstance().getTourDao().update(tours);
        response.sendRedirect("IndexTourServlet");
    }
}
