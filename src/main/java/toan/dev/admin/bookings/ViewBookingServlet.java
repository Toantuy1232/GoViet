package toan.dev.admin.bookings;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.Impl.BookingImpl;
import toan.dev.data.dao.BookingDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.Booking;
import toan.dev.data.model.Products;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ViewBookingServlet extends BaseAdminServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/bookings");
            return;
        }
        
        try {
            int bookingId = Integer.parseInt(idStr);
            BookingDao bookingDao = new BookingImpl();
            Booking booking = bookingDao.find(bookingId);
            
            if (booking == null) {
                response.sendRedirect(request.getContextPath() + "/admin/bookings");
                return;
            }
            
            // Lấy thông tin tour/hotel
            ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
            Products product = productsDao.find(booking.getItemId());
            
            request.setAttribute("booking", booking);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/admin/bookings/view.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/bookings");
        }
    }
}
