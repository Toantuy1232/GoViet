package toan.dev.data.model;

import java.sql.Timestamp;

public class Products {
    public int id;
    public String name;
    public String sku;
    public String description;
    public double price;
    public double price_old;
    public int stock;
    public String image_url;
    public int category_id;
    public Timestamp created_at;
    public Timestamp updated_at;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPrice_old() {
        return price_old;
    }

    public void setPrice_old(double price_old) {
        this.price_old = price_old;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
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

    public Products(int id, String name, String sku, String description, double price, double price_old, int stock, String image_url, int category_id, Timestamp created_at, Timestamp updated_at) {
        super();
        this.id = id;
        this.name = name;
        this.sku = sku;
        this.description = description;
        this.price = price;
        this.price_old = price_old;
        this.stock = stock;
        this.image_url = image_url;
        this.category_id = category_id;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
}
