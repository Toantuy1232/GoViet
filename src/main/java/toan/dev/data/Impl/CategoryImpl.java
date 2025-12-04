package toan.dev.data.Impl;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.CategoryDao;
import toan.dev.data.model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryImpl implements CategoryDao {

    @Override
    public boolean insert(Category category) {
        String sql = "INSERT INTO categories(name, thumbnail, status, created_at) VALUES(?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, category.name);
            stmt.setString(2, category.thumbnail);
            stmt.setBoolean(3, category.status != null ? category.status : true);
            Timestamp createdAt = category.created_at != null
                    ? category.created_at
                    : new Timestamp(System.currentTimeMillis());
            stmt.setTimestamp(4, createdAt);
            stmt.executeUpdate();
            return true;

        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Category category) {
        String sql = "UPDATE categories SET name = ?, thumbnail = ?, status = ?, created_at = ? WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, category.name);
            stmt.setString(2, category.thumbnail);
            stmt.setBoolean(3, category.status != null ? category.status : true);
            Timestamp createdAt = category.created_at != null
                    ? category.created_at
                    : new Timestamp(System.currentTimeMillis());
            stmt.setTimestamp(4, createdAt);
            stmt.setInt(5, category.id);
            stmt.executeUpdate();
            return true;

        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM categories WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;

        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Category find(int id) {
        String sql = "SELECT * FROM `categories` WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");
                    String thumbnail = rs.getString("thumbnail");
                    boolean status = rs.getBoolean("status");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    return new Category(id, name, thumbnail, createdAt, status);
                }
            }

        }catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy category với id = " + id);
    }

    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM `categories`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String thumbnail = rs.getString("thumbnail");
                boolean status = rs.getBoolean("status");
                Timestamp createdAt = rs.getTimestamp("created_at");
                categoryList.add(new Category(id, name, thumbnail, createdAt, status));
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }
}
