package toan.dev.data.Impl;
import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.OrdersDao;
import toan.dev.data.model.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class OrderImpl implements OrdersDao {
    @Override
    public boolean insert(Orders orders) {
        String sql = "INSERT INTO orders(order_id, user_id, order_date, total_amount, status, shipping_address, payment_method, payment_id, note, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
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
            stmt.executeUpdate();
            return true;

        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Orders orders) {
        String sql = "UPDATE orders SET user_id = ?, order_date = ?, total_amount = ?, status = ?, shipping_address = ?, payment_method = ?, payment_id = ?, note = ?, created_at = ?, updated_at = ? WHERE order_id = ?";
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
            stmt.executeUpdate();
            return true;
        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public Orders find(int id) {
        return null;
    }

    @Override
    public List<Orders> findAll() {
        return List.of();
    }
}
