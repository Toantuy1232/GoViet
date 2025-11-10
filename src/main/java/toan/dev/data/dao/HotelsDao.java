package toan.dev.data.dao;


import toan.dev.data.model.Hotels;

import java.util.List;

public interface HotelsDao {
    public boolean insert(Hotels hotels);
    public boolean update(Hotels hotels);
    public boolean delete(int id);
    public Hotels find(int id);
    public List<Hotels> findAll();
}
