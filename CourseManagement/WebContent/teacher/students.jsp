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
          <ul class="list-group">
            <c:forEach var="s" items="${students}">
              <li class="list-group-item">${s}</li>
            </c:forEach>
            <c:if test="${empty students}">
              <li class="list-group-item">No students enrolled yet.</li>
            </c:if>
          </ul>
        </div>
      </body>

      </html>