package toan.dev.data.dao;

import org.mindrot.jbcrypt.BCrypt;
import toan.dev.data.Impl.*;
import toan.dev.data.driver.MySQLDriver;
import toan.dev.data.model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseDao {
    private static DatabaseDao instance;
    private static MySQLDriver driver;
    private CategoryDao categoryDao;
    private ProductsDao productDao;
    private BannerDao bannerDao;
    private BlogpostsDao blogDao;
    private UsersDao usersDao;
    private OrdersDao orderDao;
    private TourDao tourDao;
    private DatabaseDao() {
        categoryDao = new CategoryImpl();
        productDao = new ProductImpl();
        bannerDao = new BannerImpl();
        blogDao = new BlogpostsImpl();
        orderDao = new OrderImpl();
        tourDao = new TourImpl();

        usersDao = new UserImpl() {

            @Override
            public Users find(String email) {
                String sql = "SELECT * FROM `users` WHERE email = ?";
                try (Connection conn = DatabaseDao.getDriver().getConnection();
                     PreparedStatement stmt = conn.prepareStatement(sql)) {

                    stmt.setString(1, email);

                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            int id = rs.getInt("user_id");
                            String hashedPassword = rs.getString("password_hash");
                            String role = rs.getString("role");
                            // Trả về user từ database (bao gồm id)
                            return new Users(id, email, hashedPassword, role);
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return null;
            }

            @Override
            public Users find(int id) {
                String sql = "SELECT * FROM `users` WHERE user_id = ?";
                try (Connection conn = DatabaseDao.getDriver().getConnection();
                     PreparedStatement stmt = conn.prepareStatement(sql)
                ) {
                    stmt.setInt(1, id);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            String email = rs.getString("email");
                            String password = rs.getString("password_hash");
                            String role = rs.getString("role");
                            return new Users(id, email, password, role);
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return null;
            }

            @Override
            public boolean delete(int id) {
                String sql = "DELETE FROM `users` WHERE user_id = ?";
                try (Connection conn = DatabaseDao.getDriver().getConnection();
                     PreparedStatement stmt = conn.prepareStatement(sql)
                ) {
                    stmt.setInt(1, id);
                    int rows = stmt.executeUpdate();
                    return rows > 0;
                } catch (SQLException e) {
                    e.printStackTrace();
                    return false;
                }
            }

            @Override
            public Users find(String email, String password) {
                String sql = "SELECT * FROM `users` WHERE email = ?";
                try (Connection conn = DatabaseDao.getDriver().getConnection();
                     PreparedStatement stmt = conn.prepareStatement(sql)
                ) {
                    stmt.setString(1, email);
                    try (ResultSet rs = stmt.executeQuery()) {
                        while (rs.next()) {
                            String hashedPassword = rs.getString("password_hash");
                            if (BCrypt.checkpw(password, hashedPassword)) {
                                Users user = new Users(
                                        rs.getInt("user_id"),
                                        rs.getString("email"),
                                        hashedPassword,
                                        rs.getString("role")
                                );
                                return user;
                            }
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return null;
            }
        };
        bannerDao = new BannerImpl();
    }

    public static synchronized DatabaseDao getInstance() {
        if (instance == null) {
            instance = new DatabaseDao();
        }
        return instance;
    }

    public static synchronized void init(MySQLDriver d) {
        driver = d;
    }

    public static MySQLDriver getDriver() {
        if (driver == null) {
            driver = MySQLDriver.getInstance();
        }
        return driver;
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public ProductsDao getProductDao() {
        return productDao;
    }

    public UsersDao getUserDao() {
        return usersDao;
    }

    public BannerDao getBannerDao() {
        return bannerDao;
    }
    public BlogpostsDao getBlogDao() {
        return blogDao;
    }

    public OrdersDao getOrderDao() {
        return orderDao;
    }

    public TourDao getTourDao() {
        return tourDao;
    }
}
