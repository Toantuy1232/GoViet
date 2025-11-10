package toan.dev.data.model;

public class Hotels {
    public int hotel_id;
    public int destination_id;
    public String name;
    public String address;
    public double price_per_night;
    public int stars;
    public String image_url;

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public int getDestination_id() {
        return destination_id;
    }

    public void setDestination_id(int destination_id) {
        this.destination_id = destination_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getPrice_per_night() {
        return price_per_night;
    }

    public void setPrice_per_night(double price_per_night) {
        this.price_per_night = price_per_night;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public Hotels(int hotel_id, int destination_id, String name, String address, double price_per_night, int stars, String image_url) {
        super();
        this.hotel_id = hotel_id;
        this.destination_id = destination_id;
        this.name = name;
        this.address = address;
        this.price_per_night = price_per_night;
        this.stars = stars;
        this.image_url = image_url;
    }
}
