package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.CategoryGalleryDao;
import toan.dev.data.model.CategoryGallery;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryGalleryImpl implements CategoryGalleryDao {
    @Override
    public boolean insert(CategoryGallery categoryGallery) {
        String sql = "INSERT INTO category_gallery(category_id, image_url, created_at) VALUES(?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, categoryGallery.getCategory_id());
            stmt.setString(2, categoryGallery.getImage_url());
            stmt.setTimestamp(3, categoryGallery.getCreated_at());
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(CategoryGallery categoryGallery) {
        String sql = "UPDATE category_gallery SET category_id = ?, image_url = ?, created_at = ? WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, categoryGallery.getCategory_id());
            stmt.setString(2, categoryGallery.getImage_url());
            stmt.setTimestamp(3, categoryGallery.getCreated_at());
            stmt.setInt(4, categoryGallery.getId());
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM category_gallery WHERE id = ?";
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
    public CategoryGallery find(int id) {
        String sql = "SELECT * FROM `category_gallery` WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()){
               if(rs.next()) {
                   int category_id = rs.getInt("category_id");
                   String image_url = rs.getString("image_url");
                   Timestamp created_at = rs.getTimestamp("created_at");
                   return new CategoryGallery(id, category_id, image_url, created_at);
               }
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CategoryGallery> findAll() {
        List<CategoryGallery> categoryGalleryList = new ArrayList<>();
        String sql = "SELECT * FROM `category_gallery`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int id = rs.getInt("id");
                int category_id = rs.getInt("category_id");
                String image_url = rs.getString("image_url");
                Timestamp created_at = rs.getTimestamp("created_at");
                categoryGalleryList.add(new CategoryGallery(id, category_id, image_url, created_at));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryGalleryList;
    }
}
