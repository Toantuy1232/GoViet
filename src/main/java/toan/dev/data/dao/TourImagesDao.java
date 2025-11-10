package toan.dev.data.dao;

import toan.dev.data.model.Tourimages;

import java.util.List;

public interface TourImagesDao {
    public boolean insert(Tourimages tourimages);
    public boolean update(Tourimages tourimages);
    public boolean delete(int id);
    public Tourimages find(int id);
    public List<Tourimages> findAll();
}
