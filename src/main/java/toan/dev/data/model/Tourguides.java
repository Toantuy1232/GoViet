package toan.dev.data.model;

public class Tourguides {
    public int guide_id;
    public String fullname;
    public String phone;
    public String email;
    public int experience_years;
    public String avatar_url;

    public int getGuide_id() {
        return guide_id;
    }

    public void setGuide_id(int guide_id) {
        this.guide_id = guide_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getExperience_years() {
        return experience_years;
    }

    public void setExperience_years(int experience_years) {
        this.experience_years = experience_years;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }

    public Tourguides(int guide_id, String fullname, String phone, String email, int experience_years, String avatar_url) {
        this.guide_id = guide_id;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.experience_years = experience_years;
        this.avatar_url = avatar_url;
    }
}
