package toan.dev.data.dao;

import toan.dev.data.model.Tourdiscounts;

import java.util.List;

public interface TourdiscountsDao {
    public boolean insert(Tourdiscounts tourdiscounts);
    public boolean update(Tourdiscounts tourdiscounts);
    public boolean delete(int id);
    public Tourdiscounts find(int id);
    public List<Tourdiscounts> findAll();
}
