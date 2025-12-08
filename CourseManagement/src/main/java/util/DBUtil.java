package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database connection utility for Course Management System
 * Supports standalone MySQL server
 */
public class DBUtil {
    // ========================================
    // MySQL Configuration
    // ========================================
    // Change these values based on your MySQL setup
    private static final String DB_HOST = "localhost";
    private static final String DB_PORT = "3306";
    private static final String DB_NAME = "course_management";
    private static final String DB_USER = "root"; // Change to your MySQL username
    private static final String DB_PASSWORD = ""; // Change to your MySQL password

    // JDBC URL with connection parameters
    private static final String URL = String.format(
            "jdbc:mysql://%s:%s/%s?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&characterEncoding=UTF-8",
            DB_HOST, DB_PORT, DB_NAME);

    // ========================================
    // Driver Initialization
    // ========================================
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✓ MySQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("✗ MySQL JDBC Driver not found!");
            System.err.println("  Make sure mysql-connector-j JAR is in WEB-INF/lib/");
            e.printStackTrace();
        }
    }

    // ========================================
    // Connection Method
    // ========================================
    /**
     * Establishes and returns a connection to the database
     * 
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);
            return conn;
        } catch (SQLException e) {
            System.err.println("✗ Database connection failed!");
            System.err.println("  Host: " + DB_HOST + ":" + DB_PORT);
            System.err.println("  Database: " + DB_NAME);
            System.err.println("  User: " + DB_USER);
            System.err.println("  Error: " + e.getMessage());
            throw e;
        }
    }

    // ========================================
    // Utility Methods
    // ========================================
    /**
     * Tests database connectivity
     * 
     * @return true if connection successful, false otherwise
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            System.out.println("✓ Database connection test successful!");
            System.out.println("  Connected to: " + DB_NAME + " at " + DB_HOST);
            return true;
        } catch (SQLException e) {
            System.err.println("✗ Database connection test failed!");
            return false;
        }
    }
}
