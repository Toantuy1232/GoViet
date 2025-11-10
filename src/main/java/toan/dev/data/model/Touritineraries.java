package toan.dev.data.model;

public class Touritineraries {
    public int itinerary_id;
    public int tour_id;
    public int day_number;
    public String title;
    public String activities;
    public String meals;
    public String accommodation;

    public int getItinerary_id() {
        return itinerary_id;
    }

    public void setItinerary_id(int itinerary_id) {
        this.itinerary_id = itinerary_id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public int getDay_number() {
        return day_number;
    }

    public void setDay_number(int day_number) {
        this.day_number = day_number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getActivities() {
        return activities;
    }

    public void setActivities(String activities) {
        this.activities = activities;
    }

    public String getMeals() {
        return meals;
    }

    public void setMeals(String meals) {
        this.meals = meals;
    }

    public String getAccommodation() {
        return accommodation;
    }

    public void setAccommodation(String accommodation) {
        this.accommodation = accommodation;
    }

    public Touritineraries(int itinerary_id, int tour_id, int day_number, String title, String activities, String meals, String accommodation) {
        super();
        this.itinerary_id = itinerary_id;
        this.tour_id = tour_id;
        this.day_number = day_number;
        this.title = title;
        this.activities = activities;
        this.meals = meals;
        this.accommodation = accommodation;
    }
}
