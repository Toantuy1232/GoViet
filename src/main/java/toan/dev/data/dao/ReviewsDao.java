package toan.dev.data.dao;

import toan.dev.data.model.Reviews;

import java.util.List;

public interface ReviewsDao {
    public boolean insert(Reviews reviews);
    public boolean update(Reviews reviews);
    public boolean delete(int id);
    public Reviews find(int id);
    public List<Reviews> findAll();
}
