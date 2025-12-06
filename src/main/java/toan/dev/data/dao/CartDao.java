package toan.dev.data.dao;

import toan.dev.data.model.CartItem;
import java.util.List;

public interface CartDao {
    boolean insert(CartItem cartItem);
    boolean update(CartItem cartItem);
    boolean delete(int cartId);
    boolean deleteByUserAndProduct(int userId, int productId);
    boolean clearCart(int userId);
    CartItem find(int cartId);
    CartItem findByUserAndProduct(int userId, int productId);
    List<CartItem> findByUserId(int userId);
    int getCartCount(int userId);
}
