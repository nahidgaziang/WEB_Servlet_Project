package dao;

import model.User;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    /**
     * Authenticates user by checking admin, teacher, and student tables
     * 
     * @param username Username to authenticate
     * @param password Password to verify
     * @return User object with role, or null if authentication fails
     */
    public User authenticate(String username, String password) {
        // Try admin table first
        User admin = authenticateFromTable("admin", username, password, "admin");
        if (admin != null)
            return admin;

        // Try teacher table
        User teacher = authenticateFromTable("teacher", username, password, "teacher");
        if (teacher != null)
            return teacher;

        // Try student table
        User student = authenticateFromTable("student", username, password, "student");
        if (student != null)
            return student;

        // No match found
        return null;
    }

    /**
     * Authenticates user with specific role
     * 
     * @param username Username to authenticate
     * @param password Password to verify
     * @param role     Role to authenticate as (admin, teacher, or student)
     * @return User object if credentials and role match, null otherwise
     */
    public User authenticateWithRole(String username, String password, String role) {
        return authenticateFromTable(role, username, password, role);
    }

    /**
     * Registers a new user (teacher or student only)
     * 
     * @param username Username
     * @param password Password
     * @param name     Full name
     * @param email    Email address
     * @param role     Role (teacher or student)
     * @return true if registration successful, false otherwise
     */
    public boolean registerUser(String username, String password, String name, String email, String role) {
        // Only allow teacher and student registration
        if (!"teacher".equals(role) && !"student".equals(role)) {
            return false;
        }

        // Check if username already exists
        if (usernameExists(username)) {
            return false;
        }

        String sql = "INSERT INTO " + role + " (username, password, name) VALUES (?, ?, ?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.err.println("Error registering user: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Check if username already exists in any table
     * 
     * @param username Username to check
     * @return true if username exists, false otherwise
     */
    private boolean usernameExists(String username) {
        String[] tables = { "admin", "teacher", "student" };
        for (String table : tables) {
            String sql = "SELECT id FROM " + table + " WHERE username = ?";
            try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
                ps.setString(1, username);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return true;
                    }
                }
            } catch (Exception e) {
                System.err.println("Error checking username: " + e.getMessage());
            }
        }
        return false;
    }

    /**
     * Helper method to authenticate from a specific table
     * 
     * @param tableName Name of the table (admin, teacher, or student)
     * @param username  Username to check
     * @param password  Password to verify
     * @param role      Role to assign
     * @return User object or null
     */
    private User authenticateFromTable(String tableName, String username, String password, String role) {
        String sql = "SELECT id, username, password, name FROM " + tableName + " WHERE username=? AND password=?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("name"),
                            role);
                }
            }
        } catch (Exception e) {
            System.err.println("Error authenticating from " + tableName + " table: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
