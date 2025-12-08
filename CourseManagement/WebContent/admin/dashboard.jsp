<%@ page import="dao.CourseDAO, dao.TeacherDAO, java.util.List, model.Course, model.Teacher" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
      <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"admin".equals(user.getRole())) {
        response.sendRedirect("../index.jsp");return; } %>
        <% CourseDAO cdao=new CourseDAO(); List<Course> courses = cdao.listAll();
          TeacherDAO tdao = new TeacherDAO(); List<Teacher> teachers = tdao.getAllTeachers();
            request.setAttribute("courses", courses);
            request.setAttribute("teachers", teachers);
            %>
            <!doctype html>
            <html>

            <head>
              <meta charset="utf-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <title>Admin Dashboard - Course Management</title>
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
              <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css"
                rel="stylesheet">
              <style>
                @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

                * {
                  margin: 0;
                  padding: 0;
                  box-sizing: border-box;
                }

                body {
                  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
                  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                  min-height: 100vh;
                  padding: 2rem 0;
                }

                .container {
                  background: #ffffff;
                  border-radius: 20px;
                  padding: 2.5rem;
                  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.12), 0 0 0 1px rgba(0, 0, 0, 0.05);
                  max-width: 1200px;
                  animation: slideUp 0.6s ease-out;
                }

                @keyframes slideUp {
                  from {
                    opacity: 0;
                    transform: translateY(30px);
                  }

                  to {
                    opacity: 1;
                    transform: translateY(0);
                  }
                }

                .page-header {
                  display: flex;
                  justify-content: space-between;
                  align-items: center;
                  margin-bottom: 2rem;
                  padding-bottom: 1.5rem;
                  border-bottom: 2px solid #f0f2f8;
                }

                .page-header h3 {
                  color: #1a1f36;
                  font-weight: 700;
                  font-size: 1.8rem;
                  margin: 0;
                  display: flex;
                  align-items: center;
                  gap: 0.75rem;
                }

                .page-header h3 i {
                  background: linear-gradient(135deg, #4A90E2 0%, #50E3C2 100%);
                  -webkit-background-clip: text;
                  -webkit-text-fill-color: transparent;
                  background-clip: text;
                }

                .user-info {
                  display: flex;
                  align-items: center;
                  gap: 1rem;
                }

                .user-name {
                  color: #374151;
                  font-weight: 600;
                  font-size: 0.95rem;
                }

                .user-info a {
                  color: #4A90E2;
                  text-decoration: none;
                  font-weight: 600;
                  padding: 0.5rem 1rem;
                  border-radius: 8px;
                  transition: all 0.3s ease;
                  background: linear-gradient(135deg, #f0f7ff 0%, #e6f2ff 100%);
                }

                .user-info a:hover {
                  background: linear-gradient(135deg, #4A90E2 0%, #357ABD 100%);
                  color: #ffffff;
                  transform: translateY(-2px);
                  box-shadow: 0 4px 12px rgba(74, 144, 226, 0.3);
                }

                .section-title {
                  color: #1a1f36;
                  font-weight: 700;
                  font-size: 1.3rem;
                  margin: 2rem 0 1rem;
                  display: flex;
                  align-items: center;
                  gap: 0.5rem;
                }

                .section-title i {
                  color: #4A90E2;
                }

                .table {
                  background: #ffffff;
                  border-radius: 12px;
                  overflow: hidden;
                  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                }

                .table thead {
                  background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                }

                .table thead th {
                  color: #374151;
                  font-weight: 700;
                  text-transform: uppercase;
                  font-size: 0.75rem;
                  letter-spacing: 0.5px;
                  padding: 1rem;
                  border: none;
                }

                .table tbody td {
                  padding: 1rem;
                  vertical-align: middle;
                  color: #4b5563;
                  border-bottom: 1px solid #f3f4f6;
                }

                .table tbody tr:last-child td {
                  border-bottom: none;
                }

                .table tbody tr:hover {
                  background: linear-gradient(135deg, #f9fafb 0%, #f3f4f6 50%);
                }

                .form-control,
                .form-select {
                  border: 2px solid #e5e7eb;
                  border-radius: 10px;
                  padding: 0.65rem 1rem;
                  font-size: 0.95rem;
                  transition: all 0.3s ease;
                }

                .form-control:focus,
                .form-select:focus {
                  border-color: #4A90E2;
                  box-shadow: 0 0 0 4px rgba(74, 144, 226, 0.1);
                  outline: none;
                }

                .btn {
                  border-radius: 10px;
                  padding: 0.65rem 1.5rem;
                  font-weight: 600;
                  font-size: 0.95rem;
                  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                  border: none;
                }

                .btn-success {
                  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                  box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
                }

                .btn-success:hover {
                  background: linear-gradient(135deg, #059669 0%, #047857 100%);
                  transform: translateY(-2px);
                  box-shadow: 0 6px 20px rgba(16, 185, 129, 0.4);
                }

                .btn-primary {
                  background: linear-gradient(135deg, #4A90E2 0%, #357ABD 100%);
                  box-shadow: 0 4px 12px rgba(74, 144, 226, 0.3);
                }

                .btn-primary:hover {
                  background: linear-gradient(135deg, #357ABD 0%, #2868A6 100%);
                  transform: translateY(-2px);
                  box-shadow: 0 6px 20px rgba(74, 144, 226, 0.4);
                }

                .btn-danger {
                  background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                  box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);
                }

                .btn-danger:hover {
                  background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                  transform: translateY(-2px);
                  box-shadow: 0 4px 16px rgba(239, 68, 68, 0.4);
                }

                .alert {
                  border-radius: 12px;
                  border: none;
                  padding: 1rem 1.25rem;
                  font-weight: 500;
                  animation: slideIn 0.4s ease-out;
                }

                @keyframes slideIn {
                  from {
                    opacity: 0;
                    transform: translateX(-20px);
                  }

                  to {
                    opacity: 1;
                    transform: translateX(0);
                  }
                }

                .alert-success {
                  background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
                  color: #065f46;
                }

                .alert-danger {
                  background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
                  color: #b91c1c;
                }

                /* Form sections */
                .form-section {
                  background: linear-gradient(135deg, #f9fafb 0%, #ffffff 100%);
                  padding: 1.5rem;
                  border-radius: 12px;
                  margin-top: 1.5rem;
                  border: 2px solid #f0f2f8;
                }

                @media (max-width: 768px) {
                  .container {
                    padding: 1.5rem;
                  }

                  .page-header {
                    flex-direction: column;
                    gap: 1rem;
                    align-items: flex-start;
                  }
                }
              </style>
            </head>

            <body>
              <div class="container">
                <div class="page-header">
                  <h3><i class="bi bi-speedometer2"></i> Admin Dashboard</h3>
                  <div class="user-info">
                    <span class="user-name"><i class="bi bi-person-circle"></i>
                      <%= user.getName() %>
                    </span>
                    <a href="<%= request.getContextPath() %>/logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
                  </div>
                </div>

                <h5 class="section-title"><i class="bi bi-journal-code"></i> All Courses</h5>

                <!-- Success/Error Messages -->
                <% if (request.getParameter("success") !=null) { %>
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    <%= request.getParameter("success") %>
                      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
                  <% } %>
                    <% if (request.getParameter("error") !=null) { %>
                      <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        <%= request.getParameter("error") %>
                          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                      </div>
                      <% } %>

                        <table class="table">
                          <thead>
                            <tr>
                              <th>Course Code</th>
                              <th>Name</th>
                              <th>Description</th>
                              <th>Teacher</th>
                              <th>Actions</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="c" items="${courses}">
                              <tr>
                                <td><strong>${c.courseCode}</strong></td>
                                <td>${c.name}</td>
                                <td>${c.description}</td>
                                <td>${c.teacherName}</td>
                                <td>
                                  <form action="${pageContext.request.contextPath}/admin/deleteCourse" method="post"
                                    style="display:inline;"
                                    onsubmit="return confirm('Are you sure you want to delete this course? This will also remove all student enrollments.');">
                                    <input type="hidden" name="courseId" value="${c.id}" />
                                    <button type="submit" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i>
                                      Delete</button>
                                  </form>
                                </td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>

                        <div class="form-section">
                          <h5 class="section-title"><i class="bi bi-plus-circle"></i> Add New Course</h5>
                          <form action="${pageContext.request.contextPath}/admin/addCourse" method="post"
                            class="row g-3">
                            <div class="col-md-2">
                              <input type="text" name="courseCode" class="form-control" placeholder="CS101" required />
                            </div>
                            <div class="col-md-3">
                              <input type="text" name="name" class="form-control" placeholder="Course name" required />
                            </div>
                            <div class="col-md-3">
                              <input type="text" name="description" class="form-control" placeholder="Description" />
                            </div>
                            <div class="col-md-3">
                              <select name="teacherId" class="form-select">
                                <option value="">No Teacher</option>
                                <c:forEach var="t" items="${teachers}">
                                  <option value="${t.id}">${t.name}</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-1">
                              <button class="btn btn-success w-100" type="submit"><i class="bi bi-plus"></i></button>
                            </div>
                          </form>
                        </div>

                        <div class="form-section">
                          <h5 class="section-title"><i class="bi bi-person-check"></i> Assign Teacher to Course</h5>
                          <form action="${pageContext.request.contextPath}/admin/assignTeacher" method="post"
                            class="row g-3">
                            <div class="col-md-3">
                              <input type="text" name="courseCode" class="form-control" placeholder="Course Code"
                                required />
                            </div>
                            <div class="col-md-4">
                              <select name="teacherId" class="form-select" required>
                                <option value="">Select Teacher</option>
                                <c:forEach var="t" items="${teachers}">
                                  <option value="${t.id}">${t.name}</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-2">
                              <button class="btn btn-primary w-100" type="submit"><i
                                  class="bi bi-arrow-right-circle"></i> Assign</button>
                            </div>
                          </form>
                        </div>
              </div>

              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>