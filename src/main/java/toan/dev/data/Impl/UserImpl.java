package toan.dev.data.Impl;

import org.mindrot.jbcrypt.BCrypt;
import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.UsersDao;
import toan.dev.data.model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserImpl implements UsersDao {
    @Override
    public boolean insert(Users users) {
        String sql = "insert into users(user_id, full_name, email, password_hash, phone, avatar_url, role, created_at) values(?,?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
        stmt.setInt(1, users.user_id);
        stmt.setString(2, users.fullname);
        stmt.setString(3, users.email);
        stmt.setString(4, users.password);
        stmt.setString(5, users.phone);
        stmt.setString(6, users.avatar_url);
        stmt.setString(7, users.role);
        stmt.setTimestamp(8, users.created_at);
        stmt.executeUpdate();
        return true;

        }catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Users users) {
        String sql = "update users set full_name = ?, email = ?, password_hash = ?, phone = ?, avatar_url = ?, role = ?, created_at where user_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, users.fullname);
            stmt.setString(2, users.email);
            stmt.setString(3, users.password);
            stmt.setString(4, users.phone);
            stmt.setString(5, users.avatar_url);
            stmt.setString(6, users.role);
            stmt.setTimestamp(7, users.created_at);
            stmt.setInt(8, users.user_id);

            int rows = stmt.executeUpdate();
            return rows > 0;

        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
         ){
            stmt.setInt(1, id);
            int rows = stmt.executeUpdate();
            return rows > 0;
        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Users find(int id) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, Integer.parseInt(String.valueOf(id)));
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int userId = rs.getInt("user_id");
                    String full_name = rs.getString("full_name");
                    String email = rs.getString("email");
                    String password_hash = rs.getString("password_hash");
                    String phone = rs.getString("phone");
                    String avatar_url = rs.getString("avatar_url");
                    String role = rs.getString("role");
                    Timestamp created_at = rs.getTimestamp("created_at");
                    return new Users(userId,full_name, email, password_hash, phone, avatar_url, role, created_at);
                }
            }

        }catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy category với id = " + id);
    }

    @Override
    public Users find(String email, String password_hash) {
        Users users = null;
        String sql = "SELECT * FROM `users` WHERE email = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, email);
            try(ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String hashedPassword = rs.getString("password_hash");
                    if(BCrypt.checkpw(password_hash, hashedPassword)) {
                        users = new Users(
                                rs.getInt("user_id"),
                                rs.getString("full_name"),
                                rs.getString("email"),
                                hashedPassword,
                                rs.getString("phone"),
                                rs.getString("avatar_url"),
                                rs.getString("role"),
                                rs.getTimestamp("created_at")
                        );
                    }
                }
            }

        }catch(SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<Users> findAll() {
        List<Users> usersList = new ArrayList<>();
        String sql = "SELECT * FROM `users`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String full_name = rs.getString("full_name");
                String email = rs.getString("email");
                String password_hash = rs.getString("password_hash");
                String phone = rs.getString("phone");
                String avatar_url = rs.getString("avatar_url");
                String role = rs.getString("role");
                Timestamp created_at = rs.getTimestamp("created_at");
                usersList.add(new Users(userId, full_name, email, password_hash, phone, avatar_url, role, created_at));
            }

        }catch(SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }
}
