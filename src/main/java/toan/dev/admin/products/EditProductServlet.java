package toan.dev.admin.products;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.Category;
import toan.dev.data.model.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditProductServlet", urlPatterns = {"/admin/products/edit", "/EditProductServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class EditProductServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
        Products product = productsDao.find(id);
        
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categories = categoryDao.findAll();
        
        request.setAttribute("product", product);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/products/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String thumbnail = request.getParameter("oldThumbnail"); // Keep old image by default
        
        // Handle file upload
        Part filePart = request.getPart("thumbnailFile");
        
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + "img";
            
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            
            thumbnail = "img/" + fileName;
        }
        
        Products product = new Products(name, description, thumbnail, price, quantity, categoryId);
        product.setId(id);
        
        ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
        boolean success = productsDao.update(product);
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/products?message=update_success");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/products/edit?id=" + id + "&error=update_failed");
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
