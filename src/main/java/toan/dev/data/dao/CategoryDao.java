package toan.dev.data.dao;


import toan.dev.data.model.Category;

import java.util.List;

public interface CategoryDao {
    public boolean insert(Category category);
    public boolean update(Category category);
    public boolean delete(int id);
    public Category find(int id);
    public List<Category> findAll();
}
