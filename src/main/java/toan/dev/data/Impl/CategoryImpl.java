package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.CategoryDao;
import toan.dev.data.model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryImpl implements CategoryDao {

    @Override
    public boolean insert(Category category) {
        String sql = "INSERT INTO categories(name, slug, description, parent_id, status, created_at) VAVLUES(?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, category.name);
            stmt.setString(2, category.slug);
            stmt.setString(3, category.description);
            stmt.setBoolean(4, category.status);
            stmt.setTimestamp(5, category.created_at);
            stmt.executeUpdate();
            return true;

        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Category category) {
        String sql = "UPDATE categories SET name = ?, slug = ?, description = ?, parent_id = ?, status = ?, created_at = ? WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, category.name);
            stmt.setString(2, category.slug);
            stmt.setString(3, category.description);
            stmt.setInt(4, category.parent_id);
            stmt.setBoolean(5, category.status);
            stmt.setTimestamp(6, category.created_at);
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
                    String slug = rs.getString("slug");
                    String description = rs.getString("description");
                    int parent_id = rs.getInt("parent_id");
                    boolean status = rs.getBoolean("status");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    return new Category(id, name, slug, description, parent_id, createdAt, status);
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
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String slug = rs.getString("slug");
            String description = rs.getString("description");
            int parent_id = rs.getInt("parent_id");
            boolean status = rs.getBoolean("status");
            Timestamp createdAt = rs.getTimestamp("created_at");
            categoryList.add(new Category(id, name, slug, description, parent_id, status, createdAt));
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }
}
