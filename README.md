# 🎓 Course Management System

A modern, full-featured **Servlet/JSP-based web application** for managing courses, users, and enrollments with a beautiful, smooth UI design.

![Course Management System](https://img.shields.io/badge/Java-Servlet%2FJSP-orange?style=for-the-badge&logo=java)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-purple?style=for-the-badge&logo=bootstrap)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge&logo=mysql)
![License](https://img.shields.io/badge/License-Educational-green?style=for-the-badge)

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Technology Stack](#technology-stack)
- [Requirements](#requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [User Roles](#user-roles)
- [API Documentation](#api-documentation)
- [Design Features](#design-features)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## 🌟 Overview

This **Course Management System** is a comprehensive web application built for educational institutions to manage courses, teachers, and students. It features a modern, smooth light theme UI with animations and a professional design.

### ✨ Key Highlights

- ✅ **Role-based Access Control** (Admin, Teacher, Student)
- ✅ **User Registration System** with role selection
- ✅ **Complete CRUD Operations** for course management
- ✅ **Student Enrollment System** with tracking
- ✅ **Teacher Course Assignment** and student viewing
- ✅ **Modern UI/UX** with smooth animations
- ✅ **Responsive Design** for all devices
- ✅ **Secure Authentication** with session management

---

## 🚀 Features

### For Administrators
- 📊 **Dashboard** with complete course overview
- ➕ **Add Courses** with course code, name, and description
- ✏️ **Edit Courses** - modify course details
- 🗑️ **Delete Courses** with cascade enrollment removal
- 👨‍🏫 **Assign Teachers** to courses
- 📈 **Manage System** - full control over all entities

### For Teachers
- 📚 **View Assigned Courses** - see all courses you teach
- 👥 **View Enrolled Students** - see student names and registration numbers
- 📋 **Track Enrollments** - monitor course participation

### For Students
- 🔍 **Browse Courses** - view all available courses
- ✅ **Enroll in Courses** - one-click registration
- 📖 **My Courses** - view all registered courses with teacher details
- 🎯 **Track Progress** - see enrolled courses

### Bonus Features
- 🔐 **User Registration** - self-service account creation
- 🎨 **Modern Light Theme** - beautiful gradient UI
- 🌊 **Smooth Animations** - professional transitions
- 📱 **Responsive Design** - works on all screen sizes
- 🎭 **Role Selection** on login for enhanced security

---

## 📸 Screenshots

### Login Page
Modern login interface with smooth animations and gradient backgrounds.

### Admin Dashboard
Comprehensive course management with intuitive controls.

### Student Portal
Clean, user-friendly interface for course browsing and enrollment.

### Teacher Portal
Simple course and student management interface.

---

## 🛠️ Technology Stack

### Backend
- **Java** - Core programming language
- **Servlets** - Request handling and business logic
- **JSP** - Dynamic page rendering
- **JDBC** - Database connectivity
- **Session Management** - User authentication

### Frontend
- **HTML5** - Structure
- **CSS3** - Styling with modern features (gradients, animations)
- **Bootstrap 5.3** - Responsive framework
- **Bootstrap Icons** - Visual elements
- **JavaScript** - Dynamic interactions
- **Google Fonts (Inter)** - Modern typography

### Database
- **MySQL 8.0** - Relational database
- **XAMPP** - Development environment

### Server
- **Apache Tomcat 9.0+** - Servlet container

### Development Tools
- **Eclipse IDE** - Java development
- **Git** - Version control

---

## 📦 Requirements

### Software Requirements
- **JDK 11+** (Java Development Kit)
- **Apache Tomcat 9.0+** (or compatible servlet container)
- **MySQL 8.0+** (or XAMPP with MySQL)
- **Eclipse IDE for Enterprise Java** (recommended) or any Java IDE
- **Git** (for version control)

### Hardware Requirements
- **RAM**: 4GB minimum, 8GB recommended
- **Storage**: 500MB free space
- **Processor**: Any modern processor

---

## 📥 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/CourseManagement.git
cd CourseManagement
```

### 2. Start MySQL

**For XAMPP (Linux):**
```bash
sudo /opt/lampp/lampp startmysql
sudo /opt/lampp/lampp startapache  # For PhpMyAdmin (optional)
```

**For standalone MySQL:**
```bash
sudo systemctl start mysql
```

### 3. Setup Database

```bash
cd CourseManagement
/opt/lampp/bin/mysql -u root < database_setup.sql
```

Or using standard MySQL:
```bash
mysql -u root -p < database_setup.sql
```

### 4. Import to Eclipse

1. Open **Eclipse IDE for Enterprise Java**
2. **File** → **Import** → **Existing Projects into Workspace**
3. Browse to `CourseManagement` folder
4. Click **Finish**

### 5. Configure Tomcat in Eclipse

1. **Window** → **Preferences** → **Server** → **Runtime Environments**
2. Click **Add** → Select **Apache Tomcat v9.0**
3. Browse to your Tomcat installation directory
4. Click **Finish**

### 6. Add Server Runtime to Project

1. Right-click project → **Properties**
2. **Java Build Path** → **Libraries** tab
3. **Add Library** → **Server Runtime** → Select Apache Tomcat v9.0
4. Click **Finish**

---

## 🗄️ Database Setup

### Schema Overview

The application uses 5 main tables:

```sql
- admin          (id, username, password, name, created_at)
- teacher        (id, username, password, name, created_at)
- student        (id, username, password, name, registration_no, created_at)
- courses        (id, course_code, name, description, teacher_id, created_at, updated_at)
- enrollments    (id, student_id, course_id, enrolled_at)
```

### Sample Data Included

- **2 Admins** (admin, superadmin)
- **3 Teachers** (A.K.M. Fakhrul Hossain, PMD Fahimul Islam Fahim, Ishtiaque Zahid)
- **3 Students** (Nahid Gazi, Rahat Farabi, Ridoy Bariya)
- **5 Courses** (CS101-CS105)
- **8 Enrollments**

### Database Configuration

Connection details are in `src/main/java/util/DBUtil.java`:

```java
URL: jdbc:mysql://localhost:3306/course_management
Username: root
Password: (empty for XAMPP)
```

---

## ▶️ Running the Application

### Using Eclipse

1. Right-click project → **Run As** → **Run on Server**
2. Select **Apache Tomcat v9.0**
3. Click **Finish**
4. Application opens at: `http://localhost:8080/CourseManagement/`

### Manual Deployment

1. **Build** the project (creates WAR file)
2. Copy WAR to Tomcat's `webapps/` directory
3. Start Tomcat: `./bin/startup.sh` (Linux/Mac) or `bin\startup.bat` (Windows)
4. Access: `http://localhost:8080/CourseManagement/`

---

## 📁 Project Structure

```
CourseManagement/
├── src/main/java/
│   ├── dao/                       # Data Access Objects
│   │   ├── CourseDAO.java         # Course operations
│   │   ├── EnrollmentDAO.java     # Enrollment operations
│   │   ├── TeacherDAO.java        # Teacher operations
│   │   └── UserDAO.java           # Authentication & registration
│   ├── model/                     # Data models
│   │   ├── Course.java
│   │   ├── Teacher.java
│   │   └── User.java
│   ├── servlet/                   # Controllers
│   │   ├── LoginServlet.java      # User login
│   │   ├── RegisterServlet.java   # User registration
│   │   ├── LogoutServlet.java     # Session termination
│   │   ├── AdminAddCourseServlet.java
│   │   ├── AdminUpdateCourseServlet.java
│   │   ├── AdminDeleteCourseServlet.java
│   │   ├── AssignTeacherServlet.java
│   │   ├── StudentRegisterServlet.java
│   │   └── ViewStudentsServlet.java
│   └── util/
│       └── DBUtil.java            # Database connection utility
├── WebContent/
│   ├── index.jsp                  # Login page
│   ├── register.jsp               # User registration
│   ├── admin/
│   │   └── dashboard.jsp          # Admin control panel
│   ├── teacher/
│   │   ├── courses.jsp            # Teacher courses
│   │   └── students.jsp           # Enrolled students
│   ├── student/
│   │   ├── courses.jsp            # Browse courses
│   │   └── registered.jsp         # My courses
│   └── WEB-INF/
│       ├── lib/                   # JAR dependencies
│       │   ├── mysql-connector-j-9.4.0.jar
│       │   └── jstl-1.2.jar
│       └── web.xml                # Deployment descriptor
├── database_setup.sql             # Database schema & sample data
├── fix_database.sh                # Database repair script
├── verify_database.sh             # Database verification
├── .gitignore                     # Git ignore rules
└── README.md                      # This file
```

---

## 👥 User Roles

### Admin
- **Username**: `admin` | **Password**: `admin123`
- **Permissions**: Full system access, course management, teacher assignment

### Teachers
- **Username**: `teacher1` | **Password**: `teacher123` (Dr. A.K.M. Fakhrul Hossain)
- **Username**: `teacher2` | **Password**: `teacher123` (Prof. PMD Fahimul Islam Fahim)
- **Username**: `teacher3` | **Password**: `teacher123` (Dr. Ishtiaque Zahid)
- **Permissions**: View assigned courses, view enrolled students

### Students
- **Username**: `nahid` | **Password**: `123456` (Nahid Gazi - 2022331048)
- **Username**: `rahat` | **Password**: `123456` (Rahat Farabi - 2022331096)
- **Username**: `ridoy` | **Password**: `123456` (Ridoy Bariya - 2022331070)
- **Permissions**: Browse courses, enroll, view registered courses

### New User Registration
- Students and Teachers can register via the **Sign Up** page
- Admins cannot be created through registration (security measure)

---

## 🔌 API Documentation

### Servlet Mappings

| Servlet | URL | Method | Purpose |
|---------|-----|--------|---------|
| LoginServlet | `/login` | POST | User authentication |
| RegisterServlet | `/register` | POST | User registration |
| LogoutServlet | `/logout` | GET | Session termination |
| AdminAddCourseServlet | `/admin/addCourse` | POST | Add new course |
| AdminUpdateCourseServlet | `/admin/updateCourse` | POST | Update course |
| AdminDeleteCourseServlet | `/admin/deleteCourse` | POST | Delete course |
| AssignTeacherServlet | `/admin/assignTeacher` | POST | Assign teacher |
| StudentRegisterServlet | `/student/registerCourse` | POST | Enroll in course |
| ViewStudentsServlet | `/teacher/viewStudents` | GET | View students |

---

## 🎨 Design Features

### Visual Design
- **Modern Light Theme** with gradient backgrounds
- **Smooth Animations** (slide-up, fade-in, hover effects)
- **Floating Background Shapes** for visual interest
- **Professional Typography** using Inter font family
- **Gradient Buttons** with hover lift effects
- **Enhanced Shadows** for depth perception
- **Color-coded Roles**:
  - 🔵 Blue for Admin
  - 🟣 Purple for Students
  - 🟠 Orange for Teachers
  - 🟢 Green for Success/Registration

### UX Features
- **Responsive Tables** with hover highlighting
- **Form Focus States** with colored glows
- **Animated Alerts** for messages
- **Smooth Transitions** on all interactions
- **Mobile-Friendly** layout
- **Accessible** navigation

---

## 🧪 Testing

### Manual Testing Checklist

#### Authentication
- [ ] Admin login works
- [ ] Teacher login works
- [ ] Student login works
- [ ] Role validation prevents wrong-role access
- [ ] Logout clears session
- [ ] New user registration works
- [ ] Registration number required for students

#### Admin Features
- [ ] Add course with course code
- [ ] Edit course details
- [ ] Delete course (removes enrollments)
- [ ] Assign teacher to course
- [ ] Reassign teacher

#### Student Features
- [ ] Browse all courses
- [ ] Enroll in course
- [ ] View registered courses
- [ ] See teacher names in enrolled courses

#### Teacher Features
- [ ] View assigned courses
- [ ] Click "View Students"
- [ ] See student names and registration numbers

### Database Verification

```bash
/opt/lampp/bin/mysql -u root course_management

-- Check record counts
SELECT COUNT(*) FROM admin;      -- Should be 2
SELECT COUNT(*) FROM teacher;    -- Should be 3
SELECT COUNT(*) FROM student;    -- Should be 3
SELECT COUNT(*) FROM courses;    -- Should be 5
SELECT COUNT(*) FROM enrollments;-- Should be 8
```

---

## 🐛 Troubleshooting

### Database Connection Issues

**Problem**: Can't connect to database

**Solution**:
```bash
# Check if MySQL is running
sudo /opt/lampp/lampp status

# Start MySQL
sudo /opt/lampp/lampp startmysql

# Verify database exists
/opt/lampp/bin/mysql -u root -e "SHOW DATABASES LIKE 'course_management';"
```

### Tomcat Port Conflict

**Problem**: Port 8080 already in use

**Solution**:
```bash
# Find process using port 8080
sudo lsof -i :8080

# Kill the process
sudo kill -9 <PID>

# Or change Tomcat port in server.xml
```

### Build Errors in Eclipse

**Problem**: Servlet classes not found

**Solution**:
1. Right-click project → **Properties**
2. **Java Build Path** → **Libraries**
3. **Add Library** → **Server Runtime** → Select Tomcat
4. **Project** → **Clean** → **Clean All Projects**
5. Restart server

### Page Not Found (404)

**Problem**: JSP pages return 404

**Solution**:
1. Verify project is deployed
2. Check server console for errors
3. Clean Tomcat work directory
4. Right-click server → **Clean**
5. Right-click server → **Publish**

---

## 🤝 Contributing

This is an educational project. Contributions for learning purposes are welcome!

### How to Contribute

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

---

## 📄 License

This project is created for **educational purposes** as part of Lab 3: Servlet Project.

---

## 👨‍💻 Authors

- **Nahid Gazi** - Student ID: 2022331048
- **Rahat Farabi** - Student ID: 2022331096  
- **Ridoy Bariya** - Student ID: 2022331070

**Course**: Web Programming Lab  
**Institution**: Your University Name  
**Project**: Lab 3 - Servlet-based Course Management System

---

## 🙏 Acknowledgments

- **Bootstrap Team** - For the excellent CSS framework
- **Google Fonts** - For the Inter font family
- **MySQL** - For the robust database system
- **Apache Tomcat** - For the reliable servlet container
- **Stack Overflow Community** - For troubleshooting help

---

## 📞 Support

For issues or questions:
1. Check the [Troubleshooting](#troubleshooting) section
2. Review the [Testing](#testing) checklist
3. Verify database setup is complete
4. Check Tomcat console for errors

---

## 🎯 Future Enhancements

Potential improvements for future versions:

- [ ] **Password Encryption** using BCrypt
- [ ] **Email Notifications** for enrollment
- [ ] **Course Categories** and filtering
- [ ] **Student Grades** and transcripts
- [ ] **Attendance Tracking** system
- [ ] **Course Materials** upload/download
- [ ] **Discussion Forums** for courses
- [ ] **REST API** for mobile apps
- [ ] **Export Reports** to PDF/Excel
- [ ] **Dark Mode** toggle

---

<div align="center">

**⭐ Star this repo if you found it helpful!**

Made with ❤️ for Web Programming Lab

</div>
