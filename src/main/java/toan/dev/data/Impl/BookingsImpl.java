package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.BookingsDao;
import toan.dev.data.model.Bookings;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingsImpl implements BookingsDao {
    @Override
    public boolean insert(Bookings bookings) {
        String sql = "insert into bookings(booking_id, user_id, tour_id, booking_date, number_of_people, total_price, payment_status) values(?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, bookings.booking_id);
            stmt.setInt(2, bookings.user_id);
            stmt.setInt(3, bookings.tour_id);
            stmt.setTimestamp(4, bookings.booking_date);
            stmt.setInt(5, bookings.number_of_people);
            stmt.setDouble(6, bookings.total_price);
            stmt.setString(7, bookings.payment_status);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Bookings bookings) {
        String sql = "update bookings set user_id = ?, tour_id = ?, booking_date = ?, number_of_people = ?, total_price = ?, payment_status = ? where booking_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, bookings.user_id);
            stmt.setInt(2, bookings.tour_id);
            stmt.setTimestamp(3, bookings.booking_date);
            stmt.setInt(4, bookings.number_of_people);
            stmt.setDouble(5, bookings.total_price);
            stmt.setString(6, bookings.payment_status);
            stmt.setInt(7, bookings.booking_id);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM bookings where booking_id = ?";
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
    public Bookings find(int id) {
        String sql = "SELECT * FROM `bookings` where booking_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Bookings(
                        rs.getInt("booking_id"),
                        rs.getInt("user_id"),
                        rs.getInt("tour_id"),
                        rs.getTimestamp("booking_date"),
                        rs.getInt("number_of_people"),
                        rs.getDouble("total_price"),
                        rs.getString("payment_status")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Bookings> findAll() {
        List<Bookings> bookingsList = new ArrayList<>();
        String sql = "SELECT * FROM `bookings`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                Bookings bookings = new Bookings(
                        rs.getInt("booking_id"),
                        rs.getInt("user_id"),
                        rs.getInt("tour_id"),
                        rs.getTimestamp("booking_date"),
                        rs.getInt("number_of_people"),
                        rs.getDouble("total_price"),
                        rs.getString("payment_status")
                );
                bookingsList.add(bookings);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return bookingsList;
    }
}
