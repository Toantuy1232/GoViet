package toan.dev.data.model;

public class Tourdiscounts {
    public int id;
    public int tour_id;
    public int discount_id;

    public Tourdiscounts(int id, int tour_id, int discount_id) {
        super();
        this.id = id;
        this.tour_id = tour_id;
        this.discount_id = discount_id;
    }

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

    public int getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(int discount_id) {
        this.discount_id = discount_id;
    }
}
