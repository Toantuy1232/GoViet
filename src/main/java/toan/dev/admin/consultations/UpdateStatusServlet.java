package toan.dev.admin.consultations;

import toan.dev.data.dao.ConsultationDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Consultation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateConsultationStatusServlet", urlPatterns = {"/admin/consultations/updateStatus"})
public class UpdateStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            
            ConsultationDao consultationDao = DatabaseDao.getInstance().getConsultationDao();
            Consultation consultation = consultationDao.find(id);
            
            if (consultation != null) {
                consultation.setStatus(status);
                boolean success = consultationDao.update(consultation);
                
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/admin/consultations?success=updated");
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/consultations?error=update_failed");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/consultations?error=not_found");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/consultations?error=exception");
        }
    }
}
