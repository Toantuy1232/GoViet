package toan.dev.data.Impl;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.PaymentsDao;
import toan.dev.data.model.Payments;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentImpl implements PaymentsDao {
    @Override
    public boolean insert(Payments payments) {
        String sql = "INSERT INTO payments(payment_id, booking_id, payment_method, transaction_id, amount, payment_date, order_id) VALUES (?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1,payments.payment_id);
            stmt.setInt(2, payments.booking_id);
            stmt.setString(3, payments.payment_method);
            stmt.setString(4, payments.transaction_id);
            stmt.setDouble(5, payments.amount);
            stmt.setTimestamp(6, payments.payment_date);
            stmt.setInt(7, payments.order_id);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Payments payments) {
        String sql = "UPDATE payments SET booking_id = ?, payment_method = ?, transaction_id = ?, amount = ?, payment_date = ?, order_id = ? WHERE payment_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, payments.booking_id);
            stmt.setString(2, payments.payment_method);
            stmt.setString(3, payments.transaction_id);
            stmt.setDouble(4, payments.amount);
            stmt.setTimestamp(5, payments.payment_date);
            stmt.setInt(6, payments.order_id);
            stmt.setInt(7, payments.payment_id);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM payments WHERE payment_id = ?";
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
    public Payments find(int id) {
        String sql = "SELECT * FROM `payments` WHERE payment_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()){
                  if(rs.next()) {
                    int payment_id = rs.getInt("payment_id");
                    int booking_id = rs.getInt("booking_id");
                    String payment_method = rs.getString("payment_method");
                    String transaction_id = rs.getString("transaction_id");
                    double amount = rs.getDouble("amount");
                    Timestamp payment_date = rs.getTimestamp("payment_date");
                    int order_id = rs.getInt("order_id");
                    return new Payments(payment_id, booking_id, payment_method, transaction_id, amount, payment_date, order_id);
                  }
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Payments> findAll() {
        List<Payments> paymentsList = new ArrayList<>();
        String sql = "SELECT * FROM `payments`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
               int payment_id = rs.getInt("payment_id");
               int booking_id = rs.getInt("booking_id");
               String payment_method = rs.getString("payment_method");
               String transaction_id = rs.getString("transaction_id");
               double amount = rs.getDouble("amount");
               Timestamp payment_date = rs.getTimestamp("payment_date");
               int order_id = rs.getInt("order_id");
               paymentsList.add(new Payments(payment_id, booking_id, payment_method, transaction_id, amount, payment_date, order_id));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return paymentsList;
    }
}
