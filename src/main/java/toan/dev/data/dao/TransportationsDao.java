package toan.dev.data.dao;


import java.util.List;

public interface TransportationsDao {
    public boolean insert(TransportationsDao transportationsDao);
    public boolean update(TransportationsDao transportationsDao);
    public boolean delete(int id);
    public TransportationsDao find(int id);
    public List<TransportationsDao> findAll();
}
