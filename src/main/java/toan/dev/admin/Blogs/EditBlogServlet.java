package toan.dev.admin.Blogs;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Blogposts;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@MultipartConfig
public class EditBlogServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("postId");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect("IndexBlogServlet");
            return;
        }
        int postId = Integer.parseInt(idParam);
        Blogposts blog = DatabaseDao.getInstance().getBlogDao().find(postId);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("admin/blog/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Blogposts existing = DatabaseDao.getInstance().getBlogDao().find(postId);

        String coverImage = existing != null ? existing.getCover_image() : null;

        Part filePart = request.getPart("cover_file");
        if (filePart != null && filePart.getSize() > 0) {
            String submitted = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (!submitted.isBlank()) {
                String uploadDir = getServletContext().getRealPath("/img");
                Files.createDirectories(Path.of(uploadDir));
                Path dest = Path.of(uploadDir, submitted);
                Files.copy(filePart.getInputStream(), dest, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                coverImage = submitted;
            }
        }

        int authorId = 1;
        try {
            String authorParam = request.getParameter("author_id");
            if (authorParam != null && !authorParam.isBlank()) {
                authorId = Integer.parseInt(authorParam);
            }
        } catch (NumberFormatException ignored) {}

        java.sql.Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
        Blogposts blog = new Blogposts(postId, authorId, title, content, coverImage, now);

        DatabaseDao.getInstance().getBlogDao().update(blog);
        response.sendRedirect("IndexBlogServlet");
    }
}
