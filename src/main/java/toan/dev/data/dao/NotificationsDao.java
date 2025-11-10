package toan.dev.data.dao;


import toan.dev.data.model.Notifications;

import java.util.List;

public interface NotificationsDao {
    public boolean insert(Notifications notifications);
    public boolean update(Notifications notifications);
    public boolean delete(int id);
    public Notifications find(int id);
    public List<Notifications> findAll();
}
