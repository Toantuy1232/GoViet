package toan.dev.data.dao;

import toan.dev.data.model.Tourguides;

import java.util.List;

public interface TourguidersDao {
    public boolean insert(Tourguides tourguides);
    public boolean update(Tourguides tourguides);
    public boolean delete(int id);
    public Tourguides find(int id);
    public List<Tourguides> findAll();
}
