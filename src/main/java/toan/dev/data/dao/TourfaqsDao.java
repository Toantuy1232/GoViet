package toan.dev.data.dao;


import toan.dev.data.model.Tourfaqs;

import java.util.List;

public interface TourfaqsDao {
    public boolean insert(Tourfaqs tourfaqs);
    public boolean update(Tourfaqs tourfaqs);
    public boolean delete(int id);
    public Tourfaqs find(int id);
    public List<Tourfaqs> findAll();
}
