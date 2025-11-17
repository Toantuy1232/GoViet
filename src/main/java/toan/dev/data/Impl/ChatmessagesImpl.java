package toan.dev.data.Impl;

import toan.dev.data.DatabaseDao;
import toan.dev.data.dao.ChatmessagesDao;
import toan.dev.data.model.Chatmessages;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChatmessagesImpl implements ChatmessagesDao {
    @Override
    public boolean insert(Chatmessages chatmessages) {
        String sql = "INSERT INTO chat_messages(message_id, sender_id, receiver_id, content, sent_at) values(?,?,?,?,?)";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, chatmessages.message_id);
            stmt.setInt(2, chatmessages.sender_id);
            stmt.setInt(3, chatmessages.receiver_id);
            stmt.setString(4, chatmessages.content);
            stmt.setTimestamp(5, chatmessages.sent_at);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Chatmessages chatmessages) {
        String sql = "UPDATE chat_messages SET sender_id = ?, receiver_id = ?, content = ?, sent_at = ? WHERE message_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, chatmessages.sender_id);
            stmt.setInt(2, chatmessages.receiver_id);
            stmt.setString(3, chatmessages.content);
            stmt.setTimestamp(4, chatmessages.sent_at);
            stmt.setInt(5, chatmessages.message_id);
            stmt.executeUpdate();
            return true;
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM chat_messages WHERE message_id = ?";
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
    public Chatmessages find(int id) {
        String sql = "SELECT * FROM `chat_messages` WHERE message_id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
        ){
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
               int message_id = rs.getInt("message_id");
               int sender_id = rs.getInt("sender_id");
               int receiver_id = rs.getInt("receiver_id");
               String content = rs.getString("content");
               Timestamp sent_at = rs.getTimestamp("sent_at");
               return new Chatmessages(id, message_id, sender_id, receiver_id, content, sent_at);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("Không tìm thấy chat_messages với message_id = " + id);
    }

    @Override
    public List<Chatmessages> findAll() {
        List<Chatmessages> chatmessagesList = new ArrayList<>();
        String sql = "SELECT * FROM `chat_messages`";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()
        ){
            while(rs.next()) {
                int message_id = rs.getInt("message_id");
                int sender_id = rs.getInt("sender_id");
                int receiver_id = rs.getInt("receiver_id");
                String content = rs.getString("content");
                Timestamp sent_at = rs.getTimestamp("sent_at");
                chatmessagesList.add(new Chatmessages(message_id, sender_id, receiver_id, content, sent_at));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return chatmessagesList;
    }
}
