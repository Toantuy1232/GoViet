package toan.dev.data.dao;


import toan.dev.data.model.Blogposts;

import java.util.List;

public interface BlogpostsDao {
    public boolean insert(Blogposts blogposts);
    public boolean update(Blogposts blogposts);
    public boolean delete(int id);
    public Blogposts find(int id);
    public List<Blogposts> findAll();
}
