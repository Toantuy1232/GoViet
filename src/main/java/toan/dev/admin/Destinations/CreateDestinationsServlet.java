package toan.dev.admin.Destinations;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.DestinationsDao;
import toan.dev.data.model.Destinations;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;

@MultipartConfig
public class CreateDestinationsServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
        request.getRequestDispatcher("admin/destinations/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String categoryIdRaw = request.getParameter("category_id");
        String bestTimeToVisit = request.getParameter("best_time_to_visit");

        if (name == null || name.isEmpty() ||
                description == null || description.isEmpty() ||
                location == null || location.isEmpty() ||
                categoryIdRaw == null || categoryIdRaw.isEmpty() ||
                bestTimeToVisit == null || bestTimeToVisit.isEmpty()) {
            session.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin điểm đến");
            request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
            request.getRequestDispatcher("admin/destinations/create.jsp").forward(request, response);
            return;
        }

        int categoryId = Integer.parseInt(categoryIdRaw);
        String imageUrl = null;
        Part imagePart = request.getPart("image_file");
        if (imagePart != null && imagePart.getSize() > 0) {
            String submitted = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            if (!submitted.isBlank()) {
                String uploadDir = getServletContext().getRealPath("/img");
                Files.createDirectories(Path.of(uploadDir));
                Path dest = Path.of(uploadDir, submitted);
                Files.copy(imagePart.getInputStream(), dest, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                imageUrl = submitted;
            }
        }

        if (imageUrl == null || imageUrl.isBlank()) {
            session.setAttribute("errorMessage", "Vui lòng chọn ảnh hợp lệ cho điểm đến");
            request.getRequestDispatcher("admin/destinations/create.jsp").forward(request, response);
            return;
        }

        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        Destinations destination = new Destinations(0, name, description, location, categoryId, imageUrl, bestTimeToVisit, createdAt);
        DestinationsDao destinationsDao = DatabaseDao.getInstance().getDestinationsDao();
        boolean success = destinationsDao.insert(destination);

        if (!success) {
            session.setAttribute("errorMessage", "Không thể tạo điểm đến, vui lòng thử lại");
            request.setAttribute("destination", destination);
            request.getRequestDispatcher("admin/destinations/create.jsp").forward(request, response);
            return;
        }

        response.sendRedirect("IndexDestinationsServlet");
    }
}
