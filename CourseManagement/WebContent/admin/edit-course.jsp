<%@ page import="dao.CourseDAO, model.Course" %>
  <%@ page session="true" %>
    <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"admin".equals(user.getRole())) {
      response.sendRedirect("../index.jsp"); return; } int courseId=Integer.parseInt(request.getParameter("id"));
      CourseDAO cdao=new CourseDAO(); Course course=cdao.getCourseById(courseId); if (course==null) {
      response.sendRedirect("dashboard.jsp"); return; } %>
      <!doctype html>
      <html>

      <head>
        <meta charset="utf-8" />
        <title>Edit Course</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
      </head>

      <body class="p-4">
        <div class="container" style="max-width:600px;">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>Edit Course</h3>
            <a href="dashboard.jsp" class="btn btn-secondary btn-sm">Back to Dashboard</a>
          </div>

          <div class="card">
            <div class="card-body">
              <form action="${pageContext.request.contextPath}/admin/updateCourse" method="post">
                <input type="hidden" name="courseId" value="<%= course.getId() %>" />

                <div class="form-group">
                  <label for="name">Course Name *</label>
                  <input type="text" class="form-control" id="name" name="name" value="<%= course.getName() %>"
                    required />
                </div>

                <div class="form-group">
                  <label for="description">Description</label>
                  <textarea class="form-control" id="description" name="description"
                    rows="3"><%= course.getDescription() != null ? course.getDescription() : "" %></textarea>
                </div>

                <div class="form-group">
                  <label for="teacherId">Teacher ID (optional)</label>
                  <input type="number" class="form-control" id="teacherId" name="teacherId"
                    value="<%= course.getTeacherId() != null ? course.getTeacherId() : "" %>"
                    placeholder="Leave blank for no teacher" />
                  <small class="form-text text-muted">
                    Current teacher: <strong>
                      <%= course.getTeacherName() !=null ? course.getTeacherName() : "None" %>
                    </strong>
                  </small>
                </div>

                <button type="submit" class="btn btn-primary">Update Course</button>
                <a href="dashboard.jsp" class="btn btn-secondary">Cancel</a>
              </form>
            </div>
          </div>
        </div>
      </body>

      </html>