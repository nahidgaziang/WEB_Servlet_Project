<%@ page import="dao.CourseDAO, java.util.List, model.Course" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
      <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"student".equals(user.getRole()))
        { response.sendRedirect("../index.jsp"); return; } CourseDAO cdao=new CourseDAO(); List<Course> courses =
        cdao.listAll();
        request.setAttribute("courses", courses);
        %>
        <!doctype html>
        <html>

        <head>
          <meta charset="utf-8" />
          <title>Available Courses</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        </head>

        <body class="p-4">
          <div class="container">
            <div class="d-flex justify-content-between align-items-center">
              <h3>Available Courses</h3>
              <div>Welcome, <b>
                  <%= user.getName() %>
                </b> | <a href="<%= request.getContextPath() %>/logout">Logout</a></div>
            </div>

            <table class="table mt-3">
              <thead>
                <tr>
                  <th>Course</th>
                  <th>Description</th>
                  <th>Teacher</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="c" items="${courses}">
                  <tr>
                    <td>${c.name}</td>
                    <td>${c.description}</td>
                    <td>${c.teacherName}</td>
                    <td>
                      <form action="${pageContext.request.contextPath}/student/register" method="post"
                        style="display:inline;">
                        <input type="hidden" name="courseId" value="${c.id}" />
                        <button type="submit" class="btn btn-primary btn-sm">Enroll</button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/student/registered.jsp" class="btn btn-secondary">My Registered
              Courses</a>
          </div>
        </body>

        </html>