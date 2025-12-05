package toan.dev.data.dao;

import toan.dev.data.model.Consultation;
import java.util.List;

public interface ConsultationDao {
    boolean insert(Consultation consultation);
    boolean update(Consultation consultation);
    boolean delete(int id);
    Consultation find(int id);
    List<Consultation> findAll();
    List<Consultation> findByStatus(String status);
    int countByStatus(String status);
}
