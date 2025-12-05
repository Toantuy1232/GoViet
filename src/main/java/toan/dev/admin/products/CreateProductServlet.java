package toan.dev.admin.products;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.Category;
import toan.dev.data.model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class CreateProductServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categories = categoryDao.findAll();
        
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/products/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Get form parameters - with multipart/form-data, getParameter should still work in Servlet 3.0+
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            String categoryIdStr = request.getParameter("categoryId");
            
            // Debug logging
            System.out.println("Name: " + name);
            System.out.println("Description: " + description);
            System.out.println("Price: " + priceStr);
            System.out.println("Quantity: " + quantityStr);
            System.out.println("CategoryId: " + categoryIdStr);
            
            // Validate required fields
            if (name == null || name.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/products/create?error=name_required");
                return;
            }
            
            double price = 0;
            int quantity = 0;
            int categoryId = 0;
            
            try {
                price = Double.parseDouble(priceStr);
                quantity = Integer.parseInt(quantityStr);
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Error parsing numbers: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/admin/products/create?error=invalid_numbers");
                return;
            }
            
            // Handle file upload
            String thumbnail = "img/default-product.jpg"; // Default image
            Part filePart = request.getPart("thumbnailFile");
            
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getFileName(filePart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + "img";
                
                // Create directory if not exists
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                
                // Save file
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                
                thumbnail = "img/" + fileName;
            }
            
            Products product = new Products(name, description, thumbnail, price, quantity, categoryId);
            
            ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
            boolean success = productsDao.insert(product);
            
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/products?message=create_success");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/products/create?error=create_failed");
            }
        } catch (Exception e) {
            System.err.println("Error creating product: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/products/create?error=exception");
        }
    }
    
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
