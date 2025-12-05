package toan.dev.admin.consultations;

import toan.dev.data.dao.ConsultationDao;
import toan.dev.data.dao.DatabaseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteConsultationServlet", urlPatterns = {"/DeleteConsultationServlet", "/admin/consultations/delete"})
public class DeleteConsultationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            ConsultationDao consultationDao = DatabaseDao.getInstance().getConsultationDao();
            boolean success = consultationDao.delete(id);
            
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/consultations?success=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/consultations?error=delete_failed");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/consultations?error=exception");
        }
    }
}
