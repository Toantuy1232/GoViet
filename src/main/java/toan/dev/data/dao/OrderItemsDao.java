package toan.dev.data.dao;


import toan.dev.data.model.OrderItems;

import java.util.List;

public interface OrderItemsDao {
    public boolean insert(OrderItems orderItems);
    public boolean update(OrderItems orderItems);
    public boolean delete(int id);
    public OrderItems find(int id);
    public List<OrderItems> findAll();
}
