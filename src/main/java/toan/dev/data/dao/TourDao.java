package toan.dev.data.dao;


import toan.dev.data.model.Tours;

import java.util.List;

public interface TourDao {
    public boolean insert(Tours tours);
    public boolean update(Tours tours);
    public boolean delete(int id);
    public Tours find(int id);
    public List<Tours> findAll();
}
