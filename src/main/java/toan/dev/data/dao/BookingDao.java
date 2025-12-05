package toan.dev.data.dao;

import toan.dev.data.model.Booking;
import java.util.List;

public interface BookingDao {
    boolean insert(Booking booking);
    boolean update(Booking booking);
    boolean delete(int id);
    Booking find(int id);
    List<Booking> findAll();
    List<Booking> findByUserId(int userId);
    List<Booking> findByStatus(String status);
}
