<%@ page import="dao.CourseDAO, dao.UserDAO, java.util.List, model.Course" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
      <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"admin".equals(user.getRole())) {
        response.sendRedirect("../index.jsp"); return; } %>
        <% CourseDAO cdao=new CourseDAO(); List<Course> courses = cdao.listAll();
          request.setAttribute("courses", courses);
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
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Teacher</th>
                            <th>Actions</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="c" items="${courses}">
                            <tr>
                              <td>${c.id}</td>
                              <td>${c.name}</td>
                              <td>${c.description}</td>
                              <td>${c.teacherName}</td>
                              <td>
                                <a href="edit-course.jsp?id=${c.id}" class="btn btn-sm btn-warning">Edit</a>
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
                      <form action="${pageContext.request.contextPath}/admin/addCourse" method="post"
                        class="form-inline">
                        <input type="text" name="name" class="form-control mb-2 mr-2" placeholder="Course name"
                          required />
                        <input type="text" name="description" class="form-control mb-2 mr-2"
                          placeholder="Description" />
                        <input type="number" name="teacherId" class="form-control mb-2 mr-2"
                          placeholder="Teacher ID (optional)" />
                        <button class="btn btn-success mb-2" type="submit">Add</button>
                      </form>

                      <h5 class="mt-4">Assign Teacher</h5>
                      <p>Use teacher id (see users table) to assign. (You can extend UI to list teachers).</p>
                      <form action="${pageContext.request.contextPath}/admin/assignTeacher" method="post"
                        class="form-inline">
                        <input type="number" name="courseId" class="form-control mb-2 mr-2" placeholder="Course ID"
                          required />
                        <input type="number" name="teacherId" class="form-control mb-2 mr-2"
                          placeholder="Teacher ID (or leave blank)" />
                        <button class="btn btn-primary mb-2" type="submit">Assign</button>
                      </form>
            </div>
          </body>

          </html>