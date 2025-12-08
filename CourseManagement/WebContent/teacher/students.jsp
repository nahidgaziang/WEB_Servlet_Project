<%@ page session="true" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <% model.User user=(model.User) session.getAttribute("user"); if (user==null || !"teacher".equals(user.getRole())) {
      response.sendRedirect("../index.jsp"); return; } %>
      <!doctype html>
      <html>

      <head>
        <meta charset="utf-8" />
        <title>Students</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
      </head>

      <body class="p-4">
        <div class="container">
          <h3>Students in Course</h3>
          <a href="${pageContext.request.contextPath}/teacher/courses.jsp" class="btn btn-secondary mb-3">Back</a>

          <c:if test="${not empty students}">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Student Name</th>
                  <th>Registration Number</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="student" items="${students}">
                  <tr>
                    <td>${student[0]}</td>
                    <td><strong>${student[1]}</strong></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </c:if>

          <c:if test="${empty students}">
            <div class="alert alert-info">No students enrolled yet.</div>
          </c:if>
        </div>
      </body>

      </html>