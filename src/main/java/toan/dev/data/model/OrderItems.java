package toan.dev.data.model;

import java.sql.Timestamp;

public class OrderItems {
    public int id;
    public int order_id;
    public int product_id;
    public int quantity;
    public double price_each;
    public double subtotal;
    public Timestamp created_at;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice_each() {
        return price_each;
    }

    public void setPrice_each(double price_each) {
        this.price_each = price_each;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public OrderItems(int id, int order_id, int product_id, int quantity, double price_each, double subtotal, Timestamp created_at) {
        super();
        this.id = id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.price_each = price_each;
        this.subtotal = subtotal;
        this.created_at = created_at;
    }
}
