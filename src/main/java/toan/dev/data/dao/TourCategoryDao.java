package toan.dev.data.dao;

import toan.dev.data.model.TourCategory;

import java.util.List;

public interface TourCategoryDao {
    public boolean insert(TourCategory tourCategory);
    public boolean update(TourCategory tourCategory);
    public boolean delete(int id);
    public TourCategory find(int id);
    public List<TourCategory> findAll();
}
