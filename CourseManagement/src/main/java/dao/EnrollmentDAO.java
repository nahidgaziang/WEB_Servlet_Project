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
        String sql = "SELECT c.id, c.course_code, c.name, c.description, c.teacher_id, t.name AS teacher_name " +
                "FROM courses c " +
                "INNER JOIN enrollments e ON c.id = e.course_id " +
                "LEFT JOIN teacher t ON c.teacher_id = t.id " +
                "WHERE e.student_id = ? ORDER BY c.course_code";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course(
                            rs.getInt("id"),
                            rs.getString("course_code"),
                            rs.getString("name"),
                            rs.getString("description"),
                            (Integer) rs.getObject("teacher_id"));
                    course.setTeacherName(rs.getString("teacher_name"));
                    list.add(course);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting courses for student " + studentId + ": " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Get student usernames for a course (legacy method)
     */
    public List<String> getStudentsUsernamesByCourse(int courseId) {
        List<String> list = new ArrayList<>();
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

    /**
     * Get student details (name and registration number) for a course
     * 
     * @param courseId Course ID
     * @return List of String arrays [name, registration_no]
     */
    public List<String[]> getStudentDetailsByCourse(int courseId) {
        List<String[]> list = new ArrayList<>();
        String sql = "SELECT s.name, s.registration_no FROM student s " +
                "JOIN enrollments e ON s.id = e.student_id WHERE e.course_id = ? ORDER BY s.name";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String[] student = new String[2];
                    student[0] = rs.getString("name");
                    student[1] = rs.getString("registration_no");
                    list.add(student);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting student details for course: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
}
