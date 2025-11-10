package toan.dev.data.model;

import java.sql.Timestamp;

public class Chatmessages {
    public int booking_id;
    public int user_id;
    public int tour_id;
    public Timestamp booking_date;
    public int number_of_people;
    public double total_price;
    public String payment_status;

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public Timestamp getBooking_date() {
        return booking_date;
    }

    public void setBooking_date(Timestamp booking_date) {
        this.booking_date = booking_date;
    }

    public int getNumber_of_people() {
        return number_of_people;
    }

    public void setNumber_of_people(int number_of_people) {
        this.number_of_people = number_of_people;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public Chatmessages(int booking_id, int user_id, int tour_id, Timestamp booking_date, int number_of_people, double total_price, String payment_status) {
        super();
        this.booking_id = booking_id;
        this.user_id = user_id;
        this.tour_id = tour_id;
        this.booking_date = booking_date;
        this.number_of_people = number_of_people;
        this.total_price = total_price;
        this.payment_status = payment_status;
    }
}
