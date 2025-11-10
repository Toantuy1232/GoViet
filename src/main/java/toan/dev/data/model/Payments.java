package toan.dev.data.model;

import java.sql.Timestamp;

public class Payments {
    public int payment_id;
    public int booking_id;
    public String payment_method;
    public String transaction_id;
    public double amount;
    public Timestamp payment_date;

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Timestamp getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Timestamp payment_date) {
        this.payment_date = payment_date;
    }

    public Payments(int payment_id, int booking_id, String payment_method, String transaction_id, double amount, Timestamp payment_date) {
        super();
        this.payment_id = payment_id;
        this.booking_id = booking_id;
        this.payment_method = payment_method;
        this.transaction_id = transaction_id;
        this.amount = amount;
        this.payment_date = payment_date;
    }
}
