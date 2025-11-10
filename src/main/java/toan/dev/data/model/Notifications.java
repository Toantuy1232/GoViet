package toan.dev.data.model;

import java.sql.Timestamp;

public class Notifications {
    public int notification_id;
    public int user_id;
    public String title;
    public String message;
    public Boolean is_read;
    public Timestamp created_at;

    public int getNotification_id() {
        return notification_id;
    }

    public void setNotification_id(int notification_id) {
        this.notification_id = notification_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getIs_read() {
        return is_read;
    }

    public void setIs_read(Boolean is_read) {
        this.is_read = is_read;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Notifications(int notification_id, int user_id, String title, String message, Boolean is_read, Timestamp created_at) {
        this.notification_id = notification_id;
        this.user_id = user_id;
        this.title = title;
        this.message = message;
        this.is_read = is_read;
        this.created_at = created_at;
    }
}
