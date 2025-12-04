package toan.dev.data.dao;

import toan.dev.data.model.ChatMessage;
import java.util.List;

public interface ChatMessageDao {
    boolean insert(ChatMessage message);
    boolean update(ChatMessage message);
    boolean delete(int id);
    ChatMessage find(int id);
    List<ChatMessage> findAll();
    List<ChatMessage> findByUserId(int userId);
    List<ChatMessage> findConversation(int userId1, int userId2);
    boolean markAsRead(int messageId);
    int countUnreadMessages(int userId);
}
