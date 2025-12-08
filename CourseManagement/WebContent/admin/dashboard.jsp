<%@ page import="dao.CourseDAO, dao.TeacherDAO, java.util.List, model.Course, model.Teacher" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
      <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"admin".equals(user.getRole())) {
        response.sendRedirect("../index.jsp"); return; } %>
        <% CourseDAO cdao=new CourseDAO(); List<Course> courses = cdao.listAll();
          TeacherDAO tdao=new TeacherDAO(); List<Teacher> teachers = tdao.getAllTeachers();
            request.setAttribute("courses", courses);
            request.setAttribute("teachers", teachers);
            %>
            <!doctype html>
            <html>

            <head>
              <meta charset="utf-8" />
              <title>Admin Dashboard</title>
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body class="p-4">
              <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                  <h3>Admin Dashboard</h3>
                  <div>Welcome, <b>
                      <%= user.getName() %>
                    </b> | <a href="<%= request.getContextPath() %>/logout">Logout</a></div>
                </div>

                <hr />
                <h5>Courses</h5>

                <!-- Success/Error Messages -->
                <% if (request.getParameter("success") !=null) { %>
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <%= request.getParameter("success") %>
                      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
                  <% } %>
                    <% if (request.getParameter("error") !=null) { %>
                      <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <%= request.getParameter("error") %>
                          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                      </div>
                      <% } %>

                        <table class="table table-bordered">
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
                                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                  </form>
                                </td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>

                        <h5 class="mt-4">Add Course</h5>
                        <form action="${pageContext.request.contextPath}/admin/addCourse" method="post" class="row g-3">
                          <div class="col-md-2">
                            <input type="text" name="courseCode" class="form-control"
                              placeholder="Course Code (e.g., CS101)" required />
                          </div>
                          <div class="col-md-3">
                            <input type="text" name="name" class="form-control" placeholder="Course name" required />
                          </div>
                          <div class="col-md-3">
                            <input type="text" name="description" class="form-control" placeholder="Description" />
                          </div>
                          <div class="col-md-3">
                            <select name="teacherId" class="form-select">
                              <option value="">No Teacher Assigned</option>
                              <c:forEach var="t" items="${teachers}">
                                <option value="${t.id}">${t.name}</option>
                              </c:forEach>
                            </select>
                          </div>
                          <div class="col-md-1">
                            <button class="btn btn-success w-100" type="submit">Add</button>
                          </div>
                        </form>

                        <h5 class="mt-4">Assign Teacher to Course</h5>
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
                            <button class="btn btn-primary w-100" type="submit">Assign</button>
                          </div>
                        </form>
              </div>
            </body>

            </html>