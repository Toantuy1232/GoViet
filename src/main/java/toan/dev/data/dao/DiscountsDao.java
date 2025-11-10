package toan.dev.data.dao;


import toan.dev.data.model.Discounts;

import java.util.List;

public interface DiscountsDao {
    public boolean insert(Discounts discounts);
    public boolean update(Discounts discounts);
    public boolean delete(int id);
    public Discounts find(int id);
    public List<Discounts> findAll();
}
