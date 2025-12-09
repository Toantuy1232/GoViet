package toan.dev;

import toan.dev.data.dao.BookingDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.dao.TourDao;
import toan.dev.data.model.Booking;
import toan.dev.data.model.Products;
import toan.dev.data.model.Tours;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewMyBookingServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            session.setAttribute("errors", "Vui lòng đăng nhập để xem chi tiết đơn đặt!");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        
        String bookingIdStr = request.getParameter("id");
        if (bookingIdStr == null || bookingIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/MyBookingsServlet");
            return;
        }
        
        try {
            int bookingId = Integer.parseInt(bookingIdStr);
            BookingDao bookingDao = DatabaseDao.getInstance().getBookingDao();
            Booking booking = bookingDao.find(bookingId);
            
            if (booking == null) {
                session.setAttribute("errors", "Không tìm thấy đơn đặt!");
                response.sendRedirect(request.getContextPath() + "/MyBookingsServlet");
                return;
            }
     
            if (booking.getUserId() != user.getUser_id()) {
                session.setAttribute("errors", "Bạn không có quyền xem đơn đặt này!");
                response.sendRedirect(request.getContextPath() + "/MyBookingsServlet");
                return;
            }
            

            Object itemDetails = null;
            if ("tour".equals(booking.getBookingType())) {
                TourDao tourDao = DatabaseDao.getInstance().getTourDao();
                itemDetails = tourDao.find(booking.getItemId());
            } else if ("product".equals(booking.getBookingType())) {
                ProductsDao productDao = DatabaseDao.getInstance().getProductDao();
                itemDetails = productDao.find(booking.getItemId());
            }
            
            request.setAttribute("booking", booking);
            request.setAttribute("itemDetails", itemDetails);
            request.getRequestDispatcher("/my-booking-detail.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/MyBookingsServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

    }
}
