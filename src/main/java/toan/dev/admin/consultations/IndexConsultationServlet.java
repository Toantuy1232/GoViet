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
import java.util.List;

@WebServlet(name = "IndexConsultationServlet", urlPatterns = {"/IndexConsultationServlet", "/admin/consultations"})
public class IndexConsultationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ConsultationDao consultationDao = DatabaseDao.getInstance().getConsultationDao();
        
        String statusFilter = request.getParameter("status");
        List<Consultation> consultations;
        
        if (statusFilter != null && !statusFilter.isEmpty()) {
            consultations = consultationDao.findByStatus(statusFilter);
        } else {
            consultations = consultationDao.findAll();
        }
        
        // Count by status
        int pendingCount = consultationDao.countByStatus("pending");
        int contactedCount = consultationDao.countByStatus("contacted");
        int completedCount = consultationDao.countByStatus("completed");
        
        request.setAttribute("consultations", consultations);
        request.setAttribute("statusFilter", statusFilter);
        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("contactedCount", contactedCount);
        request.setAttribute("completedCount", completedCount);
        
        request.getRequestDispatcher("/admin/consultations/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
