package toan.dev.data.model;

public class Tourimages {
    public int image_id;
    public int tour_id;
    public String image_url;
    public String caption;

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public Tourimages(int image_id, int tour_id, String image_url, String caption) {
        super();
        this.image_id = image_id;
        this.tour_id = tour_id;
        this.image_url = image_url;
        this.caption = caption;
    }
}
