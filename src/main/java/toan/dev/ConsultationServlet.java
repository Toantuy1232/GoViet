package toan.dev;

import toan.dev.data.dao.ConsultationDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Consultation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ConsultationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("/consultation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        try {
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String destination = request.getParameter("destination");
            String travelDate = request.getParameter("travelDate");
            int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));
            String budget = request.getParameter("budget");
            String message = request.getParameter("message");
            
            // Validate
            if (fullName == null || fullName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty()) {
                
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin bắt buộc!");
                request.getRequestDispatcher("/consultation.jsp").forward(request, response);
                return;
            }
            
            // Create consultation
            Consultation consultation = new Consultation(
                fullName, email, phone, destination, travelDate,
                numberOfPeople, budget, message
            );
            
            // Save to database
            ConsultationDao consultationDao = DatabaseDao.getInstance().getConsultationDao();
            boolean success = consultationDao.insert(consultation);
            
            if (success) {
                request.setAttribute("success", "Đăng ký tư vấn thành công! Chúng tôi sẽ liên hệ với bạn sớm nhất.");
            } else {
                request.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại!");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/consultation.jsp").forward(request, response);
    }
}
