package toan.dev.admin.Blogs;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Blogposts;
import toan.dev.data.model.Users;

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
public class CreateBlogServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        java.util.List<Users> users = DatabaseDao.getInstance().getUserDao().findAll();
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin/blog/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String coverImage = null;

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
        Blogposts blog = new Blogposts(0, authorId, title, content, coverImage, now);

        DatabaseDao.getInstance().getBlogDao().insert(blog);
        response.sendRedirect("IndexBlogServlet");
    }
}
