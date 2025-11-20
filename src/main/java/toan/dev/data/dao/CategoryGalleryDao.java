package toan.dev.data.dao;


import toan.dev.data.model.CategoryGallery;

import java.util.List;

public interface CategoryGalleryDao {
    public boolean insert(CategoryGallery categoryGallery);
    public boolean update(CategoryGallery categoryGallery);
    public boolean delete(int id);
    public CategoryGallery find(int id);
    public List<CategoryGallery> findAll();
}
