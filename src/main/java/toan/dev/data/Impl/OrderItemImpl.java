package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.OrderItemsDao;
import toan.dev.data.model.OrderItems;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemImpl implements OrderItemsDao {
    @Override
    public boolean insert(OrderItems orderItems) {
        String sql = "INSERT INTO order_items(order_id, product_id, quantity, price_each, subtotal, created_at) VALUES(?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, orderItems.order_id);
            stmt.setInt(2, orderItems.product_id);
            stmt.setInt(3, orderItems.quantity);
            stmt.setDouble(4, orderItems.price_each);
            stmt.setDouble(5, orderItems.subtotal);
            stmt.setTimestamp(6, orderItems.created_at);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(OrderItems orderItems) {
        String sql = "UPDATE order_items SET order_id = ?, product_id  = ?, quantity = ?, price_each = ?, subtotal = ?, created_at = ? WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, orderItems.order_id);
            stmt.setInt(2, orderItems.product_id);
            stmt.setInt(3, orderItems.quantity);
            stmt.setDouble(4, orderItems.price_each);
            stmt.setDouble(5, orderItems.subtotal);
            stmt.setTimestamp(6, orderItems.created_at);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM order_items WHERE order_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public OrderItems find(int id) {
        String sql = "SELECT * FROM `order_items`WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()){
                if(rs.next()) {
                   int order_id = rs.getInt("order_id");
                   int product_id = rs.getInt("product_id");
                   int quantity = rs.getInt("quantity");
                   double price_each = rs.getDouble("price_each");
                   double subtotal = rs.getDouble("subtotal");
                   Timestamp created_at = rs.getTimestamp("created_at");
                   return new OrderItems(id, order_id, product_id, quantity, price_each, subtotal, created_at);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy order_items với id = " + id);
    }

    @Override
    public List<OrderItems> findAll() {
        List<OrderItems> orderItemsList = new ArrayList<>();
        String sql = "SELECT * FROM `order_items`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int id = rs.getInt("id");
                int order_id = rs.getInt("order_id");
                int product_id = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price_each = rs.getDouble("price_each");
                double subtotal = rs.getDouble("subtotal");
                Timestamp created_at = rs.getTimestamp("created_at");
                orderItemsList.add(new OrderItems(id, order_id, product_id, quantity, price_each, subtotal, created_at));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItemsList;
    }

    @Override
    public List<OrderItems> findByOrderId(int orderId) {
        List<OrderItems> items = new ArrayList<>();
        String sql = "SELECT * FROM `order_items` WHERE order_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()){
               while (rs.next()) {
                   items.add(new OrderItems(
                   rs.getInt("id"),
                   rs.getInt("order_id"),
                   rs.getInt("product_id"),
                   rs.getInt("quantity"),
                   rs.getDouble("price_each"),
                   rs.getDouble("subtotal"),
                   rs.getTimestamp("created_at")
                   ));
               }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
}
