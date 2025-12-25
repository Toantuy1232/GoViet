package toan.dev.data.Impl;

import toan.dev.data.dao.CartDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.CartItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartImpl implements CartDao {

    @Override
    public boolean insert(CartItem cartItem) {
        String sql = "INSERT INTO cart(user_id, product_id, product_name, product_image, price, quantity) VALUES(?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartItem.getUserId());
            stmt.setInt(2, cartItem.getProductId());
            stmt.setString(3, cartItem.getProductName());
            stmt.setString(4, cartItem.getProductImage());
            stmt.setDouble(5, cartItem.getPrice());
            stmt.setInt(6, cartItem.getQuantity());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(CartItem cartItem) {
        String sql = "UPDATE cart SET quantity=?, updated_at=? WHERE id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartItem.getQuantity());
            stmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            stmt.setInt(3, cartItem.getCartId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int cartId) {
        String sql = "DELETE FROM cart WHERE id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteByUserAndProduct(int userId, int productId) {
        String sql = "DELETE FROM cart WHERE user_id=? AND product_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean clearCart(int userId) {
        String sql = "DELETE FROM cart WHERE user_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public CartItem find(int cartId) {
        String sql = "SELECT * FROM cart WHERE id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return extractCartItem(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public CartItem findByUserAndProduct(int userId, int productId) {
        String sql = "SELECT * FROM cart WHERE user_id=? AND product_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return extractCartItem(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CartItem> findByUserId(int userId) {
        List<CartItem> items = new ArrayList<>();
        String sql = "SELECT * FROM cart WHERE user_id=? ORDER BY created_at DESC";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                items.add(extractCartItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    @Override
    public int getCartCount(int userId) {
        String sql = "SELECT SUM(quantity) as total FROM cart WHERE user_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private CartItem extractCartItem(ResultSet rs) throws SQLException {
        CartItem item = new CartItem();
        item.setCartId(rs.getInt("id"));
        item.setUserId(rs.getInt("user_id"));
        item.setItemId(rs.getInt("product_id"));
        item.setItemName(rs.getString("product_name"));
        item.setImageUrl(rs.getString("product_image"));
        item.setPrice(rs.getDouble("price"));
        item.setQuantity(rs.getInt("quantity"));
        return item;
    }

    @Override
    public boolean updateQuantity(int userId, int itemId, String type, int quantity) {
        String sql = "UPDATE cart SET quantity=?, updated_at=? WHERE user_id=? AND product_id=?";
        System.out.println("CartImpl.updateQuantity - SQL: " + sql);
        System.out.println("Parameters: userId=" + userId + ", itemId=" + itemId + ", type=" + type + ", quantity=" + quantity);
        
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quantity);
            stmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            stmt.setInt(3, userId);
            stmt.setInt(4, itemId);
            
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error in updateQuantity: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean removeFromCart(int userId, int itemId, String type) {
        String sql = "DELETE FROM cart WHERE user_id=? AND product_id=?";
        System.out.println("CartImpl.removeFromCart - SQL: " + sql);
        System.out.println("Parameters: userId=" + userId + ", itemId=" + itemId + ", type=" + type);
        
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, itemId);
            
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error in removeFromCart: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
