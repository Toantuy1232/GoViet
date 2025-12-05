package toan.dev.admin.bookings;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.Impl.BookingImpl;
import toan.dev.data.dao.BookingDao;
import toan.dev.data.model.Booking;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexBookingServlet extends BaseAdminServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BookingDao bookingDao = new BookingImpl();
        String statusFilter = request.getParameter("status");
        
        List<Booking> bookings;
        if (statusFilter != null && !statusFilter.isEmpty()) {
            bookings = bookingDao.findByStatus(statusFilter);
        } else {
            bookings = bookingDao.findAll();
        }
        
        request.setAttribute("bookings", bookings);
        request.setAttribute("statusFilter", statusFilter);
        request.getRequestDispatcher("/admin/bookings/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
