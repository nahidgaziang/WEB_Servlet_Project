DROP DATABASE IF EXISTS course_management;
CREATE DATABASE course_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE course_management;

-- Create admin table
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create teacher table
CREATE TABLE teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create student table
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create courses table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    teacher_id INT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create enrollments table
CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_enrollment (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample data
INSERT INTO admin (username, password, name) VALUES
('admin', 'admin123', 'System Administrator'),
('superadmin', 'super123', 'Super Admin');

INSERT INTO teacher (username, password, name) VALUES
('teacher1', 'teacher123', 'Dr. John Smith'),
('teacher2', 'teacher123', 'Prof. Sarah Johnson'),
('teacher3', 'teacher123', 'Dr. Michael Brown');

INSERT INTO student (username, password, name) VALUES
('student1', 'student123', 'Alice Wilson'),
('student2', 'student123', 'Bob Martinez'),
('student3', 'student123', 'Charlie Davis'),
('student4', 'student123', 'Diana Garcia'),
('student5', 'student123', 'Ethan Rodriguez');

INSERT INTO courses (name, description, teacher_id) VALUES
('Introduction to Programming', 'Learn the basics of programming using Java', 1),
('Data Structures and Algorithms', 'Advanced data structures and algorithm analysis', 2),
('Web Development', 'Full-stack web development with modern technologies', 1),
('Database Management Systems', 'Relational databases and SQL', 3),
('Software Engineering', 'Software development methodologies and best practices', 2);

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 4),
(3, 2), (3, 3), (3, 5),
(4, 1), (4, 3), (4, 4),
(5, 2), (5, 5);
