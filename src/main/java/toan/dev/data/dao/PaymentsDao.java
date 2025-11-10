package toan.dev.data.dao;


import toan.dev.data.model.Payments;

import java.util.List;

public interface PaymentsDao {
    public boolean insert(Payments payments);
    public boolean update(Payments payments);
    public boolean delete(int id);
    public Payments find(int id);
    public List<Payments> findAll();
}
