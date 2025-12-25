package toan.dev.data.model;

import java.sql.Timestamp;
import java.sql.Date;

public class Booking {
    private int bookingId;
    private int userId;
    private String bookingType;
    private int itemId;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private Date checkInDate;
    private Date checkOutDate;
    private int numberOfPeople;
    private double totalPrice;
    private String status;
    private String notes;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
    // Additional fields for order detail display
    private String orderCode;
    private String paymentMethod;
    private String address;
    private String specialRequests;
    private Date bookingDate;
    private String tourName;
    private String tourImage;
    private String destinationName;
    private String categoryName;
    private double totalAmount;
    private String email;
    private String phone;
    private Timestamp confirmedAt;
    private Timestamp completedAt;
    private Timestamp cancelledAt;

    public Booking() {
    }

    public Booking(int userId, String bookingType, int itemId, String customerName, String customerEmail, 
                   String customerPhone, Date checkInDate, Date checkOutDate, int numberOfPeople, 
                   double totalPrice, String status, String notes) {
        this.userId = userId;
        this.bookingType = bookingType;
        this.itemId = itemId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numberOfPeople = numberOfPeople;
        this.totalPrice = totalPrice;
        this.status = status;
        this.notes = notes;
        this.createdAt = new Timestamp(System.currentTimeMillis());
        this.updatedAt = new Timestamp(System.currentTimeMillis());
    }
    
    // Existing getters and setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    
    public int getId() { return bookingId; }
    public void setId(int id) { this.bookingId = id; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getBookingType() { return bookingType; }
    public void setBookingType(String bookingType) { this.bookingType = bookingType; }
    
    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }
    
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    
    public String getCustomerEmail() { return customerEmail; }
    public void setCustomerEmail(String customerEmail) { this.customerEmail = customerEmail; }
    
    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }
    
    public Date getCheckInDate() { return checkInDate; }
    public void setCheckInDate(Date checkInDate) { this.checkInDate = checkInDate; }
    
    public Date getCheckOutDate() { return checkOutDate; }
    public void setCheckOutDate(Date checkOutDate) { this.checkOutDate = checkOutDate; }
    
    public int getNumberOfPeople() { return numberOfPeople; }
    public void setNumberOfPeople(int numberOfPeople) { this.numberOfPeople = numberOfPeople; }
    
    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
    
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    
    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
    
    // New getters and setters for additional fields
    public String getOrderCode() { return orderCode; }
    public void setOrderCode(String orderCode) { this.orderCode = orderCode; }
    
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getSpecialRequests() { return specialRequests; }
    public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests; }
    
    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }
    
    public String getTourName() { return tourName; }
    public void setTourName(String tourName) { this.tourName = tourName; }
    
    public String getTourImage() { return tourImage; }
    public void setTourImage(String tourImage) { this.tourImage = tourImage; }
    
    public String getDestinationName() { return destinationName; }
    public void setDestinationName(String destinationName) { this.destinationName = destinationName; }
    
    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
    
    public double getTotalAmount() { return totalAmount > 0 ? totalAmount : totalPrice; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    
    public String getEmail() { return email != null ? email : customerEmail; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPhone() { return phone != null ? phone : customerPhone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public Timestamp getConfirmedAt() { return confirmedAt; }
    public void setConfirmedAt(Timestamp confirmedAt) { this.confirmedAt = confirmedAt; }
    
    public Timestamp getCompletedAt() { return completedAt; }
    public void setCompletedAt(Timestamp completedAt) { this.completedAt = completedAt; }
    
    public Timestamp getCancelledAt() { return cancelledAt; }
    public void setCancelledAt(Timestamp cancelledAt) { this.cancelledAt = cancelledAt; }
}
