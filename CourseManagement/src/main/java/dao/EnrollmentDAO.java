package dao;

import model.Course;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentDAO {
    public void enroll(int studentId, int courseId) {
        String sql = "INSERT IGNORE INTO enrollments (student_id, course_id) VALUES (?, ?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err
                    .println("Error enrolling student " + studentId + " in course " + courseId + ": " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Course> getCoursesOfStudent(int studentId) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT c.id, c.name, c.description, c.teacher_id FROM courses c JOIN enrollments e ON c.id=e.course_id WHERE e.student_id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Course(rs.getInt("id"), rs.getString("name"), rs.getString("description"),
                            (Integer) rs.getObject("teacher_id")));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting courses for student " + studentId + ": " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getStudentsUsernamesByCourse(int courseId) {
        List<String> list = new ArrayList<>();
        // Updated to use 'student' table instead of 'users'
        String sql = "SELECT s.username FROM student s JOIN enrollments e ON s.id = e.student_id WHERE e.course_id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next())
                    list.add(rs.getString("username"));
            }
        } catch (SQLException e) {
            System.err.println("Error getting students for course: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
}
