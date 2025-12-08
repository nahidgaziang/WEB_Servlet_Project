package dao;

import model.Teacher;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for Teacher operations
 */
public class TeacherDAO {

    /**
     * Get all teachers from the database
     * 
     * @return List of all teachers with id, name, and username
     */
    public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        String sql = "SELECT id, name, username FROM teacher ORDER BY name";

        try (Connection c = DBUtil.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Teacher teacher = new Teacher(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("username"));
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            System.err.println("Error getting all teachers: " + e.getMessage());
            e.printStackTrace();
        }

        return teachers;
    }
}
