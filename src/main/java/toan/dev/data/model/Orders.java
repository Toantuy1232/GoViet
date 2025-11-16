package toan.dev.data.model;

import java.sql.Timestamp;

public class Orders {
    public int order_id;
    public int user_id;
    public Timestamp order_date;
    public double total_amount;
    public String status;
    public String shipping_address;
    public String payment_method;
    public int payment_id;
    public String note;
    public String code;
    public Timestamp created_at;
    public Timestamp updated_at;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Timestamp order_date) {
        this.order_date = order_date;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShipping_address() {
        return shipping_address;
    }

    public void setShipping_address(String shipping_address) {
        this.shipping_address = shipping_address;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Orders(int order_id, int user_id, Timestamp order_date, double total_amount, String status, String shipping_address, String payment_method, int payment_id, String note, Timestamp created_at, Timestamp updated_at,
                  String code) {
        super();
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.total_amount = total_amount;
        this.status = status;
        this.shipping_address = shipping_address;
        this.payment_method = payment_method;
        this.payment_id = payment_id;
        this.note = note;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.code = code;
    }
}
