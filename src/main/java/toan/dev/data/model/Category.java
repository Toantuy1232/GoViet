package toan.dev.data.model;

import java.sql.Timestamp;

public class Category {
    public int id;
    public String name;
    public String slug;
    public String description;
    public int parent_id;
    public Boolean status;
    public Timestamp created_at;

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

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
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
        this.slug = slug;
        this.description = description;
        this.parent_id = parent_id;
        this.status = status;
        this.created_at = created_at;
    }
}
