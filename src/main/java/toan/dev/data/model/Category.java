package toan.dev.data.model;

import java.sql.Timestamp;

public class Category {
    public int id;
    public String name;
    public String thumbnail;
    public Boolean status;
    public Timestamp created_at;

    public Category(int id, String name, String thumbnail, Timestamp createdAt, boolean status) {
        super();
        this.id = id;
        this.name = name;
        this.thumbnail = thumbnail;
        this.created_at = createdAt;
        this.status = status;
    }

    public Category(int id, String name, String slug, String description, String thumbnail, int parentId, boolean status, Timestamp createdAt) {
        super();
        this.id = id;
        this.name = name;
        this.thumbnail = thumbnail;
        this.created_at = createdAt;
        this.status = status;
    }

    public Category(String name, String thumbnail, boolean status) {
        super();
        this.name = name;
        this.thumbnail = thumbnail;
        this.status = status;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Category(int id, String name, String slug, String description, int parent_id, Boolean status, Timestamp created_at) {
        super();
        this.id = id;
        this.name = name;
        this.status = status;
        this.created_at = created_at;
    }
}
