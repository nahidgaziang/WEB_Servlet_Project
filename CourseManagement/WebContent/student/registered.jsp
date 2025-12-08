<%@ page session="true" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="dao.EnrollmentDAO, java.util.List, model.Course" %>
      <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"student".equals(user.getRole()))
        { response.sendRedirect("../index.jsp"); return; } EnrollmentDAO edao=new EnrollmentDAO();
        java.util.List<Course> mycourses = edao.getCoursesOfStudent(user.getId());
        request.setAttribute("mycourses", mycourses);
        %>
        <!doctype html>
        <html>

        <head>
          <meta charset="utf-8" />
          <title>My Courses</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        </head>

        <body class="p-4">
          <div class="container">
            <h3>My Registered Courses</h3>
            <a href="${pageContext.request.contextPath}/student/courses.jsp" class="btn btn-secondary mb-3">Back</a>
            <ul class="list-group">
              <c:forEach var="c" items="${mycourses}">
                <li class="list-group-item"><b>${c.name}</b> - ${c.description}</li>
              </c:forEach>
              <c:if test="${empty mycourses}">
                <li class="list-group-item">You are not registered in any course.</li>
              </c:if>
            </ul>
          </div>
        </body>

        </html>