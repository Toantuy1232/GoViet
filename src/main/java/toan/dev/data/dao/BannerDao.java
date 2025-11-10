package toan.dev.data.dao;

import toan.dev.data.model.Banner;

import java.util.List;

public interface BannerDao {
    public boolean insert(Banner banner);
    public boolean update(Banner banner);
    public boolean delete(int id);
    public Banner find(int id);
    public List<Banner> findAll();
}
