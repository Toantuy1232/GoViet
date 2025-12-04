package toan.dev.data.Impl;

import toan.dev.data.dao.ChatMessageDao;
import toan.dev.data.driver.MySQLDriver;
import toan.dev.data.model.ChatMessage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChatMessageDaoImpl implements ChatMessageDao {

    @Override
    public boolean insert(ChatMessage message) {
        String sql = "INSERT INTO chat_messages (sender_id, receiver_id, content, sent_at) VALUES (?, ?, ?, NOW())";
        try (Connection conn = MySQLDriver.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, message.getSenderId());
            stmt.setInt(2, message.getReceiverId());
            stmt.setString(3, message.getContent());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<ChatMessage> findByUserId(int userId) {
        List<ChatMessage> messages = new ArrayList<>();
        String sql = "SELECT * FROM chat_messages WHERE sender_id = ? OR receiver_id = ? ORDER BY sent_at DESC";
        
        try (Connection conn = MySQLDriver.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            stmt.setInt(2, userId);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(mapResultSetToMessage(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    @Override
    public List<ChatMessage> findConversation(int userId1, int userId2) {
        List<ChatMessage> messages = new ArrayList<>();
        String sql = "SELECT * FROM chat_messages WHERE " +
                    "(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?) " +
                    "ORDER BY sent_at ASC";
        
        try (Connection conn = MySQLDriver.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId1);
            stmt.setInt(2, userId2);
            stmt.setInt(3, userId2);
            stmt.setInt(4, userId1);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(mapResultSetToMessage(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    @Override
    public boolean update(ChatMessage message) {
        String sql = "UPDATE chat_messages SET sender_id = ?, receiver_id = ?, content = ? WHERE message_id = ?";
        try (Connection conn = MySQLDriver.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, message.getSenderId());
            stmt.setInt(2, message.getReceiverId());
            stmt.setString(3, message.getContent());
            stmt.setInt(4, message.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM chat_messages WHERE message_id = ?";
        try (Connection conn = MySQLDriver.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ChatMessage find(int id) {
        String sql = "SELECT * FROM chat_messages WHERE message_id = ?";
        try (Connection conn = MySQLDriver.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToMessage(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<ChatMessage> findAll() {
        List<ChatMessage> messages = new ArrayList<>();
        String sql = "SELECT * FROM chat_messages ORDER BY sent_at DESC";
        
        try (Connection conn = MySQLDriver.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                messages.add(mapResultSetToMessage(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    @Override
    public boolean markAsRead(int messageId) {
        // is_read column doesn't exist in database, skip this functionality
        return true;
    }

    @Override
    public int countUnreadMessages(int userId) {
        // is_read column doesn't exist in database, return 0
        return 0;
    }

    private ChatMessage mapResultSetToMessage(ResultSet rs) throws SQLException {
        ChatMessage message = new ChatMessage();
        message.setId(rs.getInt("message_id"));
        message.setSenderId(rs.getInt("sender_id"));
        message.setReceiverId(rs.getInt("receiver_id"));
        message.setContent(rs.getString("content"));
        message.setSentAt(rs.getTimestamp("sent_at"));
        message.setRead(false); // Default to false since column doesn't exist
        return message;
    }
}
