package toan.dev.data.dao;


import toan.dev.data.model.Tourguideassign;

import java.util.List;

public interface TourguideassignDao {
    public boolean insert(Tourguideassign tourguideassign);
    public boolean update(Tourguideassign tourguideassign);
    public boolean delete(int id);
    public Tourguideassign find(int id);
    public List<Tourguideassign> findAll();
}
