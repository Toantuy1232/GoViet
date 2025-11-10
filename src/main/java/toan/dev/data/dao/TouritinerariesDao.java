package toan.dev.data.dao;

import toan.dev.data.model.Touritineraries;

import java.util.List;

public interface TouritinerariesDao {
    public boolean insert(Touritineraries touritineraries);
    public boolean update(Touritineraries touritineraries);
    public boolean delete(int id);
    public Touritineraries find(int id);
    public List<Touritineraries> findAll();
}
