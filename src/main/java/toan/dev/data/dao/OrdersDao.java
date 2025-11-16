package toan.dev.data.dao;


import toan.dev.data.model.Orders;

import java.util.List;

public interface OrdersDao {
    public boolean insert(Orders orders);
    public boolean update(Orders orders);
    public boolean delete(int id);
    public Orders find(int id);
    public List<Orders> findAll();
    public Orders findByCode(String code);
    public List<Orders> findByUserId(int userId);
}
