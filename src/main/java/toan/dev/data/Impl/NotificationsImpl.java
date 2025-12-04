package toan.dev.data.Impl;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.NotificationsDao;
import toan.dev.data.model.Notifications;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationsImpl implements NotificationsDao {
    @Override
    public boolean insert(Notifications notifications) {
        String sql = "INSERT INTO notifications(notification_id, user_id, title, message, is_read, created_at) values(?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, notifications.notification_id);
            stmt.setInt(2, notifications.user_id);
            stmt.setString(3, notifications.title);
            stmt.setString(4, notifications.message);
            stmt.setBoolean(5, notifications.is_read);
            stmt.setTimestamp(6, notifications.created_at);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Notifications notifications) {
        String sql = "UPDATE notifications SET user_id = ?, title = ?, message = ?, is_read = ?, created_at = ? where notification_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, notifications.user_id);
            stmt.setString(2, notifications.title);
            stmt.setString(3, notifications.message);
            stmt.setBoolean(4, notifications.is_read);
            stmt.setTimestamp(5, notifications.created_at);
            stmt.setInt(6, notifications.notification_id);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM notifications where notification_id = ?";
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
    public Notifications find(int id) {
        String sql = "SELECT * FROM `notifications` WHERE notification_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                int notification_id = rs.getInt("notification_id");
                int user_id = rs.getInt("user_id");
                String title = rs.getString("title");
                String message = rs.getString("message");
                Boolean is_read = rs.getBoolean("is_read");
                Timestamp created_at = rs.getTimestamp("created_at");
                return new Notifications(notification_id, user_id, title, message, is_read, created_at);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy notifications với notification_id = " + id);
    }

    @Override
    public List<Notifications> findAll() {
        List<Notifications> notificationsList = new ArrayList<>();
        String sql = "SELECT * FROM `notifications`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ){
            while(rs.next()) {
                int notification_id = rs.getInt("notification_id");
                int user_id = rs.getInt("user_id");
                String title = rs.getString("title");
                String message = rs.getString("message");
                Boolean is_read = rs.getBoolean("is_read");
                Timestamp created_at = rs.getTimestamp("created_at");
                notificationsList.add(new Notifications(notification_id, user_id, title, message, is_read, created_at));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return notificationsList;
    }

    @Override
    public List<Notifications> findByUser(int userId) {
        List<Notifications> notificationsList = new ArrayList<>();
        String sql = "SELECT * FROM `notifications` WHERE user_id = ? ORDER BY created_at DESC";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                int notification_id = rs.getInt("notification_id");
                int user_id = rs.getInt("user_id");
                String title = rs.getString("title");
                String message = rs.getString("message");
                Boolean is_read = rs.getBoolean("is_read");
                Timestamp created_at = rs.getTimestamp("created_at");
                notificationsList.add(new Notifications(notification_id, user_id, title, message, is_read, created_at));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return notificationsList;
    }
}
