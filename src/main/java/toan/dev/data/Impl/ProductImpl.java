package toan.dev.data.Impl;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.ProductsDao;
import toan.dev.data.model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductImpl implements ProductsDao {
    @Override
    public boolean insert(Products products) {
        String sql = "INSERT INTO products(name, sku, description, price, price_old, stock, image_url, category_id, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, products.name);
            stmt.setString(2, products.sku);
            stmt.setString(3, products.description);
            stmt.setDouble(4, products.price);
            stmt.setDouble(5, products.price_old);
            stmt.setInt(6, products.stock);
            stmt.setString(7, products.image_url);
            stmt.setInt(8, products.category_id);
            stmt.setTimestamp(9, products.created_at);
            stmt.setTimestamp(10, products.updated_at);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Products products) {
        String sql = "UPDATE products SET name = ?, sku = ?, description = ?, price = ?, price_old = ?, stock = ?, image_url = ?, category_id  = ?, created_at = ?, updated_at = ? WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setString(1, products.name);
            stmt.setString(2, products.sku);
            stmt.setString(3, products.description);
            stmt.setDouble(4, products.price);
            stmt.setDouble(5, products.price_old);
            stmt.setInt(6, products.stock);
            stmt.setString(7, products.image_url);
            stmt.setInt(8, products.category_id);
            stmt.setTimestamp(9, products.created_at);
            stmt.setTimestamp(10, products.updated_at);
            stmt.setInt(11, products.id);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
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
    public Products find(int id) {
        String sql = "SELECT * FROM `products` WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    String name = rs.getString("name");
                    String sku = rs.getString("sku");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    double price_old = rs.getDouble("price_old");
                    int stock = rs.getInt("stock");
                    String image_url = rs.getString("image_url");
                    int category_id = rs.getInt("category_id");
                    Timestamp created_at = rs.getTimestamp("created_at");
                    Timestamp updated_at = rs.getTimestamp("updated_at");
                    return new Products(id, name, sku, description, price, price_old, stock, image_url, category_id, created_at, updated_at);
                }
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy products với id = " + id);
    }

    @Override
    public List<Products> findAll() {
        List<Products> productsList = new ArrayList<>();
        String sql = "SELECT * FROM `products`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String sku = rs.getString("sku");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                double price_old = rs.getDouble("price_old");
                int stock = rs.getInt("stock");
                String image_url = rs.getString("image_url");
                int category_id = rs.getInt("category_id");
                Timestamp created_at = rs.getTimestamp("created_at");
                Timestamp updated_at = rs.getTimestamp("updated_at");
                productsList.add(new Products(id, name, sku, description, price, price_old, stock, image_url, category_id, created_at, updated_at));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }

    @Override
    public List<Products> findAllByCategoryId(int categoryId) {
        List<Products> productsList = new ArrayList<>();
        String sql = "SELECT * FROM `products` WHERE category_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()){
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String sku = rs.getString("sku");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    double price_old = rs.getDouble("price_old");
                    int stock = rs.getInt("stock");
                    String image_url = rs.getString("image_url");
                    int category_id = rs.getInt("category_id");
                    Timestamp created_at = rs.getTimestamp("created_at");
                    Timestamp updated_at = rs.getTimestamp("updated_at");
                    productsList.add(new Products(id, name, sku, description, price, price_old, stock, image_url, category_id, created_at, updated_at));
                }
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }
}
