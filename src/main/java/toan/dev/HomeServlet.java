package toan.dev;

import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.DestinationsDao;
import toan.dev.data.model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class HomeServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== HomeServlet.doGet() called ===");
        
        try {
            // Test database connection first
            System.out.println("Testing database connection...");
            Connection testConn = DatabaseDao.getDriver().getConnection();
            if (testConn != null) {
                System.out.println("✅ Database connection successful!");
                testConn.close();
            } else {
                System.err.println("❌ Database connection failed!");
                throw new RuntimeException("Database connection is null");
            }
            
            // Sử dụng interface DataProvider để truyền dữ liệu
            System.out.println("Calling setDataAttributes...");
            setDataAttributes(request);
            System.out.println("✅ setDataAttributes completed");
            
            request.setAttribute("showBanner", true);
            System.out.println("✅ showBanner set to true");
            
            // Try to get data from database with detailed error logging
            System.out.println("=== Loading CategoryGallery ===");
            List<CategoryGallery> categoryGalleryList = null;
            try {
                categoryGalleryList = DatabaseDao.getInstance().getCategoryGalleryDao().findAll();
                System.out.println("✅ CategoryGallery loaded: " + (categoryGalleryList != null ? categoryGalleryList.size() : "null") + " items");
            } catch (Exception e) {
                System.err.println("❌ Error loading CategoryGallery: " + e.getMessage());
                e.printStackTrace();
                categoryGalleryList = new ArrayList<>();
            }
            
            System.out.println("=== Loading BlogPosts ===");
            List<Blogposts> blogPosts = null;
            try {
                blogPosts = DatabaseDao.getInstance().getBlogDao().findAll();
                System.out.println("✅ BlogPosts loaded: " + (blogPosts != null ? blogPosts.size() : "null") + " items");
            } catch (Exception e) {
                System.err.println("❌ Error loading BlogPosts: " + e.getMessage());
                e.printStackTrace();
                blogPosts = new ArrayList<>();
            }
            
            System.out.println("=== Loading Users ===");
            List<Users> allUsers = null;
            try {
                allUsers = DatabaseDao.getInstance().getUserDao().findAll();
                System.out.println("✅ Users loaded: " + (allUsers != null ? allUsers.size() : "null") + " items");
            } catch (Exception e) {
                System.err.println("❌ Error loading Users: " + e.getMessage());
                e.printStackTrace();
                allUsers = new ArrayList<>();
            }
            
            System.out.println("=== Loading Destinations ===");
            List<Destinations> destinations = null;
            try {
                destinations = DatabaseDao.getInstance().getDestinationsDao().findAll();
                System.out.println("✅ Destinations loaded: " + (destinations != null ? destinations.size() : "null") + " items");
            } catch (Exception e) {
                System.err.println("❌ Error loading Destinations: " + e.getMessage());
                e.printStackTrace();
                destinations = new ArrayList<>();
            }
            
            System.out.println("=== Loading Categories ===");
            List<Category> categories = null;
            try {
                categories = DatabaseDao.getInstance().getCategoryDao().findAll();
                System.out.println("✅ Categories loaded: " + (categories != null ? categories.size() : "null") + " items");
            } catch (Exception e) {
                System.err.println("❌ Error loading Categories: " + e.getMessage());
                e.printStackTrace();
                categories = new ArrayList<>();
            }
            
            // Set random gallery image if available
            if (categoryGalleryList != null && !categoryGalleryList.isEmpty()) {
                int randomIndex = (int) (Math.random() * categoryGalleryList.size());
                CategoryGallery randomImage = categoryGalleryList.get(randomIndex);
                request.setAttribute("randomGalleryImage", randomImage);
                System.out.println("✅ Random gallery image set");
            } else {
                System.out.println("⚠️ No gallery images available");
            }
            
            // Set random blog posts if available
            if (blogPosts != null && !blogPosts.isEmpty()) {
                Collections.shuffle(blogPosts);
                int count = Math.min(blogPosts.size(), 3);
                List<Blogposts> randomBlogPosts = blogPosts.subList(0, count);
                request.setAttribute("randomBlogPosts", randomBlogPosts);
                System.out.println("✅ Random blog posts set: " + count + " items");
            } else {
                System.out.println("⚠️ No blog posts available");
            }
            
            // Process guides
            List<Users> guides = new ArrayList<>();
            if (allUsers != null) {
                for (Users user : allUsers) {
                    if (user.getRole() != null && user.getRole().equalsIgnoreCase("GUIDE")) {
                        if (user.getAvatar_url() != null && !user.getAvatar_url().startsWith("/")) {
                            user.setAvatar_url("/" + user.getAvatar_url());
                        }
                        guides.add(user);
                    }
                }
            }
            
            // Add sample guide if no guides found
            if (guides.isEmpty()) {
                Users sampleGuide = new Users("guide@example.com", "hashedpassword", "GUIDE");
                sampleGuide.setFullname("Nguyễn Bá Toàn");
                sampleGuide.setAvatar_url("/assets/images/avatars/default-avatar.jpg");
                guides.add(sampleGuide);
                System.out.println("✅ Added sample guide (no guides in database)");
            } else {
                System.out.println("✅ Found " + guides.size() + " guides in database");
            }
            
            // Ensure all lists are not null
            if (categories == null) categories = new ArrayList<>();
            if (destinations == null) destinations = new ArrayList<>();
            if (categoryGalleryList == null) categoryGalleryList = new ArrayList<>();
            
            // Set all attributes
            request.setAttribute("categories", categories);
            request.setAttribute("destinations", destinations);
            request.setAttribute("guides", guides);
            request.setAttribute("categoryGalleryList", categoryGalleryList);
            request.setAttribute("destinationsList", destinations);
            request.setAttribute("categoryList", categories);
            
            System.out.println("=== Summary ===");
            System.out.println("Categories: " + categories.size());
            System.out.println("Destinations: " + destinations.size());
            System.out.println("Gallery: " + categoryGalleryList.size());
            System.out.println("Guides: " + guides.size());
            System.out.println("Blog posts: " + (blogPosts != null ? blogPosts.size() : 0));
            
            System.out.println("✅ All attributes set, forwarding to index.jsp");
            
            // Forward đến index.jsp
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("❌ CRITICAL ERROR in HomeServlet: " + e.getMessage());
            e.printStackTrace();
            
            // Fallback - create minimal data and continue
            request.setAttribute("showBanner", true);
            request.setAttribute("categories", new ArrayList<>());
            request.setAttribute("destinations", new ArrayList<>());
            request.setAttribute("guides", new ArrayList<>());
            request.setAttribute("categoryGalleryList", new ArrayList<>());
            request.setAttribute("destinationsList", new ArrayList<>());
            request.setAttribute("categoryList", new ArrayList<>());
            
            System.out.println("⚠️ Using fallback data, forwarding to index.jsp");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests - chuyển về GET
        doGet(request, response);
    }
}
