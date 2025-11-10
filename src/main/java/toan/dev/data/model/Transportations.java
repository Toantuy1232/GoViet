package toan.dev.data.model;

public class Transportations {
    public int transport_id;
    public String name;
    public String type;
    public String company;
    public String contact_info;
    public double price_per_person;

    public int getTransport_id() {
        return transport_id;
    }

    public void setTransport_id(int transport_id) {
        this.transport_id = transport_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getContact_info() {
        return contact_info;
    }

    public void setContact_info(String contact_info) {
        this.contact_info = contact_info;
    }

    public double getPrice_per_person() {
        return price_per_person;
    }

    public void setPrice_per_person(double price_per_person) {
        this.price_per_person = price_per_person;
    }

    public Transportations(int transport_id, String name, String type, String company, String contact_info, double price_per_person) {
        super();
        this.transport_id = transport_id;
        this.name = name;
        this.type = type;
        this.company = company;
        this.contact_info = contact_info;
        this.price_per_person = price_per_person;
    }
}
