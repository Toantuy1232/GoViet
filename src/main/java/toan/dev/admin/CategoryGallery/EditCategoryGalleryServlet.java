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
public class EditCategoryGalleryServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("categoryId");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect("IndexCategoryGalleryServlet");
            return;
        }
        int id = Integer.parseInt(idParam);
        CategoryGallery item = DatabaseDao.getInstance().getCategoryGalleryDao().find(id);
        List<Category> categoryList = DatabaseDao.getInstance().getCategoryDao().findAll();

        request.setAttribute("item", item);
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/categorygallery/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));

        CategoryGallery existing = DatabaseDao.getInstance().getCategoryGalleryDao().find(id);
        String uploadDir = getServletContext().getRealPath("/img");
        Files.createDirectories(Path.of(uploadDir));

        Timestamp createdAt = existing != null ? existing.getCreated_at() : new Timestamp(System.currentTimeMillis());

        boolean firstImageHandled = false;
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

            if (!firstImageHandled && existing != null) {
                // Ảnh đầu tiên: cập nhật bản ghi hiện tại
                CategoryGallery cgUpdate = new CategoryGallery(id, category_id, submitted, createdAt);
                DatabaseDao.getInstance().getCategoryGalleryDao().update(cgUpdate);
                firstImageHandled = true;
            } else {
                // Các ảnh còn lại: thêm bản ghi mới cho cùng category
                Timestamp now = new Timestamp(System.currentTimeMillis());
                CategoryGallery cgNew = new CategoryGallery(0, category_id, submitted, now);
                DatabaseDao.getInstance().getCategoryGalleryDao().insert(cgNew);
            }
        }

        // Nếu không upload ảnh nào, chỉ cập nhật lại category_id cho bản ghi hiện tại
        if (!firstImageHandled && existing != null) {
            CategoryGallery cgUpdateOnly = new CategoryGallery(id, category_id, existing.getImage_url(), createdAt);
            DatabaseDao.getInstance().getCategoryGalleryDao().update(cgUpdateOnly);
        }

        response.sendRedirect("IndexCategoryGalleryServlet");
    }
}
