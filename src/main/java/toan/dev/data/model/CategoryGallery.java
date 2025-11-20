package toan.dev.data.model;

import java.sql.Timestamp;

public class CategoryGallery {
    private int id;
    private int category_id;
    private String image_url;
    private Timestamp created_at;

    public CategoryGallery(int id, int category_id, String image_url, Timestamp created_at) {
        super();
        this.id = id;
        this.category_id = category_id;
        this.image_url = image_url;
        this.created_at = created_at;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

}
