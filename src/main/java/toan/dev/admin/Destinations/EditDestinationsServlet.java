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
public class EditDestinationsServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String destinationIdParam = request.getParameter("destination_id");
        if (destinationIdParam == null || destinationIdParam.isEmpty()) {
            response.sendRedirect("IndexDestinationsServlet");
            return;
        }

        int destinationId = Integer.parseInt(destinationIdParam);
        DestinationsDao destinationsDao = DatabaseDao.getInstance().getDestinationsDao();
        Destinations destination = destinationsDao.find(destinationId);

        if (destination == null) {
            response.sendRedirect("IndexDestinationsServlet");
            return;
        }

        session.setAttribute("destination", destination);
        request.setAttribute("destination", destination);
        request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
        request.getRequestDispatcher("admin/destinations/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DestinationsDao destinationsDao = DatabaseDao.getInstance().getDestinationsDao();

        String destinationIdParam = request.getParameter("destination_id");
        if (destinationIdParam == null || destinationIdParam.isEmpty()) {
            response.sendRedirect("IndexDestinationsServlet");
            return;
        }

        int destinationId = Integer.parseInt(destinationIdParam);
        Destinations destination = destinationsDao.find(destinationId);
        if (destination == null) {
            response.sendRedirect("IndexDestinationsServlet");
            return;
        }

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
            request.setAttribute("destination", destination);
            request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
            request.getRequestDispatcher("admin/destinations/edit.jsp").forward(request, response);
            return;
        }

        int categoryId = Integer.parseInt(categoryIdRaw);

        destination.setName(name);
        destination.setDescription(description);
        destination.setLocation(location);
        destination.setCategory_id(categoryId);

        String currentImage = destination.getImage_url();
        Part imagePart = request.getPart("image_file");
        if (imagePart != null && imagePart.getSize() > 0) {
            String submitted = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            if (!submitted.isBlank()) {
                String uploadDir = getServletContext().getRealPath("/img");
                Files.createDirectories(Path.of(uploadDir));
                Path dest = Path.of(uploadDir, submitted);
                Files.copy(imagePart.getInputStream(), dest, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                currentImage = submitted;
            }
        }
        destination.setImage_url(currentImage);
        destination.setBest_time_to_visit(bestTimeToVisit);
        destination.setCreated_at(new Timestamp(System.currentTimeMillis()));

        boolean success = destinationsDao.update(destination);
        if (!success) {
            session.setAttribute("errorMessage", "Không thể cập nhật điểm đến, vui lòng thử lại");
            request.setAttribute("destination", destination);
            request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
            request.getRequestDispatcher("admin/destinations/edit.jsp").forward(request, response);
            return;
        }

        response.sendRedirect("IndexDestinationsServlet");
    }
}
