package toan.dev.admin.CategoryGallery;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Category;
import toan.dev.data.model.CategoryGallery;

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
import java.util.List;

@MultipartConfig
public class CreateCategoryGalleryServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categoryList = DatabaseDao.getInstance().getCategoryDao().findAll();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/categorygallery/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        String uploadDir = getServletContext().getRealPath("/img");
        Files.createDirectories(Path.of(uploadDir));

        Timestamp now = new Timestamp(System.currentTimeMillis());

        for (Part part : request.getParts()) {
            if (!"images".equals(part.getName()) || part.getSize() <= 0) {
                continue;
            }
            String submitted = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (submitted == null || submitted.isBlank()) {
                continue;
            }
            Path dest = Path.of(uploadDir, submitted);
            Files.copy(part.getInputStream(), dest, java.nio.file.StandardCopyOption.REPLACE_EXISTING);

            CategoryGallery cg = new CategoryGallery(0, category_id, submitted, now);
            DatabaseDao.getInstance().getCategoryGalleryDao().insert(cg);
        }

        response.sendRedirect("IndexCategoryGalleryServlet");
    }
}
