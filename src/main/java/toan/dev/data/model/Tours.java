package toan.dev.data.model;

import java.sql.Timestamp;

public class Tours {
    public int tour_id;
    public int destination_id;
    public int category_id;
    public String title;
    public String description;
    public double price;
    public double price_old;
    public int duration_days;
    public Timestamp start_date;
    public Timestamp end_date;
    public int available_slots;
    public String main_image;
    public Timestamp created_at;

    public Tours(int tourId, int categoryId, String title, String description, double price, double priceOld, int durationDays, Timestamp startDate, Timestamp endDate, int availableSlots, String mainImage, Timestamp now) {
        super();
        this.tour_id = tourId;
        this.category_id = categoryId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.price_old = priceOld;
        this.duration_days = durationDays;
        this.start_date = startDate;
        this.end_date = endDate;
        this.available_slots = availableSlots;
        this.main_image = mainImage;
        this.created_at = now;
    }

    public double getPrice_old() {
        return price_old;
    }

    public void setPrice_old(double price_old) {
        this.price_old = price_old;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public int getDestination_id() {
        return destination_id;
    }

    public void setDestination_id(int destination_id) {
        this.destination_id = destination_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getDuration_days() {
        return duration_days;
    }

    public void setDuration_days(int duration_days) {
        this.duration_days = duration_days;
    }

    public Timestamp getStart_date() {
        return start_date;
    }

    public void setStart_date(Timestamp start_date) {
        this.start_date = start_date;
    }

    public Timestamp getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Timestamp end_date) {
        this.end_date = end_date;
    }

    public int getAvailable_slots() {
        return available_slots;
    }

    public void setAvailable_slots(int available_slots) {
        this.available_slots = available_slots;
    }

    public String getMain_image() {
        return main_image;
    }

    public void setMain_image(String main_image) {
        this.main_image = main_image;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Tours(int tour_id, int destination_id, int category_id, String title, String description, double price, double price_old, int duration_days, Timestamp start_date, Timestamp end_date, int available_slots, String main_image, Timestamp created_at) {
        super();
        this.tour_id = tour_id;
        this.destination_id = destination_id;
        this.category_id = category_id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.price_old = price_old;
        this.duration_days = duration_days;
        this.start_date = start_date;
        this.end_date = end_date;
        this.available_slots = available_slots;
        this.main_image = main_image;
        this.created_at = created_at;
    }
}
