package toan.dev.data.model;

public class CartItem {
    private String type; // "tour" or "hotel"
    private int itemId;
    private String itemName;
    private double price;
    private int quantity;
    private String imageUrl;

    public CartItem() {
    }

    public CartItem(String type, int itemId, String itemName, double price, int quantity, String imageUrl) {
        this.type = type;
        this.itemId = itemId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
    }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }
    
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public double getTotal() {
        return price * quantity;
    }
}
