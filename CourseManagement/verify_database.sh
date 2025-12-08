#!/bin/bash
# Database verification script for XAMPP

echo "======================================"
echo "Checking Course Management Database"
echo "======================================"
echo

/opt/lampp/bin/mysql -u root course_management -e "
SELECT 'Tables Created:' AS '';
SHOW TABLES;

SELECT '' AS '';
SELECT 'Data Summary:' AS '';
SELECT 'Admins' AS Type, COUNT(*) AS Count FROM admin
UNION ALL
SELECT 'Teachers', COUNT(*) FROM teacher
UNION ALL
SELECT 'Students', COUNT(*) FROM student
UNION ALL
SELECT 'Courses', COUNT(*) FROM courses
UNION ALL
SELECT 'Enrollments', COUNT(*) FROM enrollments;
"

echo
echo "======================================"
echo "If you see 5 tables and counts above,"
echo "your database is set up correctly!"
echo "======================================"
