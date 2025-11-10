package toan.dev.data.dao;


import toan.dev.data.model.Destinations;

import java.util.List;

public interface DestinationsDao {
    public boolean insert(Destinations destinations);
    public boolean update(Destinations destinations);
    public boolean delete(int id);
    public Destinations find(int id);
    public List<Destinations> findAll();
}
