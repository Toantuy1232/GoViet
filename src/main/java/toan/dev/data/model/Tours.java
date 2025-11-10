package toan.dev.data.model;

import java.sql.Timestamp;

public class Tours {
    public int tour_id;
    public int destination_id;
    public String title;
    public String description;
    public double price;
    public int duration_days;
    public Timestamp start_date;
    public Timestamp end_date;
    public int available_slots;
    public String main_image;
    public Timestamp created_at;

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

    public Tours(int tour_id, int destination_id, String title, String description, double price, int duration_days, Timestamp start_date, Timestamp end_date, int available_slots, String main_image, Timestamp created_at) {
        super();
        this.tour_id = tour_id;
        this.destination_id = destination_id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.duration_days = duration_days;
        this.start_date = start_date;
        this.end_date = end_date;
        this.available_slots = available_slots;
        this.main_image = main_image;
        this.created_at = created_at;
    }
}
