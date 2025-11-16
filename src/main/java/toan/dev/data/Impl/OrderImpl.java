package toan.dev.data.Impl;
import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.OrdersDao;
import toan.dev.data.model.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderImpl implements OrdersDao {
    @Override
    public boolean insert(Orders orders) {
        String sql = "INSERT INTO orders(order_id, user_id, order_date, total_amount, status, shipping_address, payment_method, payment_id, note, created_at, updated_at, code) VALUES(?,?,?,?,?,?,?,?,?,?,?, ?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, orders.order_id);
            stmt.setInt(2, orders.user_id);
            stmt.setTimestamp(3, orders.order_date);
            stmt.setDouble(4, orders.total_amount);
            stmt.setString(5, orders.status);
            stmt.setString(6, orders.shipping_address);
            stmt.setString(7, orders.payment_method);
            stmt.setInt(8, orders.payment_id);
            stmt.setString(9, orders.note);
            stmt.setTimestamp(10, orders.created_at);
            stmt.setTimestamp(11, orders.updated_at);
            stmt.setString(12, orders.code);
            stmt.executeUpdate();
            return true;

        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Orders orders) {
        String sql = "UPDATE orders SET user_id = ?, order_date = ?, total_amount = ?, status = ?, shipping_address = ?, payment_method = ?, payment_id = ?, note = ?, created_at = ?, updated_at = ?, code = ? WHERE order_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, orders.user_id);
            stmt.setTimestamp(2, orders.order_date);
            stmt.setDouble(3, orders.total_amount);
            stmt.setString(4, orders.status);
            stmt.setString(5, orders.shipping_address);
            stmt.setString(6, orders.payment_method);
            stmt.setInt(7, orders.payment_id);
            stmt.setString(8, orders.note);
            stmt.setTimestamp(9, orders.created_at);
            stmt.setTimestamp(10, orders.updated_at);
            stmt.setInt(11, orders.order_id);
            stmt.setString(12, orders.code);
            stmt.executeUpdate();
            return true;
        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM orders WHERE order_id = ?";
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
    public Orders find(int id) {
        String sql = "SELECT * FROM `orders` WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if(rs.next()) {
                    return new Orders(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getTimestamp("order_date"),
                        rs.getDouble("total_amount"),
                        rs.getString("status"),
                        rs.getString("shipping_address"),
                        rs.getString("payment_method"),
                        rs.getInt("payment_id"),
                        rs.getString("note"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("code")
                    );
                }
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy order với id = " + id);
    }

    @Override
    public List<Orders> findAll() {
        List<Orders> ordersList = new ArrayList<>();
        String sql = "SELECT * FROM `orders`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
           try (ResultSet rs = stmt.executeQuery()){
             if(rs.next()) {
               ordersList.add(new Orders(
                       rs.getInt("order_id"),
                       rs.getInt("user_id"),
                       rs.getTimestamp("order_date"),
                       rs.getDouble("total_amount"),
                       rs.getString("status"),
                       rs.getString("shipping_address"),
                       rs.getString("payment_method"),
                       rs.getInt("payment_id"),
                       rs.getString("note"),
                       rs.getTimestamp("created_at"),
                       rs.getTimestamp("updated_at"),
                       rs.getString("code")
               ));
             }
           }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return ordersList;
    }

    @Override
    public Orders findByCode(String code) {
        String sql = "SELECT * FROM `orders` WHERE code = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, code);
            try(ResultSet rs = stmt.executeQuery()) {
                if(rs.next()) {
                   return new Orders(
                           rs.getInt("order_id"),
                           rs.getInt("user_id"),
                           rs.getTimestamp("order_date"),
                           rs.getDouble("total_amount"),
                           rs.getString("status"),
                           rs.getString("shipping_address"),
                           rs.getString("payment_method"),
                           rs.getInt("payment_id"),
                           rs.getString("note"),
                           rs.getTimestamp("created_at"),
                           rs.getTimestamp("updated_at"),
                           rs.getString("code")
                   );
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Orders> findByUserId(int userId) {
        List<Orders> orders = new ArrayList<>();
        String sql = "SELECT * FROM `orders` WHERE user_id = ? ORDER BY created_at desc";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()){
                while (rs.next()) {
                  orders.add(new Orders(
                          rs.getInt("order_id"),
                          rs.getInt("user_id"),
                          rs.getTimestamp("order_date"),
                          rs.getDouble("total_amount"),
                          rs.getString("status"),
                          rs.getString("shipping_address"),
                          rs.getString("payment_method"),
                          rs.getInt("payment_id"),
                          rs.getString("note"),
                          rs.getTimestamp("created_at"),
                          rs.getTimestamp("updated_at"),
                          rs.getString("code")
                  ));
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
