package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.BannerDao;
import toan.dev.data.model.Banner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BannerImpl implements BannerDao {
    @Override
    public boolean insert(Banner banner) {
        String sql = "INSERT INTO banners(image, title, status) VALUES(?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, banner.image);
            stmt.setString(2, banner.title);
            stmt.setBoolean(3, banner.status);
            stmt.executeUpdate();
            return true;
        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Banner banner) {
        String sql = "UPDATE banners SET image = ?, title = ?, status = ? WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, banner.image);
            stmt.setString(2, banner.title);
            stmt.setBoolean(3, banner.status);
            stmt.executeUpdate();
            return true;
        }catch(SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM banners WHERE id = ?";
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
    public Banner find(int id) {
        String sql = "SELECT * FROM `banners` WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()){
                if(rs.next()) {
                    String image = rs.getString("image");
                    String title = rs.getString("title");
                    boolean status = rs.getBoolean("status");
                    return new Banner(id, image, title, status);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Banner> findAll() {
        List<Banner> banners = new ArrayList<>();
        String sql = "SELECT * FROM `banners`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int id = rs.getInt("id");
                String image = rs.getString("image");
                String title = rs.getString("title");
                boolean status = rs.getBoolean("status");
                banners.add(new Banner(id, image, title, status));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return banners;
    }
}
