package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.BlogpostsDao;
import toan.dev.data.model.Blogposts;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogpostsImpl implements BlogpostsDao {
    @Override
    public boolean insert(Blogposts blogposts) {
        String sql = "insert into blog_posts(post_id, author_id, title, content,cover_image, created_at) values(?,?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, blogposts.post_id);
            stmt.setInt(2, blogposts.author_id);
            stmt.setString(3, blogposts.title);
            stmt.setString(4, blogposts.content);
            stmt.setString(5, blogposts.cover_image);
            stmt.setTimestamp(6, blogposts.created_at);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Blogposts blogposts) {
        String sql = "UPDATE blog_posts SET author_id = ?, title = ?, content = ?, cover_image = ?, created_at = ? WHERE post_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, blogposts.author_id);
            stmt.setString(2, blogposts.title);
            stmt.setString(3, blogposts.content);
            stmt.setString(4, blogposts.cover_image);
            stmt.setTimestamp(5, blogposts.created_at);
            stmt.executeUpdate();
            return true;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM blog_posts WHERE post_id = ?";
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
    public Blogposts find(int id) {
        String sql = "SELECT * FROM `blog_posts` WHERE post_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()){
                if(rs.next()) {
                    int post_id = rs.getInt("post_id");
                    int author_id = rs.getInt("author_id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String cover_image = rs.getString("cover_image");
                    Timestamp created_at = rs.getTimestamp("created_at");
                    return new Blogposts(id, post_id, author_id, title, content, cover_image, created_at);
                }
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy category với id = " + id);
    }

    @Override
    public List<Blogposts> findAll() {
        List<Blogposts> blogpostsList = new ArrayList<>();
        String sql = "SELECT * FROM `blog_posts`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
        ){
            while (rs.next()) {
                int post_id = rs.getInt("post_id");
                int author_id = rs.getInt("author_id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String cover_image = rs.getString("cover_image");
                Timestamp created_at = rs.getTimestamp("created_at");
                blogpostsList.add(new Blogposts(post_id, author_id, title, content, cover_image, created_at));
            }


        }catch (SQLException e) {
            e.printStackTrace();
        }
        return blogpostsList;
    }
}
