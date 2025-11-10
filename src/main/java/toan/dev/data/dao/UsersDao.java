package toan.dev.data.dao;

import toan.dev.data.model.Users;

import java.util.List;

public interface UsersDao {
    public boolean insert(Users users);
    public boolean update(Users users);
    public boolean delete(int id);
    public Users find(int id);
    public List<Users> findAll();
}
