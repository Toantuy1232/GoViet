package toan.dev.data.model;

import java.sql.Timestamp;

public class Booking {
    private int id;
    private int userId;
    private String bookingType;
    private int itemId;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private String checkInDate;
    private String checkOutDate;
    private int numberOfPeople;
    private double totalPrice;
    private String status;
    private String notes;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Booking() {
    }

    public Booking(int userId, String bookingType, int itemId, String customerName, String customerEmail, 
                   String customerPhone, String checkInDate, String checkOutDate, int numberOfPeople, 
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
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
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
    
    public String getCheckInDate() { return checkInDate; }
    public void setCheckInDate(String checkInDate) { this.checkInDate = checkInDate; }
    
    public String getCheckOutDate() { return checkOutDate; }
    public void setCheckOutDate(String checkOutDate) { this.checkOutDate = checkOutDate; }
    
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
}
