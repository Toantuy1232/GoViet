package toan.dev.data.dao;

import toan.dev.data.model.Wishlists;

import java.util.List;

public interface WishlistsDao {
    public boolean insert(Wishlists wishlists);
    public boolean update(Wishlists wishlists);
    public boolean delete(int id);
    public Wishlists find(int id);
    public List<Wishlists> findAll();
}
