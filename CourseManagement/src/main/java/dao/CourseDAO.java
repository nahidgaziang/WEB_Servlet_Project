package dao;

import model.Course;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    public void addCourse(String name, String description, Integer teacherId) {
        String sql = "INSERT INTO courses (name, description, teacher_id) VALUES (?, ?, ?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            if (teacherId == null)
                ps.setNull(3, Types.INTEGER);
            else
                ps.setInt(3, teacherId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error adding course: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Course> listAll() {
        List<Course> list = new ArrayList<>();
        // Updated to use 'teacher' table instead of 'users'
        String sql = "SELECT c.id, c.name, c.description, c.teacher_id, t.name AS teacher_name FROM courses c LEFT JOIN teacher t ON c.teacher_id=t.id";
        try (Connection c = DBUtil.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Course co = new Course(rs.getInt("id"), rs.getString("name"), rs.getString("description"),
                        (Integer) rs.getObject("teacher_id"));
                co.setTeacherName(rs.getString("teacher_name"));
                list.add(co);
            }
        } catch (SQLException e) {
            System.err.println("Error listing all courses: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public List<Course> getByTeacher(int teacherId) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT id, name, description FROM courses WHERE teacher_id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, teacherId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Course(rs.getInt("id"), rs.getString("name"), rs.getString("description"), teacherId));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting courses for teacher " + teacherId + ": " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public void assignTeacher(int courseId, Integer teacherId) {
        String sql = "UPDATE courses SET teacher_id = ? WHERE id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            if (teacherId == null)
                ps.setNull(1, Types.INTEGER);
            else
                ps.setInt(1, teacherId);
            ps.setInt(2, courseId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err
                    .println("Error assigning teacher " + teacherId + " to course " + courseId + ": " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Delete a course by ID
     * 
     * @param courseId Course ID to delete
     */
    public void deleteCourse(int courseId) {
        String sql = "DELETE FROM courses WHERE id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error deleting course " + courseId + ": " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Get a single course by ID
     * 
     * @param courseId Course ID
     * @return Course object or null if not found
     */
    public Course getCourseById(int courseId) {
        String sql = "SELECT c.id, c.name, c.description, c.teacher_id, t.name AS teacher_name " +
                "FROM courses c LEFT JOIN teacher t ON c.teacher_id=t.id WHERE c.id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Course course = new Course(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            (Integer) rs.getObject("teacher_id"));
                    course.setTeacherName(rs.getString("teacher_name"));
                    return course;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting course " + courseId + ": " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Update a course's name, description, and teacher
     * 
     * @param courseId    Course ID to update
     * @param name        New course name
     * @param description New course description
     * @param teacherId   New teacher ID (can be null)
     */
    public void updateCourse(int courseId, String name, String description, Integer teacherId) {
        String sql = "UPDATE courses SET name = ?, description = ?, teacher_id = ? WHERE id = ?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            if (teacherId == null)
                ps.setNull(3, Types.INTEGER);
            else
                ps.setInt(3, teacherId);
            ps.setInt(4, courseId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error updating course " + courseId + ": " + e.getMessage());
            e.printStackTrace();
        }
    }
}
