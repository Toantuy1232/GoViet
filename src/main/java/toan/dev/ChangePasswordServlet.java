package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ChangePasswordServlet extends BaseServlet {
    
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
        
        // Hide banner on change password page
        request.setAttribute("hideBanner", true);
        request.getRequestDispatcher("/change-password.jsp").forward(request, response);
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
        
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        UsersDao userDao = DatabaseDao.getInstance().getUserDao();
        Users existingUser = userDao.find(user.getUser_id());
        
        if (existingUser == null) {
            request.setAttribute("hideBanner", true);
            request.setAttribute("errorMessage", "Không tìm thấy người dùng!");
            request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            return;
        }

        // Verify current password (plain text comparison as per LoginServlet)
        if (!currentPassword.equals(existingUser.getPassword())) {
            request.setAttribute("hideBanner", true);
            request.setAttribute("errorMessage", "Mật khẩu hiện tại không đúng!");
            request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("hideBanner", true);
            request.setAttribute("errorMessage", "Mật khẩu mới không khớp!");
            request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            return;
        }

        if (newPassword.length() < 6) {
            request.setAttribute("hideBanner", true);
            request.setAttribute("errorMessage", "Mật khẩu mới phải có ít nhất 6 ký tự!");
            request.getRequestDispatcher("/change-password.jsp").forward(request, response);
            return;
        }

        // Update password (plain text as per current system)
        existingUser.setPassword(newPassword);
        userDao.update(existingUser);
        
        // Hide banner on change password page
        request.setAttribute("hideBanner", true);
        request.setAttribute("successMessage", "Đổi mật khẩu thành công!");
        request.getRequestDispatcher("/change-password.jsp").forward(request, response);
    }
}
