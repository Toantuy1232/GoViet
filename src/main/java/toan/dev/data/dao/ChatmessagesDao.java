package toan.dev.data.dao;

import toan.dev.data.model.Chatmessages;

import java.util.List;

public interface ChatmessagesDao {
    public boolean insert(Chatmessages chatmessages);
    public boolean update(Chatmessages chatmessages);
    public boolean delete(int id);
    public Chatmessages find(int id);
    public List<Chatmessages> findAll();
}
