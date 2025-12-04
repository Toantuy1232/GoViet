package toan.dev.data.Impl;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.TourDao;
import toan.dev.data.model.Tours;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TourImpl implements TourDao {
    @Override
    public boolean insert(Tours tours) {
        String sql = "INSERT INTO tours(tour_id, destination_id, category_id, title, description, price, price_old, duration_days, start_date, end_date, available_slots, main_image, created_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, tours.tour_id);
            stmt.setInt(2, tours.destination_id);
            stmt.setInt(3, tours.category_id);
            stmt.setString(4, tours.title);
            stmt.setString(5, tours.description);
            stmt.setDouble(6, tours.price);
            stmt.setDouble(7, tours.price_old);
            stmt.setInt(8, tours.duration_days);
            stmt.setTimestamp(9, tours.start_date);
            stmt.setTimestamp(10, tours.end_date);
            stmt.setInt(11, tours.available_slots);
            stmt.setString(12, tours.main_image);
            stmt.setTimestamp(13, tours.created_at);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Tours tours) {
        String sql = "UPDATE tours SET destination_id = ?, category_id = ?, title = ?, description = ?, price = ?, price_old = ?, duration_days = ?, start_date = ?, end_date = ?, available_slots = ?, main_image = ?, created_at = ? WHERE tour_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, tours.destination_id);
            stmt.setInt(2, tours.category_id);
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
            stmt.setInt(13, tours.tour_id);
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
                int category_id = rs.getInt("category_id");
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
                return new Tours(tour_id, destination_id, category_id, title, description, price, price_old, duration_days,start_date, end_date,
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
                int category_id = rs.getInt("category_id");
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
                toursList.add(new Tours(tour_id, destination_id, category_id, title, description, price, price_old, duration_days,
                        start_date, end_date, available_slots, main_image, created_at));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return toursList;
    }

    @Override
    public List<Tours> findByCategoryAndSearchTerm(int categoryId, String searchTerm) {
        List<Tours> toursList = new ArrayList<>();
        String sql = "SELECT * FROM `tours` WHERE category_id = ? AND (LOWER(title) LIKE ? OR LOWER(description) LIKE ?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            String searchPattern = "%" + searchTerm.toLowerCase() + "%";
            stmt.setInt(1, categoryId);
            stmt.setString(2, searchPattern);
            stmt.setString(3, searchPattern);
            try (ResultSet rs = stmt.executeQuery()){
                while (rs.next()) {
                    int tour_id = rs.getInt("tour_id");
                    int destination_id = rs.getInt("destination_id");
                    int category_id = rs.getInt("category_id");
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
                    toursList.add(new Tours(tour_id, destination_id, category_id, title,
                            description, price, price_old, duration_days, start_date,
                            end_date, available_slots, main_image, created_at));
                }

            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return toursList;
    }

    @Override
    public List<Tours> findBySearchTerm(String searchTerm) {
        List<Tours> toursList = new ArrayList<>();
        String sql = "SELECT * FROM `tours` WHERE LOWER(title) LIKE ? OR LOWER(description) LIKE ?";

        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String searchPattern = "%" + searchTerm.toLowerCase() + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                   int tour_id = rs.getInt("tour_id");
                   int destination_id = rs.getInt("destination_id");
                   int category_id = rs.getInt("category_id");
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
                   toursList.add(new Tours(tour_id, destination_id, category_id,
                           title, description, price, price_old, duration_days, start_date,
                           end_date, available_slots, main_image, created_at));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return toursList;
    }

    @Override
    public List<Tours> findByDestination(int destinationId) {
        List<Tours> tours = new ArrayList<>();
        String sql = "SELECT * FROM tours WHERE destination_id = ?";

        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, destinationId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Tours tour = new Tours(
                            rs.getInt("tour_id"),
                            rs.getInt("destination_id"),
                            rs.getInt("category_id"),
                            rs.getString("title"),
                            rs.getString("description"),
                            rs.getDouble("price"),
                            rs.getDouble("price_old"),
                            rs.getInt("duration_days"),
                            rs.getTimestamp("start_date"),
                            rs.getTimestamp("end_date"),
                            rs.getInt("available_slots"),
                            rs.getString("main_image"),
                            rs.getTimestamp("created_at")
                    );
                    tours.add(tour);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tours;
    }


}
