package toan.dev;

import toan.dev.data.Impl.BookingsImpl;
import toan.dev.data.Impl.CategoryImpl;
import toan.dev.data.Impl.DestinationsImpl;
import toan.dev.data.Impl.TourImpl;
import toan.dev.data.dao.BookingsDao;
import toan.dev.data.dao.CategoryDao;
import toan.dev.data.dao.DestinationsDao;
import toan.dev.data.dao.TourDao;
import toan.dev.data.model.Bookings;
import toan.dev.data.model.Category;
import toan.dev.data.model.Destinations;
import toan.dev.data.model.Tours;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/book-tour")
public class BookingPageServlet extends BaseServlet {
    private static final long serialVersionUID = 1L;
    private BookingsDao bookingsDao;
    private TourDao tourDao;
    private DestinationsDao destinationDao;
    private CategoryDao categoryDao;

    @Override
    public void init() throws ServletException {
        super.init();
        bookingsDao = new BookingsImpl();
        tourDao = new TourImpl();
        destinationDao = new DestinationsImpl();
        categoryDao = new CategoryImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Destinations> destinations = destinationDao.findAll();
            List<Category> categories = categoryDao.findAll();

            request.setAttribute("destinations", destinations);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi tải trang đặt tour: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            session.setAttribute("errorMessage", "Vui lòng đăng nhập để đặt tour");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String customerName = request.getParameter("customerName");
            String email = request.getParameter("email");
            
            if (customerName == null || customerName.trim().isEmpty() || 
                email == null || email.trim().isEmpty()) {
                throw new IllegalArgumentException("Vui lòng điền đầy đủ thông tin bắt buộc");
            }
            
            int destinationId = Integer.parseInt(request.getParameter("destinationId"));
            int categoryId = request.getParameter("categoryId") != null && !request.getParameter("categoryId").isEmpty()
                    ? Integer.parseInt(request.getParameter("categoryId")) : 0;
            int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));
            String bookingDateStr = request.getParameter("bookingDate");
            String specialRequests = request.getParameter("specialRequests");
            if (bookingDateStr == null || bookingDateStr.trim().isEmpty()) {
                throw new IllegalArgumentException("Vui lòng chọn ngày đặt tour");
            }
            
            Timestamp bookingDate = Timestamp.valueOf(bookingDateStr.replace("T", " ") + ":00");

            Tours tour = findAvailableTour(destinationId, categoryId, bookingDate);
            if (tour == null) {
                throw new Exception("Không tìm thấy tour phù hợp. Vui lòng thử lại sau.");
            }
           
            double totalPrice = tour.getPrice() * numberOfPeople;
          
           Bookings booking = new Bookings(
    0,  
    user.getUser_id(),
    tour.getTour_id(),
    bookingDate,
    numberOfPeople,
    totalPrice,
    "pending"
);


            if (bookingsDao.insert(booking)) {
                session.setAttribute("booking", booking);
                session.setAttribute("successMessage", "Đặt tour thành công! Chúng tôi sẽ liên hệ với bạn sớm nhất.");
                response.sendRedirect(request.getContextPath() + "/booking-success.jsp");
            } else {
                throw new Exception("Không thể lưu thông tin đặt tour. Vui lòng thử lại.");
            }

        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại thông tin.");
            response.sendRedirect(request.getContextPath() + "/booking");
        } catch (IllegalArgumentException e) {
            session.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/booking");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/booking");
        }
    }

    private Tours findAvailableTour(int destinationId, int categoryId, Timestamp bookingDate) throws Exception {
        try {
            List<Tours> tours = tourDao.findByDestination(destinationId);
            
            if (categoryId > 0) {
                tours.removeIf(tour -> tour.getCategory_id() != categoryId);
            }
            
            return tours.isEmpty() ? null : tours.get(0);
            
        } catch (Exception e) {
            throw new Exception("Lỗi khi tìm kiếm tour: " + e.getMessage(), e);
        }
    }
}