package toan.dev.data.dao;

import toan.dev.data.model.Order;
import java.util.List;

public interface OrderDao {
    boolean insert(Order order);
    boolean update(Order order);
    boolean delete(int orderId);
    Order find(int orderId);
    Order findByOrderCode(String orderCode);
    List<Order> findAll();
    List<Order> findByUserId(int userId);
    List<Order> findByStatus(String status);
    boolean updateOrderStatus(int orderId, String status);
    boolean updatePaymentStatus(int orderId, String status);
}
