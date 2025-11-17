package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.HotelsDao;
import toan.dev.data.model.Hotels;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HotelsImpl implements HotelsDao {
    @Override
    public boolean insert(Hotels hotels) {
        String sql = "INSERT INTO hotels(hotel_id, destination_id, name, address, price_per_night, stars, image_url) values(?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, hotels.hotel_id);
            stmt.setInt(2, hotels.destination_id);
            stmt.setString(3, hotels.name);
            stmt.setString(4, hotels.address);
            stmt.setDouble(5, hotels.stars);
            stmt.setString(6, hotels.image_url);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Hotels hotels) {
        String sql = "UPDATE hotels SET destination_id = ?, name = ?, address = ?, price_per_night = ?, stars = ?, image_url = ? WHERE hotel_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, hotels.destination_id);
            stmt.setString(2, hotels.name);
            stmt.setString(3, hotels.address);
            stmt.setDouble(4, hotels.price_per_night);
            stmt.setInt(5, hotels.stars);
            stmt.setString(6, hotels.image_url);
            stmt.setInt(7, hotels.hotel_id);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM hotels WHERE hotel_id = ?";
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
    public Hotels find(int id) {
        String sql = "SELECT * FROM `hotels` WHERE hotel_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                int hotel_id = rs.getInt("hotel_id");
                int destination_id = rs.getInt("destination_id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                double price_per_night = rs.getDouble("price_per_night");
                int stars = rs.getInt("stars");
                String image_url = rs.getString("image_url");
                return new Hotels(hotel_id, destination_id, name, address, price_per_night, stars, image_url);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy hotels với hotel_id = " + id);
    }

    @Override
    public List<Hotels> findAll() {
        List<Hotels> hotelsList = new ArrayList<>();
        String sql = "SELECT * FROM `hotels`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ){
            while(rs.next()) {
                int hotel_id = rs.getInt("hotel_id");
                int destination_id = rs.getInt("destination_id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                double price_per_night = rs.getDouble("price_per_night");
                int stars = rs.getInt("stars");
                String image_url = rs.getString("image_url");
                hotelsList.add(new Hotels(hotel_id, destination_id, name, address, price_per_night, stars, image_url));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return hotelsList;
    }

    @Override
    public List<Hotels> findByDestination(int destinationId) {
        List<Hotels> hotelsList = new ArrayList<>();
        String sql = "SELECT * FROM `hotels` WHERE destination_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, destinationId);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                int hotel_id = rs.getInt("hotel_id");
                int destination_id = rs.getInt("destination_id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                double price_per_night = rs.getDouble("price_per_night");
                int stars = rs.getInt("stars");
                String image_url = rs.getString("image_url");
                hotelsList.add(new Hotels(hotel_id, destination_id, name, address, price_per_night, stars, image_url));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return hotelsList;
    }
}
