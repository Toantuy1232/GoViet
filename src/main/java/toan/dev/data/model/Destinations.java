package toan.dev.data.model;

import java.sql.Timestamp;

public class Destinations {
    public int destination_id;
    public String name;
    public String description;
    public String location;
    public int category_id;
    public String image_url;
    public String best_time_to_visit;
    public Timestamp created_at;

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public Destinations(int id, int destinationId, String name, String description, String location, int category_id, String imageUrl, String bestTimeToVisit, Timestamp createdAt) {
        super();
        this.destination_id = destinationId;
        this.name = name;
        this.description = description;
        this.location = location;
        this.category_id = category_id;
        this.image_url = imageUrl;
        this.best_time_to_visit = bestTimeToVisit;
        this.created_at = createdAt;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getBest_time_to_visit() {
        return best_time_to_visit;
    }

    public void setBest_time_to_visit(String best_time_to_visit) {
        this.best_time_to_visit = best_time_to_visit;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Destinations(int destination_id, String name, String description, String location, int category_id,String image_url, String best_time_to_visit, Timestamp created_at) {
        super();
        this.destination_id = destination_id;
        this.name = name;
        this.description = description;
        this.location = location;
        this.category_id = category_id;
        this.image_url = image_url;
        this.best_time_to_visit = best_time_to_visit;
        this.created_at = created_at;
    }
}
