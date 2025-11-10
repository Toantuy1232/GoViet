package toan.dev.data.dao;


import toan.dev.data.model.Tourtransport;

import java.util.List;

public interface TourtransportDao {
    public boolean insert(Tourtransport tourtransport);
    public boolean update(Tourtransport tourtransport);
    public boolean delete(int id);
    public Tourtransport find(int id);
    public List<Tourtransport> findAll();
}
