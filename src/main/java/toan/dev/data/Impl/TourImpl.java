package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.TourDao;
import toan.dev.data.model.Discounts;
import toan.dev.data.model.Tours;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TourImpl implements TourDao {
    @Override
    public boolean insert(Tours tours) {
        String sql = "INSERT INTO tours(tour_id, destination_id, title, description, price, price_old, duration_days, start_date, end_date, available_slots, main_image, created_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, tours.tour_id);
            stmt.setInt(2, tours.destination_id);
            stmt.setString(3, tours.title);
            stmt.setString(4, tours.description);
            stmt.setDouble(5, tours.price);
            stmt.setDouble(6, tours.price_old);
            stmt.setInt(7, tours.duration_days);
            stmt.setTimestamp(8, tours.start_date);
            stmt.setTimestamp(9, tours.end_date);
            stmt.setInt(10, tours.available_slots);
            stmt.setString(11, tours.main_image);
            stmt.setTimestamp(12, tours.created_at);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Tours tours) {
        String sql = "UPDATE tours SET destination_id = ?, title = ?, description = ?, price = ?, price_old = ?, duration_days = ?, start_date = ?, end_date = ?, available_slots = ?, main_image = ?, created_at = ? WHERE tour_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, tours.destination_id);
            stmt.setString(2, tours.title);
            stmt.setString(3, tours.description);
            stmt.setDouble(4, tours.price);
            stmt.setDouble(5, tours.price_old);
            stmt.setInt(6, tours.duration_days);
            stmt.setTimestamp(7, tours.start_date);
            stmt.setTimestamp(8, tours.end_date);
            stmt.setInt(9, tours.available_slots);
            stmt.setString(10, tours.main_image);
            stmt.setTimestamp(11, tours.created_at);
            stmt.executeUpdate();
            return true;
        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM tours WHERE tour_id = ?";
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
    public Tours find(int id) {
        String sql = "SELECT * FROM `tours` where tour_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                int tour_id = rs.getInt("tour_id");
                int destination_id = rs.getInt("destination_id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                double price_old = rs.getDouble("price_old");
                int duration_days = rs.getInt("duration_days");
                Timestamp start_date = rs.getTimestamp("start_date");
                Timestamp end_date = rs.getTimestamp("end_date");
                int available_slots = rs.getInt("available_slots");
                String main_image = rs.getString("main_image");
                Timestamp created_at = rs.getTimestamp("created_at");
                return new Tours(tour_id, destination_id, title, description, price, price_old, duration_days,start_date, end_date,
                        available_slots, main_image, created_at);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy tours với tour_id = " + id);
    }

    @Override
    public List<Tours> findAll() {
        List<Tours> toursList = new ArrayList<>();
        String sql = "SELECT * FROM `tours`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int tour_id = rs.getInt("tour_id");
                int destination_id = rs.getInt("destination_id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                double price_old = rs.getDouble("price_old");
                int duration_days = rs.getInt("duration_days");
                Timestamp start_date = rs.getTimestamp("start_date");
                Timestamp end_date = rs.getTimestamp("end_date");
                int available_slots = rs.getInt("available_slots");
                String main_image = rs.getString("main_image");
                Timestamp created_at = rs.getTimestamp("created_at");
                toursList.add(new Tours(tour_id, destination_id, title, description, price, price_old, duration_days,
                        start_date, end_date, available_slots, main_image, created_at));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return toursList;
    }
}
