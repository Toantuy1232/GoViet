package toan.dev.data.model;

import java.sql.Timestamp;

public class TourCategory {
    public int id;
    public int tour_id;
    public int category_id;
    public Timestamp created_at;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
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

    public TourCategory(int id, int tour_id, int category_id, Timestamp created_at) {
        super();
        this.id = id;
        this.tour_id = tour_id;
        this.category_id = category_id;
        this.created_at = created_at;
    }
}
