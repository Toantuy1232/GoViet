package toan.dev.data.Impl;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.DiscountsDao;
import toan.dev.data.model.Discounts;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DiscountsImpl implements DiscountsDao {
    @Override
    public boolean insert(Discounts discounts) {
        String sql = "INSERT INTO discounts(discount_id, code, description, discount_percent, valid_from, valid_to, is_active) values(?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, discounts.discount_id);
            stmt.setString(2, discounts.code);
            stmt.setString(3,discounts.description);
            stmt.setInt(4, discounts.discount_percent);
            stmt.setTimestamp(5, discounts.valid_from);
            stmt.setTimestamp(6, discounts.valid_to);
            stmt.setBoolean(7, discounts.is_active);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Discounts discounts) {
        String sql = "UPDATE discounts SET code = ?, description = ?, discount_percent = ?, valid_from = ?, valid_to = ?, is_active = ? WHERE discount_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, discounts.code);
            stmt.setString(2, discounts.description);
            stmt.setInt(3, discounts.discount_percent);
            stmt.setTimestamp(4, discounts.valid_from);
            stmt.setTimestamp(5, discounts.valid_to);
            stmt.setBoolean(6, discounts.is_active);
            stmt.setInt(7, discounts.discount_id);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM discounts WHERE discount_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Discounts find(int id) {
        String sql = "SELECT * FROM `discounts` where discount_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                int discount_id = rs.getInt("discount_id");
                String code = rs.getString("code");
                String description = rs.getString("description");
                int discount_percent = rs.getInt("discount_percent");
                Timestamp valid_from = rs.getTimestamp("valid_from");
                Timestamp valid_to = rs.getTimestamp("valid_to");
                Boolean is_active = rs.getBoolean("is_active");
                return new Discounts(discount_id, code, description, discount_percent, valid_from, valid_to, is_active);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy discounts với id = " + id);
    }

    @Override
    public List<Discounts> findAll() {
        List<Discounts> discountsList = new ArrayList<>();
        String sql = "SELECT * FROM `discounts`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ){
            while(rs.next()) {
                int discount_id = rs.getInt("discount_id");
                String code = rs.getString("code");
                String description = rs.getString("description");
                int discount_percent = rs.getInt("discount_percent");
                Timestamp valid_from = rs.getTimestamp("valid_from");
                Timestamp valid_to = rs.getTimestamp("valid_to");
                Boolean is_active = rs.getBoolean("is_active");
                discountsList.add(new Discounts(discount_id, code, description, discount_percent, valid_from, valid_to, is_active));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return discountsList;
    }
}
