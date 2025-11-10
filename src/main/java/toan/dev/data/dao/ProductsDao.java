package toan.dev.data.dao;


import toan.dev.data.model.Products;

import java.util.List;

public interface ProductsDao {
    public boolean insert(Products products);
    public boolean update(Products products);
    public boolean delete(int id);
    public Products find(int id);
    public List<Products> findAll();
}
