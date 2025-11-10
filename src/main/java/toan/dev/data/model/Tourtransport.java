package toan.dev.data.model;

public class Tourtransport {
    public int id;
    public int tour_id;
    public int transport_id;

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

    public int getTransport_id() {
        return transport_id;
    }

    public void setTransport_id(int transport_id) {
        this.transport_id = transport_id;
    }

    public Tourtransport(int id, int tour_id, int transport_id) {
        super();
        this.id = id;
        this.tour_id = tour_id;
        this.transport_id = transport_id;
    }
}
