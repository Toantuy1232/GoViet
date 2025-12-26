package toan.dev.data.Impl;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.OrderDao;
import toan.dev.data.model.Order;
import toan.dev.data.model.OrderItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderImpl implements OrderDao {

    @Override
    public boolean insert(Order order) {
        System.out.println("OrderImpl.insert() called for order: " + order.getOrderCode());
        String orderSql = "INSERT INTO orders(user_id, order_code, customer_name, customer_email, customer_phone, customer_address, total_amount, payment_method, payment_status, order_status, notes, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String itemSql = "INSERT INTO order_items(order_id, product_id, product_name, product_image, quantity, price, subtotal) VALUES(?,?,?,?,?,?,?)";
        
        Connection conn = null;
        try {
            conn = DatabaseDao.getDriver().getConnection();
            System.out.println("Database connection obtained");
            conn.setAutoCommit(false);
            
            // Insert order
            PreparedStatement orderStmt = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, order.getUserId());
            orderStmt.setString(2, order.getOrderCode());
            orderStmt.setString(3, order.getCustomerName());
            orderStmt.setString(4, order.getCustomerEmail());
            orderStmt.setString(5, order.getCustomerPhone());
            orderStmt.setString(6, order.getCustomerAddress());
            orderStmt.setDouble(7, order.getTotalAmount());
            orderStmt.setString(8, order.getPaymentMethod());
            orderStmt.setString(9, order.getPaymentStatus());
            orderStmt.setString(10, order.getOrderStatus());
            orderStmt.setString(11, order.getNotes());
            orderStmt.setTimestamp(12, order.getCreatedAt());
            orderStmt.setTimestamp(13, order.getUpdatedAt());
            
            System.out.println("Executing order insert query...");
            int orderRowsAffected = orderStmt.executeUpdate();
            System.out.println("Order insert affected rows: " + orderRowsAffected);
            
            // Get generated order ID
            ResultSet rs = orderStmt.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
                System.out.println("Generated order ID: " + orderId);
            } else {
                System.out.println("No order ID generated!");
                throw new SQLException("Failed to get generated order ID");
            }
            
            // Insert order items
            PreparedStatement itemStmt = conn.prepareStatement(itemSql);
            System.out.println("Inserting " + order.getOrderItems().size() + " order items...");
            for (OrderItem item : order.getOrderItems()) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getProductId());
                itemStmt.setString(3, item.getProductName());
                itemStmt.setString(4, item.getProductImage());
                itemStmt.setInt(5, item.getQuantity());
                itemStmt.setDouble(6, item.getPrice());
                itemStmt.setDouble(7, item.getSubtotal());
                itemStmt.addBatch();
                System.out.println("Added item to batch: " + item.getProductName() + " x" + item.getQuantity());
            }
            int[] itemResults = itemStmt.executeBatch();
            System.out.println("Order items batch executed, results: " + itemResults.length);
            
            conn.commit();
            System.out.println("Transaction committed successfully");
            return true;
        } catch (SQLException e) {
            System.err.println("SQLException in OrderImpl.insert(): " + e.getMessage());
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                    System.out.println("Transaction rolled back");
                } catch (SQLException ex) {
                    System.err.println("Error rolling back transaction: " + ex.getMessage());
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                    System.out.println("Database connection closed");
                } catch (SQLException e) {
                    System.err.println("Error closing connection: " + e.getMessage());
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public Order find(int orderId) {
        String sql = "SELECT * FROM orders WHERE order_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Order order = extractOrder(rs);
                order.setOrderItems(findOrderItems(orderId));
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Order findByOrderCode(String orderCode) {
        String sql = "SELECT * FROM orders WHERE order_code=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, orderCode);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Order order = extractOrder(rs);
                order.setOrderItems(findOrderItems(order.getOrderId()));
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Order> findAll() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY created_at DESC";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Order order = extractOrder(rs);
                order.setOrderItems(findOrderItems(order.getOrderId()));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public List<Order> findByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id=? ORDER BY created_at DESC";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = extractOrder(rs);
                order.setOrderItems(findOrderItems(order.getOrderId()));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public List<Order> findByStatus(String status) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE order_status=? ORDER BY created_at DESC";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = extractOrder(rs);
                order.setOrderItems(findOrderItems(order.getOrderId()));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public boolean update(Order order) {
        String sql = "UPDATE orders SET order_status=?, payment_status=?, updated_at=? WHERE order_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, order.getOrderStatus());
            stmt.setString(2, order.getPaymentStatus());
            stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            stmt.setInt(4, order.getOrderId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE orders SET order_status=?, updated_at=? WHERE order_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            stmt.setInt(3, orderId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updatePaymentStatus(int orderId, String status) {
        String sql = "UPDATE orders SET payment_status=?, updated_at=? WHERE order_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            stmt.setInt(3, orderId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int orderId) {
        String sql = "DELETE FROM orders WHERE order_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private List<OrderItem> findOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT * FROM order_items WHERE order_id=?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                OrderItem item = new OrderItem();
                item.setOrderItemId(rs.getInt("order_item_id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setProductName(rs.getString("product_name"));
                item.setProductImage(rs.getString("product_image"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setSubtotal(rs.getDouble("subtotal"));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    private Order extractOrder(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("order_id"));
        order.setUserId(rs.getInt("user_id"));
        order.setOrderCode(rs.getString("order_code"));
        order.setCustomerName(rs.getString("customer_name"));
        order.setCustomerEmail(rs.getString("customer_email"));
        order.setCustomerPhone(rs.getString("customer_phone"));
        order.setCustomerAddress(rs.getString("customer_address"));
        order.setTotalAmount(rs.getDouble("total_amount"));
        order.setPaymentMethod(rs.getString("payment_method"));
        order.setPaymentStatus(rs.getString("payment_status"));
        order.setOrderStatus(rs.getString("order_status"));
        order.setNotes(rs.getString("notes"));
        order.setCreatedAt(rs.getTimestamp("created_at"));
        order.setUpdatedAt(rs.getTimestamp("updated_at"));
        return order;
    }
}
