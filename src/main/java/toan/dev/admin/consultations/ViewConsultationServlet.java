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

@WebServlet(name = "ViewConsultationServlet", urlPatterns = {"/admin/consultations/view"})
public class ViewConsultationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            ConsultationDao consultationDao = DatabaseDao.getInstance().getConsultationDao();
            Consultation consultation = consultationDao.find(id);
            
            if (consultation != null) {
                request.setAttribute("consultation", consultation);
                request.getRequestDispatcher("/admin/consultations/view.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/consultations?error=not_found");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/consultations?error=exception");
        }
    }
}
