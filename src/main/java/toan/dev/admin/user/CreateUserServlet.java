package toan.dev.admin.user;

import org.mindrot.jbcrypt.BCrypt;
import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CreateUserServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("admin/user/create.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repeatPass = request.getParameter("repeatPass");
        String role = request.getParameter("role");
        UsersDao userDao = DatabaseDao.getInstance().getUserDao();
        Users user = userDao.find(email);
        HttpSession session = request.getSession();


        //kiểm tra thông tin kí tự có bị thiếu hay bị rỗng hay không?
        if(email.isEmpty() || password.isEmpty() || repeatPass.isEmpty() || role.isEmpty()) {
            session.setAttribute("errorMessage", "Vui lòng điền đủ thông tin đăng ký");
            request.getRequestDispatcher("admin/user/create.jsp").forward(request, response);
        }else if(user != null) {
            session.setAttribute("errorMessage", "Email trùng!");
            request.getRequestDispatcher("admin/user/create.jsp").forward(request, response);
        }else if(!password.equals(repeatPass)) {
            session.setAttribute("errorMessage", "Mật khẩu nhập lại không đúng!");
            request.getRequestDispatcher("admin/user/create.jsp").forward(request, response);
        }else {
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
            user = new Users(email, hashedPassword, role);
            userDao.insert(user);
            response.sendRedirect("IndexUserServlet");
        }
    }
}
