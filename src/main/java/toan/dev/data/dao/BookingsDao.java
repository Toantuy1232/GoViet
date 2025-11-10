package toan.dev.data.dao;


import toan.dev.data.model.Bookings;

import java.util.List;

public interface BookingsDao {
    public boolean insert(Bookings bookings);
    public boolean update(Bookings bookings);
    public boolean delete(int id);
    public Bookings find(int id);
    public List<Bookings> findAll();
}
