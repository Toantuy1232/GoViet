package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.DestinationsDao;
import toan.dev.data.model.Destinations;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DestinationsImpl implements DestinationsDao {
    @Override
    public boolean insert(Destinations destinations) {
        String sql = "insert into destinations(destination_id, name, description, location, image_url, best_time_to_visit, created_at) values(?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, destinations.destination_id);
            stmt.setString(2, destinations.name);
            stmt.setString(3, destinations.description);
            stmt.setString(4, destinations.location);
            stmt.setString(5, destinations.image_url);
            stmt.setString(6, destinations.best_time_to_visit);
            stmt.setTimestamp(7, destinations.created_at);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Destinations destinations) {
        String sql = "update destinations set name = ?, description = ?, location = ?, image_url = ?, best_time_to_visit = ?, created_at = ? where destination_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, destinations.name);
            stmt.setString(2, destinations.description);
            stmt.setString(3, destinations.location);
            stmt.setString(4, destinations.image_url);
            stmt.setString(5, destinations.best_time_to_visit);
            stmt.setTimestamp(6, destinations.created_at);
            stmt.setInt(7, destinations.destination_id);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM destinations where destination_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Destinations find(int id) {
        String sql = "SELECT * FROM `destinations` where destination_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
              int destination_id = rs.getInt("destination_id");
              String name = rs.getString("name");
              String description = rs.getString("description");
              String location = rs.getString("location");
              String image_url = rs.getString("image_url");
              String best_time_to_visit = rs.getString("best_time_to_visit");
              Timestamp created_at = rs.getTimestamp("created_at");
              return new Destinations(id, destination_id, name, description, location, image_url, best_time_to_visit, created_at);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy destination_id = " + id);
    }

    @Override
    public List<Destinations> findAll() {
        List<Destinations> destinationsList = new ArrayList<>();
        String sql = "SELECT * FROM `destinations`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int destination_id = rs.getInt("destination_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String location = rs.getString("location");
                String image_url = rs.getString("image_url");
                String best_time_to_visit = rs.getString("best_time_to_visit");
                Timestamp created_at = rs.getTimestamp("created_at");
               destinationsList.add(new Destinations(destination_id, name, description, location, image_url, best_time_to_visit, created_at));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return destinationsList;
    }
}
