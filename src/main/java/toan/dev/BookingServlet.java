package toan.dev;

import toan.dev.data.dao.BookingDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.Impl.BookingImpl;
import toan.dev.data.model.Booking;
import toan.dev.data.model.Products;
import toan.dev.data.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BookingServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setDataAttributes(request);
        
        // Check if user is logged in
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            session.setAttribute("redirectAfterLogin", request.getRequestURI() + "?" + request.getQueryString());
            session.setAttribute("errors", "Vui lòng đăng nhập để đặt tour/khách sạn!");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        
        String type = request.getParameter("type"); // "tour" or "hotel"
        String itemIdStr = request.getParameter("itemId");
        
        if (itemIdStr == null || itemIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        try {
            int itemId = Integer.parseInt(itemIdStr);
            ProductsDao productsDao = DatabaseDao.getInstance().getProductDao();
            Products product = productsDao.find(itemId);
            
            request.setAttribute("item", product);
            request.setAttribute("itemType", type != null ? type : "tour");
            request.setAttribute("itemName", product.getName());
            request.setAttribute("itemPrice", product.getPrice());
            request.setAttribute("itemId", itemId);
            
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            
            int userId = (user != null) ? user.getUser_id() : 0;
            String bookingType = request.getParameter("bookingType");
            String itemIdStr = request.getParameter("itemId");
            String customerName = request.getParameter("customerName");
            String customerEmail = request.getParameter("customerEmail");
            String customerPhone = request.getParameter("customerPhone");
            String checkInDate = request.getParameter("checkInDate");
            String checkOutDate = request.getParameter("checkOutDate");
            String numberOfPeopleStr = request.getParameter("numberOfPeople");
            String totalPriceStr = request.getParameter("totalPrice");
            String notes = request.getParameter("notes");
            
            System.out.println("=== BOOKING DEBUG ===");
            System.out.println("User ID: " + userId);
            System.out.println("Booking Type: " + bookingType);
            System.out.println("Item ID Str: " + itemIdStr);
            System.out.println("Customer: " + customerName);
            System.out.println("Email: " + customerEmail);
            System.out.println("Phone: " + customerPhone);
            System.out.println("Check-in: " + checkInDate);
            System.out.println("People Str: " + numberOfPeopleStr);
            System.out.println("Total Str: " + totalPriceStr);
            
            // Validate required fields
            if (customerName == null || customerName.trim().isEmpty()) {
                throw new Exception("Tên khách hàng không được để trống");
            }
            if (customerEmail == null || customerEmail.trim().isEmpty()) {
                throw new Exception("Email không được để trống");
            }
            if (customerPhone == null || customerPhone.trim().isEmpty()) {
                throw new Exception("Số điện thoại không được để trống");
            }
            
            int itemId = Integer.parseInt(itemIdStr);
            int numberOfPeople = Integer.parseInt(numberOfPeopleStr);
            double totalPrice = Double.parseDouble(totalPriceStr);
            
            Booking booking = new Booking(userId, bookingType, itemId, customerName, customerEmail,
                    customerPhone, checkInDate, checkOutDate, numberOfPeople, totalPrice, "pending", notes);
            
            BookingDao bookingDao = new BookingImpl();
            boolean success = bookingDao.insert(booking);
            
            System.out.println("Insert success: " + success);
            System.out.println("===================");
            
            if (success) {
                session.setAttribute("message", "Đặt chỗ thành công! Chúng tôi sẽ liên hệ với bạn sớm.");
                response.sendRedirect(request.getContextPath() + "/booking-success.jsp");
            } else {
                request.setAttribute("error", "Đặt chỗ thất bại. Vui lòng thử lại!");
                doGet(request, response);
            }
        } catch (Exception e) {
            System.err.println("ERROR in BookingServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            doGet(request, response);
        }
    }
}
