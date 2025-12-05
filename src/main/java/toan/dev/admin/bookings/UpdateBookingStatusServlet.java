package toan.dev.admin.bookings;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.Impl.BookingImpl;
import toan.dev.data.dao.BookingDao;
import toan.dev.data.model.Booking;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateBookingStatusServlet extends BaseAdminServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        
        BookingDao bookingDao = new BookingImpl();
        Booking booking = bookingDao.find(id);
        
        if (booking != null) {
            booking.setStatus(status);
            bookingDao.update(booking);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/bookings?success=updated");
    }
}
