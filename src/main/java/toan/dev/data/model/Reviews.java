package toan.dev.data.model;

import java.sql.Timestamp;

public class Reviews {
    public int review_id;
    public int tour_id;
    public int user_id;
    public int rating;
    public String comment;
    public Timestamp created_at;

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Reviews(int review_id, int tour_id, int user_id, int rating, String comment, Timestamp created_at) {
        super();
        this.review_id = review_id;
        this.tour_id = tour_id;
        this.user_id = user_id;
        this.rating = rating;
        this.comment = comment;
        this.created_at = created_at;
    }
}
