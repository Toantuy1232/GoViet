package toan.dev.data.model;

import java.sql.Timestamp;

public class Wishlists {
    public int wishlist_id;
    public int user_id;
    public int tour_id;
    public Timestamp created_at;

    public int getWishlist_id() {
        return wishlist_id;
    }

    public void setWishlist_id(int wishlist_id) {
        this.wishlist_id = wishlist_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Wishlists(int wishlist_id, int user_id, int tour_id, Timestamp created_at) {
        super();
        this.wishlist_id = wishlist_id;
        this.user_id = user_id;
        this.tour_id = tour_id;
        this.created_at = created_at;
    }
}
