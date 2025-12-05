package toan.dev.data.Impl;

import toan.dev.data.dao.ConsultationDao;
import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.model.Consultation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ConsultationImpl implements ConsultationDao {

    @Override
    public boolean insert(Consultation consultation) {
        String sql = "INSERT INTO consultations(full_name, email, phone, destination, travel_date, " +
                    "number_of_people, budget, message, status, created_at) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, consultation.getFullName());
            stmt.setString(2, consultation.getEmail());
            stmt.setString(3, consultation.getPhone());
            stmt.setString(4, consultation.getDestination());
            stmt.setString(5, consultation.getTravelDate());
            stmt.setInt(6, consultation.getNumberOfPeople());
            stmt.setString(7, consultation.getBudget());
            stmt.setString(8, consultation.getMessage());
            stmt.setString(9, consultation.getStatus());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        consultation.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Consultation consultation) {
        String sql = "UPDATE consultations SET full_name = ?, email = ?, phone = ?, " +
                    "destination = ?, travel_date = ?, number_of_people = ?, budget = ?, " +
                    "message = ?, status = ?, updated_at = NOW() WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, consultation.getFullName());
            stmt.setString(2, consultation.getEmail());
            stmt.setString(3, consultation.getPhone());
            stmt.setString(4, consultation.getDestination());
            stmt.setString(5, consultation.getTravelDate());
            stmt.setInt(6, consultation.getNumberOfPeople());
            stmt.setString(7, consultation.getBudget());
            stmt.setString(8, consultation.getMessage());
            stmt.setString(9, consultation.getStatus());
            stmt.setInt(10, consultation.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM consultations WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Consultation find(int id) {
        String sql = "SELECT * FROM consultations WHERE id = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractConsultation(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Consultation> findAll() {
        List<Consultation> consultations = new ArrayList<>();
        String sql = "SELECT * FROM consultations ORDER BY created_at DESC";
        
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                consultations.add(extractConsultation(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consultations;
    }

    @Override
    public List<Consultation> findByStatus(String status) {
        List<Consultation> consultations = new ArrayList<>();
        String sql = "SELECT * FROM consultations WHERE status = ? ORDER BY created_at DESC";
        
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                consultations.add(extractConsultation(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consultations;
    }

    @Override
    public int countByStatus(String status) {
        String sql = "SELECT COUNT(*) FROM consultations WHERE status = ?";
        try (Connection conn = DatabaseDao.getDriver().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private Consultation extractConsultation(ResultSet rs) throws SQLException {
        return new Consultation(
            rs.getInt("id"),
            rs.getString("full_name"),
            rs.getString("email"),
            rs.getString("phone"),
            rs.getString("destination"),
            rs.getString("travel_date"),
            rs.getInt("number_of_people"),
            rs.getString("budget"),
            rs.getString("message"),
            rs.getString("status"),
            rs.getTimestamp("created_at"),
            rs.getTimestamp("updated_at")
        );
    }
}
