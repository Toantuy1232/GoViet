package toan.dev.data.model;

import java.sql.Timestamp;

public class Consultation {
    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String destination;
    private String travelDate;
    private int numberOfPeople;
    private String budget;
    private String message;
    private String status; // pending, contacted, completed, cancelled
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Consultation() {
        this.status = "pending";
    }

    public Consultation(String fullName, String email, String phone, String destination, 
                       String travelDate, int numberOfPeople, String budget, String message) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.destination = destination;
        this.travelDate = travelDate;
        this.numberOfPeople = numberOfPeople;
        this.budget = budget;
        this.message = message;
        this.status = "pending";
    }

    public Consultation(int id, String fullName, String email, String phone, String destination,
                       String travelDate, int numberOfPeople, String budget, String message,
                       String status, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.destination = destination;
        this.travelDate = travelDate;
        this.numberOfPeople = numberOfPeople;
        this.budget = budget;
        this.message = message;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(String travelDate) {
        this.travelDate = travelDate;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public String getBudget() {
        return budget;
    }

    public void setBudget(String budget) {
        this.budget = budget;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
