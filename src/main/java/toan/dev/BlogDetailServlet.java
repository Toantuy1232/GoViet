package toan.dev;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import toan.dev.data.dao.BlogpostsDao;
import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.Blogposts;
import toan.dev.data.model.Category;
import toan.dev.data.model.Users;

public class BlogDetailServlet extends BaseServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int blogId = Integer.parseInt(request.getParameter("id"));
            DatabaseDao db = DatabaseDao.getInstance();
            BlogpostsDao blogPostDao = db.getBlogDao();
            Blogposts blogPost = blogPostDao.find(blogId);

            if (blogPost == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            UsersDao userDao = db.getUserDao();
            Users author = userDao.find(blogPost.getAuthor_id());

            List<Blogposts> allPosts = blogPostDao.findAll();
            List<Blogposts> relatedPosts = allPosts.stream()
                    .filter(post -> post.getPost_id() != blogId)
                    .limit(3)
                    .collect(Collectors.toList());

            List<Blogposts> recentPosts = allPosts.stream()
                    .filter(post -> post.getPost_id() != blogId)
                    .limit(4)
                    .collect(Collectors.toList());
            CategoryDao categoryDao = db.getCategoryDao();
            List<Category> categories = categoryDao.findAll();
            request.setAttribute("blogPost", blogPost);
            request.setAttribute("author", author);
            request.setAttribute("relatedPosts", relatedPosts);
            request.setAttribute("recentPosts", recentPosts);
            request.setAttribute("categories", categories);
            request.setAttribute("users", db.getUserDao().findAll());
            request.getRequestDispatcher("blog-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid blog post ID");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}