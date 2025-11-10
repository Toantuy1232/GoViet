package toan.dev.data.model;

import java.sql.Timestamp;

public class Discounts {
    public int discount_id;
    public String code;
    public String description;
    public int discount_percent;
    public Timestamp valid_from;
    public Timestamp valid_to;
    public Boolean is_active;

    public Discounts(int discount_id, String code, String description, int discount_percent, Timestamp valid_from, Timestamp valid_to, Boolean is_active) {
        super();
        this.discount_id = discount_id;
        this.code = code;
        this.description = description;
        this.discount_percent = discount_percent;
        this.valid_from = valid_from;
        this.valid_to = valid_to;
        this.is_active = is_active;
    }

    public int getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(int discount_id) {
        this.discount_id = discount_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDiscount_percent() {
        return discount_percent;
    }

    public void setDiscount_percent(int discount_percent) {
        this.discount_percent = discount_percent;
    }

    public Timestamp getValid_from() {
        return valid_from;
    }

    public void setValid_from(Timestamp valid_from) {
        this.valid_from = valid_from;
    }

    public Timestamp getValid_to() {
        return valid_to;
    }

    public void setValid_to(Timestamp valid_to) {
        this.valid_to = valid_to;
    }

    public Boolean getIs_active() {
        return is_active;
    }

    public void setIs_active(Boolean is_active) {
        this.is_active = is_active;
    }
}
