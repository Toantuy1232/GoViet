package toan.dev;

import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.DestinationsDao;
import toan.dev.data.model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class HomeServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Sử dụng interface DataProvider để truyền dữ liệu
        setDataAttributes(request);
        List<CategoryGallery> categoryGalleryList = DatabaseDao.getInstance()
                .getCategoryGalleryDao().findAll();
        if (categoryGalleryList != null && !categoryGalleryList.isEmpty()) {
            int randomIndex = (int) (Math.random() * categoryGalleryList.size());
            CategoryGallery randomImage = categoryGalleryList.get(randomIndex);
            request.setAttribute("randomGalleryImage", randomImage);
        }
        List<Blogposts> blogPosts = DatabaseDao.getInstance().getBlogDao().findAll();
        if (blogPosts != null && !blogPosts.isEmpty()) {
            Collections.shuffle(blogPosts);
            int count = Math.min(blogPosts.size(), 3);
            List<Blogposts> randomBlogPosts = blogPosts.subList(0, count);
            request.setAttribute("randomBlogPosts", randomBlogPosts);
        }
        List<Users> allUsers = DatabaseDao.getInstance().getUserDao().findAll();
        List<Users> guides = new ArrayList<>();
        for (Users user : allUsers) {
            if (user.getRole() != null && user.getRole().equalsIgnoreCase("GUIDE")) {

                if (user.getAvatar_url() != null && !user.getAvatar_url().startsWith("/")) {
                    user.setAvatar_url("/" + user.getAvatar_url());
                }
                guides.add(user);
            }
        }
        if (guides.isEmpty()) {
            Users sampleGuide = new Users("guide@example.com", "hashedpassword", "GUIDE");
            sampleGuide.setFullname("Nguyễn Bá Toàn");
            sampleGuide.setAvatar_url("/assets/images/avatars/default-avatar.jpg");
            guides.add(sampleGuide);
        }
        DestinationsDao destinationDao = DatabaseDao.getInstance().getDestinationsDao();
        List<Destinations> destinations = destinationDao.findAll();
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categories = categoryDao.findAll();
        request.setAttribute("categories", categories);
        request.setAttribute("destinations", destinations);
        request.setAttribute("guides", guides);
        request.setAttribute("categoryGalleryList", categoryGalleryList);
        request.setAttribute("destinationsList", DatabaseDao.getInstance().getDestinationsDao().findAll());
        request.setAttribute("categoryList", DatabaseDao.getInstance().getCategoryDao().findAll());
        
        request.setAttribute("showBanner", true);
        
        // Forward đến index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests - chuyển về GET
        doGet(request, response);
    }
}
