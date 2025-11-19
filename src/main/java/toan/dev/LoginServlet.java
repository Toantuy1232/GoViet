package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends BaseServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("HomeServlet");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Kiểm tra email và password có được nhập không
        if (email == null || email.trim().isEmpty()) {
            session.setAttribute("errors", "Vui lòng nhập email!");
            response.sendRedirect("LoginServlet");
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            session.setAttribute("errors", "Vui lòng nhập mật khẩu!");
            response.sendRedirect("LoginServlet");
            return;
        }

        try {
            System.out.println("Email đăng nhập: " + email);

            UsersDao userDao = DatabaseDao.getInstance().getUserDao();
            System.out.println("Đã lấy UserDao thành công");

            //tìm user chỉ bằng email trước
            System.out.println("Đang tìm user với email: " + email);
            Users userByEmail = userDao.findByEmail(email);
            System.out.println("Kết quả tìm kiếm: " + (userByEmail != null ? "Tìm thấy" : "Không tìm thấy"));

            if (userByEmail == null) {
                System.out.println("Email không tồn tại trong hệ thống!");
                session.setAttribute("errors", "Email không tồn tại trong hệ thống!");
                response.sendRedirect("LoginServlet");
                return;
            }

            // Sau đó kiểm tra với cả email và password
            Users user = userDao.find(email, password);

            if (user == null) {
                session.setAttribute("errors", "Mật khẩu không chính xác!");
                response.sendRedirect("LoginServlet");
            } else {
                // Đảm bảo user trong session có id hợp lệ (>0)
                if (user.getUser_id() <= 0) {
                    Users fixed = userDao.findByEmail(email);
                    if (fixed != null) {
                        user = fixed;
                    }
                }
                session.setAttribute("user", user);
                session.setAttribute("success", "Đăng nhập thành công!");
                System.out.println("[Login] userId=" + user.getUser_id());

                // Bỏ cơ chế redirectAfterLogin: luôn đưa về HomeServlet cho user thường
                session.removeAttribute("redirectAfterLogin");

                if ("admin".equals(user.getRole())) {
                    response.sendRedirect("DashboardServlet");
                } else {
                    response.sendRedirect("HomeServlet");
                }
            }
        } catch (Exception e) {
            session.setAttribute("errors", "Lỗi hệ thống: " + e.getMessage());
            response.sendRedirect("LoginServlet");
        }
    }

    private static String getFirst(String[] arr) {
        return (arr != null && arr.length > 0) ? arr[0] : null;
    }
}
