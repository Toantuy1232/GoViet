package toan.dev.data.model;

import java.sql.Timestamp;

public class Tourguideassign {
    public int id;
    public int tour_id;
    public int guide_id;
    public Timestamp assigned_date;

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

    public int getGuide_id() {
        return guide_id;
    }

    public void setGuide_id(int guide_id) {
        this.guide_id = guide_id;
    }

    public Timestamp getAssigned_date() {
        return assigned_date;
    }

    public void setAssigned_date(Timestamp assigned_date) {
        this.assigned_date = assigned_date;
    }

    public Tourguideassign(int id, int tour_id, int guide_id, Timestamp assigned_date) {
        this.id = id;
        this.tour_id = tour_id;
        this.guide_id = guide_id;
        this.assigned_date = assigned_date;
    }
}
