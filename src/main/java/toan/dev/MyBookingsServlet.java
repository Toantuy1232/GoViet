package toan.dev;

import toan.dev.data.dao.BookingDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Booking;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MyBookingsServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            session.setAttribute("errors", "Vui lòng đăng nhập để xem đơn đặt của bạn!");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        
        BookingDao bookingDao = DatabaseDao.getInstance().getBookingDao();
        List<Booking> bookings = bookingDao.findByUserId(user.getUser_id());
        
        if (bookings == null) {
            bookings = new ArrayList<>();
        }
        
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/my-bookings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

    }
}
