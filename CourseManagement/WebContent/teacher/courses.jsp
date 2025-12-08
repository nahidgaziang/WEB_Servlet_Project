<%@ page import="dao.CourseDAO, java.util.List, model.Course" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
      <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"teacher".equals(user.getRole()))
        { response.sendRedirect("../index.jsp"); return; } CourseDAO cdao=new CourseDAO(); List<Course> courses =
        cdao.getByTeacher(user.getId());
        request.setAttribute("courses", courses);
        %>
        <!doctype html>
        <html>

        <head>
          <meta charset="utf-8" />
          <title>Teacher Courses</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        </head>

        <body class="p-4">
          <div class="container">
            <div class="d-flex justify-content-between align-items-center">
              <h3>Your Courses</h3>
              <div>Welcome, <b>
                  <%= user.getName() %>
                </b> | <a href="<%= request.getContextPath() %>/logout">Logout</a></div>
            </div>

            <table class="table table-bordered mt-3">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Description</th>
                  <th>Students</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="c" items="${courses}">
                  <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.description}</td>
                    <td>
                      <a class="btn btn-sm btn-info"
                        href="${pageContext.request.contextPath}/teacher/viewStudents?courseId=${c.id}">View
                        Students</a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </body>

        </html>