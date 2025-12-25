package toan.dev.admin.consultations;

import toan.dev.data.dao.ConsultationDao;
import toan.dev.data.dao.DatabaseDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteConsultationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleDelete(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleDelete(request, response);
    }
    
    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/consultations?error=missing_id");
                return;
            }
            
            int id = Integer.parseInt(idParam);
            
            ConsultationDao consultationDao = DatabaseDao.getInstance().getConsultationDao();
            boolean success = consultationDao.delete(id);
            
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/consultations?success=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/consultations?error=delete_failed");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/consultations?error=invalid_id");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/consultations?error=exception");
        }
    }
}
