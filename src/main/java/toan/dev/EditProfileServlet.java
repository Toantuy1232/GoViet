package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditProfileServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setDataAttributes(request);
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Hide banner on edit profile page
        request.setAttribute("hideBanner", true);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
        UsersDao userDao = DatabaseDao.getInstance().getUserDao();
        Users existingUser = userDao.find(user.getUser_id());
        
        if (existingUser != null) {
            existingUser.setFullname(fullname);
            existingUser.setPhone(phone);
            existingUser.setEmail(email);
            
            userDao.update(existingUser);
            
            // Update session
            session.setAttribute("user", existingUser);
            
            request.setAttribute("hideBanner", true);
            request.setAttribute("successMessage", "Cập nhật thông tin thành công!");
        } else {
            request.setAttribute("hideBanner", true);
            request.setAttribute("errorMessage", "Không tìm thấy người dùng!");
        }
        
        // Hide banner on edit profile page
        request.setAttribute("hideBanner", true);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
    }
}
